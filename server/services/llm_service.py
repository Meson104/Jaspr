import google.generativeai as genai
from ast import List

from config import Settings

settings = Settings()


class LLMService:
    def __init__(self):
        genai.configure(api_key= settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel(model_name="gemini-2.0-flash-exp")
        
    def generate_results(self,query:str,search_results:list[dict]):
        pass