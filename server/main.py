
from fastapi import FastAPI

from pydantic_models.chat_body import ChatBody
from services.similarity_sortion import SimilaritySortion
from services.search_service import SearchService


app = FastAPI()

search_service = SearchService()
sort_sources = SimilaritySortion()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)
    sorted_results = sort_sources.sort_sources(body.query,search_results) 

    return body.query


    