```
source .env \
&& docker build -t pinecone_cosine_test . \
--build-arg PINECONE_API_KEY=$PINECONE_API_KEY \
&& docker run --memory=4g -v $(pwd):/app -p 8888:8888 pinecone_cosine_test
```