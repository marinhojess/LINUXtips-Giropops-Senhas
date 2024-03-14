FROM python:3.13.0a4
WORKDIR /app
COPY . ./
ENV REDIS_HOST=172.17.0.2
RUN apt update && apt install pip -y
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]

