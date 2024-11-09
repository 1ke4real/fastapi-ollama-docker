# AutoTrust RC Engine: AI API with FastAPI and Ollama

AutoTrust RC Engine is an AI-powered API project developed using [FastAPI](https://fastapi.tiangolo.com/) and [Ollama](https://ollama.com/), running in a Dockerized environment. This project utilizes the `llama3.2` model, which is trained on automotive data, to deliver responses through an API interface.

## Prerequisites

- **Docker** and **Docker Compose** must be installed on your system.

## Project Structure

- **FastAPI**: Python-based API server that exposes a `/chat` endpoint to interact with the AI model.
- **Ollama with llama3.2**: Separate Docker container running the `llama3.2` model, which provides responses to requests from FastAPI.
- **Makefile**: Contains convenient commands for managing Docker operations.

## Installation and Starting the Project

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <project-folder>
    ```
2.	Build Docker Images and Start Containers:

    ```bash
    make build
    ```

3.	Start the Containers:

    ```bash
    make start
    ```

4. To stop the containers, use the following command:
    ```bash
    make stop
    ```
5.	Clean Up Docker Resources:
    
       ```bash
       make clean
       ```
## API Usage

### Main Endpoint

- POST /chat
    Description: Sends a prompt to the llama3.2 model via Ollama and receives a response.
	  
- Request JSON:

```json
{
  "prompt": "Why is the sky blue?"
}
```

- Response JSON:
```json
{
    "response": "The sky appears blue due to the scattering of sunlight by the atmosphere..."
}
```

Request Example
```bash
curl -X POST "http://localhost:8000/chat" -H "Content-Type: application/json" -d '{"prompt": "Why is the sky blue?"}'
```

Container Configuration:
-   FastAPI runs in a dedicated Python container and exposes the API on port 8000.
-   Ollama runs the llama3.2 model in a separate container, accessible via HTTP requests from the FastAPI container.
