
from config import Settings


settings = Settings()

class SearchService:
    def web_search(self ,query:str):
        print(settings.TAVILY_API_KEY)