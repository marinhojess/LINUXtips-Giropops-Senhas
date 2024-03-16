FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY . ./
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["-m", "flask", "run", "--host=0.0.0.0"]
