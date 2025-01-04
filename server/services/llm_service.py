from urllib import response
import google.generativeai as genai
from ast import List

from config import Settings

settings = Settings()


class LLMService:
    def __init__(self):
        genai.configure(api_key= settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel(model_name="gemini-2.0-flash-exp")
        
    def generate_response(self,query:str,search_results:list[dict]):
        context_text = "\n\n".join([
            f"Source {i+1} ({results['url']}) :\n {results['content']}"
            for i,results in enumerate(search_results)
        ])

        full_prompt = f"""
        context from web search :
        {context_text}
        Query : {query}
        Please provide a comprehensive , well-cited , detailed accurate response using the above context. Think and reason deeply. Ensure it answers the query of the user. Do not repeate the query and do not use your own knowledge unless it is absolutely necessary. Your task is simply transform this context_text into a comprehensive response
        
        
        """
        response = self.model.generate_content(full_prompt,stream=True)

        for packets in response:
            yield packets.text