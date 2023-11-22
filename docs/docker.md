# Build docker image
Build the image by running the following command in the reporoot.
```bash
docker build -t github-readme-streak-stats . --progress plain
```
# Create docker container
After building the image, you can run it by using either `docker run` or `docker compose`.
## Docker run
```bash
docker run --name github-streak -p 8000:8000 -e GITHUB_TOKEN=YOUR_GITHUB_TOKEN_HERE github-readme-streak-stats
```
## Docker compose
```yml
version: '3'
services:
  github-streak:
    container_name: github-streak
    image: github-readme-streak-stats
    ports:
     - 8000:8000
    environment:
     - GITHUB_TOKEN=YOUR_GITHUB_TOKEN_HERE
```