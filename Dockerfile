FROM python:slim-buster

LABEL PROJECT_REPO_URL         = "git@gitlab.com:felixgomez/gitlab-skyline.git" \
      PROJECT_REPO_BROWSER_URL = "https://gitlab.com/felixgomez/gitlab-skyline" \
      DESCRIPTION              = "GitLab Skylines"

WORKDIR /app
ADD requirements.txt requirements.txt
RUN apt update && apt upgrade -y && apt install -y python3 openscad gcc
RUN pip install -r /app/requirements.txt

ADD gitlab-skyline /app/gitlab-skyline
ADD gitlab.svg /app/gitlab-skyline

WORKDIR /data
VOLUME /data
ENTRYPOINT ["/app/gitlab-skyline"]
CMD ["--help"]
