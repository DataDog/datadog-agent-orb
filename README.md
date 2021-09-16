# datadog-agent-orb

[![CircleCI Build Status](https://circleci.com/gh/DataDog/datadog-agent-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/datadog/datadog-agent-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/datadog/agent.svg)](https://circleci.com/orbs/registry/orb/datadog/datadog-agent-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/datadog/datadog-agent-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

CircleCI Orb for running the DataDog Agent to report test for [CI Test visibility](https://docs.datadoghq.com/continuous_integration/setup_tests/)

## Usage

```yaml
version: 2.1

orbs:
  datadog-agent: datadog/agent@2

jobs:
  build:
    docker: 
      - image: circleci/python
    steps:
      - checkout
      - datadog-agent/setup:
          agent_major_version: "7"
          api_key: DATADOG_API_KEY
          site: datadoghq.com
      - run: make test
      - datadog-agent/stop
```

## Running test locally

The test install configure and then stop an agent, doing this locally can cause issues so the suggested approach is to use the [Dockerfile](.Dockerfile) provided as so:

```
$ docker build -t test-orb .
$ docker run --rm --name bats-testing -v "${PWD}:/datadog-agent-orb" -e DD_API_KEY=$DATADOG_API_KEY -e DD_SITE="dd.datad0g.com" -e DD_AGENT_MAJOR_VERSION=7 -it test-orb

 ✓ 1: Check agent installed and running
 ✓ 1: Check agent installed and then stopped

2 tests, 0 failures
```

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/datadog/datadog-agent-orb) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.


### How to Publish
* Create and push a branch with your new features.
* When ready to publish a new production version, create a Pull Request from _feature branch_ to `main`.
* The title of the pull request must contain a special semver tag: `[semver:<segment>]` where `<segment>` is replaced by one of the following values.

| Increment | Description|
| ----------| -----------|
| major     | Issue a 1.0.0 incremented release|
| minor     | Issue a x.1.0 incremented release|
| patch     | Issue a x.x.1 incremented release|
| skip      | Do not issue a release|

Example: `[semver:major]`

* Squash and merge. Ensure the semver tag is preserved and entered as a part of the commit message.
* On merge, after manual approval, the orb will automatically be published to the Orb Registry.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

