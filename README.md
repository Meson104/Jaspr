# Jaspr

**A Retrieval-Augmented Generation (RAG) AI Mobile App**  
_Built with Flutter + FastAPI | Powered by Gemini, Tavily, Sentence Transformers_

---

## Overview

Jaspr is an AI-powered mobile application that combines **real-time retrieval, semantic search, and generative AI** to deliver context-aware, source-backed answers.

It bridges a **Flutter frontend** and **FastAPI backend** with WebSocket streaming for instant, interactive responses.

---

## ✨ Features

🔎 **Retrieval-Augmented Generation (RAG):** Combines search + LLMs for accurate, grounded responses.
🌐 **Tavily API Integration:** Retrieves high-quality URLs & knowledge sources.
📄 **Trafalatura HTML Parsing:** Extracts clean text from web pages.
🧠 **Sentence Transformers (all-MiniLM-L6-v2):** Embeddings + cosine similarity search for semantic retrieval.
🤖 **Gemini API:** Generates context-rich answers with sources.
⚡ **WebSockets:** Delivers streaming responses in real-time.
📱 **Cross-platform Flutter Frontend:** Modern UI with smooth interactions.

---

## 🛠️ Tech Stack

- **Frontend:** Flutter
- **Backend:** FastAPI + WebSockets
- **APIs:** Tavily API, Gemini API
- **NLP:** Sentence Transformers (all-MiniLM-L6-v2)
- **Parsing:** Trafalatura

---

## ⚙️ Architecture

```mermaid
flowchart TD
    A[Flutter Mobile App] -->|Query| B[FastAPI Backend]
    B -->|Search| C[Tavily API]
    B -->|Parse| D[Trafalatura]
    B -->|Embed| E[Sentence Transformers]
    E -->|Semantic Search| B
    B -->|Generate| F[Gemini API]
    F -->|Stream| A
```
