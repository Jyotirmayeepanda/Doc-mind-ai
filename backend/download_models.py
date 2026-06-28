"""Pre-download ML models during setup so first upload is fast."""
import os
from dotenv import load_dotenv

load_dotenv()

EMBEDDING_MODEL = os.getenv("EMBEDDING_MODEL", "BAAI/bge-small-en-v1.5")
RERANKER_MODEL  = os.getenv("RERANKER_MODEL", "cross-encoder/ms-marco-MiniLM-L-6-v2")

print()
print("=" * 50)
print("  Downloading AI models (one-time only)")
print("=" * 50)
print()
print(f"[1/2] Embedding model: {EMBEDDING_MODEL}")
print("      ~130MB — please wait, do NOT close this window...")
print()

from langchain_community.embeddings import HuggingFaceEmbeddings

HuggingFaceEmbeddings(
    model_name=EMBEDDING_MODEL,
    encode_kwargs={"normalize_embeddings": True},
)
print("      Done!")
print()
print(f"[2/2] Reranker model: {RERANKER_MODEL}")
print("      ~90MB — almost there...")
print()

from sentence_transformers import CrossEncoder

CrossEncoder(RERANKER_MODEL)
print("      Done!")
print()
print("=" * 50)
print("  All models ready! Upload will be fast now.")
print("=" * 50)
print()
