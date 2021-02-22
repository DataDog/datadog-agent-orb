# datadog-agent-orb
CircleCI Orb for running the Datadog Agent

### Usage

```yaml
version: 2.1

orbs:
  datadog-agent: datadog/agent@0.1

jobs:
  build:
    docker: 
      - image: circleci/python
    steps:
      - checkout
      - datadog-agent/setup
      - run: make test
      - datadog-agent/stop
```
