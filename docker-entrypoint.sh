#!/usr/bin/env sh
set -e

PORT="${PORT:-9010}"
MODEL_PATH="${MODEL_PATH:-/models}"
MODEL_NAME="${MODEL_NAME:-model.gguf}"
MODEL_FILE="${MODEL_PATH%/}/${MODEL_NAME}"

if [ ! -f "${MODEL_FILE}" ]; then
  echo "ERROR: Model file not found at ${MODEL_FILE}"
  echo "Ensure your host 'models' directory is mounted to ${MODEL_PATH} and MODEL_NAME is correct."
  exit 1
fi

# Optional: extra args for llama.cpp server, e.g. '--n_gpu_layers 35'
EXTRA_ARGS="${EXTRA_ARGS:-}"

exec "$@" --model "${MODEL_FILE}" --port "${PORT}" ${EXTRA_ARGS}

