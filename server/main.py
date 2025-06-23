
import asyncio
from time import sleep
from fastapi import FastAPI, WebSocket
from fastapi.middleware.cors import CORSMiddleware
from pydantic_models.chat_body import ChatBody
from services.llm_service import LLMService
from services.similarity_sortion import SimilaritySortion
from services.search_service import SearchService
from config import Settings

app = FastAPI()
settings = Settings()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[f"{settings.SERVER_URI}"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

search_service = SearchService()
sort_sources = SimilaritySortion()
llm_service = LLMService()

#web socket 

@app.websocket("/ws/chat")
async def ws_chat_endpoint(websocket:WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")
        
        search_results = search_service.web_search(query)
        
        sorted_results = sort_sources.sort_sources(query,search_results)
        
        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result","data" : sorted_results})

        for packets in llm_service.generate_response(query,sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type":"content","data": packets})

        
    except:
        print("An unexpected error occured")
    finally:
        await websocket.close()
       







#chat

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)
    sorted_results = sort_sources.sort_sources(body.query,search_results)
    response = llm_service.generate_response(body.query,sorted_results) 

    return response


    