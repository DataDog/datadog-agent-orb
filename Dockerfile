FROM ubuntu:latest
RUN apt-get update -y && apt-get install bats curl -y
WORKDIR /datadog-agent-orb
CMD ["bats", "src/tests/"]