# Deploy RAG App To AWS

## Getting Started

### Installing Requirements

```sh
pip install -r requirements.txt
```

### Generate the database

```sh
# Execute from root directory.
python populate_database.py --reset
```

### Then Just Dockerize and host this Docker - Build your CDK and connect with AWS LAMBDA

```sh
# Execute from src directory
cd src
python rag_app/query_rag.py "how many types of VM are there?"
```