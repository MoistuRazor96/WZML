FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY moisturazor.txt .
RUN pip3 install --no-cache-dir -r moisturazor.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo

COPY . .

CMD ["bash", "start.sh"]
