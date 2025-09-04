FROM python:3.11-slim

# System deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git cmake curl \
 && rm -rf /var/lib/apt/lists/*

# Python deps
RUN pip install --upgrade pip && \
    pip install llama-cpp-python[server]

WORKDIR /app

COPY app.py /usr/local/lib/python3.11/site-packages/llama_cpp/server/app.py

# Defaults (overridable at runtime)
ENV PORT=9010
ENV MODEL_PATH=/models
# Provide a default model name to avoid startup failure if not provided
ENV MODEL_NAME=model.gguf
ENV N_CTX=8192

# Entry script to resolve model path and port cleanly
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["python", "-m", "llama_cpp.server", "--host", "0.0.0.0"]

