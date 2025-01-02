from typing import List
import numpy as np

from sentence_transformers import SentenceTransformer


class SimilaritySortion:
    
    def __init__(self):
        self.embedding_model= SentenceTransformer("all-miniLM-L6-v2") 

    def sort_sources(self, query:str, search_results:list[dict]):
        relevant_docs = []
        query_embedding = self.embedding_model.encode(query)

        for res in search_results:
            res_embedding = self.embedding_model.encode(res["content"])
            similarity = np.dot(query_embedding,res_embedding) / (np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding))

            res['relevance_score'] = similarity

            if similarity > 0.4:
                relevant_docs.append(res)

        return sorted(relevant_docs, key=lambda x : x['relevance_score'], reverse=True)