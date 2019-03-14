FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y python
ENV NAME MikeyB
COPY hello.py .
ENTRYPOINT ["python", "hello.py"]
