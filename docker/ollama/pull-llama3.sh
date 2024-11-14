#!/bin/bash

ollama serve &

pid=$!

sleep 5

echo "Pulling llama3 model..."
ollama pull mistral

sleep 5

wait $pid