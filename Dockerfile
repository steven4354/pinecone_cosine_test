FROM ubuntu:20.04
FROM python:3.8

# Install system packages and dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget

# Install the packages listed in requirements.txt
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

# Set the working directory
WORKDIR /app

# Copy the Jupyter notebook files from the host to the container
COPY . .

# Set the environment variables using the values from the .env file
ARG PINECONE_API_KEY
ENV PINECONE_API_KEY=$PINECONE_API_KEY

# Expose the default Jupyter port
EXPOSE 8888

# Create a non-root user
RUN useradd -m jupyter
USER jupyter

# Run Jupyter when the container starts
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]