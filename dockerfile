FROM ubuntu:latest
ENV GITHUB_TOKEN="" \
    TZ="Etc/UTC" \
    GITHUB_README_STREAK_STATS_PATH=/mnt/github-readme-streak-stats
ARG DEBIAN_FRONTEND=noninteractive
COPY . $GITHUB_README_STREAK_STATS_PATH
WORKDIR $GITHUB_README_STREAK_STATS_PATH
RUN apt-get update && \
    apt-get install -y php php-curl php-xml composer inkscape
RUN composer install
EXPOSE 8000
RUN chmod +x $GITHUB_README_STREAK_STATS_PATH/docker/entrypoint.sh
#Uncomment CMD and comment out ENTRYPOINT for debugging of the image
#CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "./docker/entrypoint.sh" ]