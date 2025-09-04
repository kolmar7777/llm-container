## Prerequisites
- Docker
- Docker-compose

## Instruction to install
Local installation:

1) Clone repo:
```bash
git clone https://github.com/kolmar7777/llm-container.git
```

2) Create models folder in repo:
```bash
cd llm-container
mkdir models
```

3) Place your own models .gguf (f.e. model_a.gguf, ..., model_c.gguf).

4) Build your own docker image (f.e. named as llm_container_cpu by default):
```bash
docker build -t llm_container_cpu . 
```

5) Change your own .env.local as showed in an example:
```bash
pwd
```
for know your current full path.

6) Run containers using docker compose:
```bash
docker compose --env-file .env.local -f docker-compose.local.cpu.yml up -d
```

7 Stop docker compose with containers:
```bash
docker compose --env-file .env.local -f docker-compose.local.cpu.yml down
```

