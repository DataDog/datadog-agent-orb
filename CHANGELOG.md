# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.1.2] - 2022-02-04
## Added
    - Wait for agent to be ready before continuing

## [3.1.1] - 2021-11-10
## Fixed
    - Typo stopping the usage of `DD_SITE` to set the Datadog site.

## [3.1.0] - 2021-11-09
## Added
    - Can now use `DD_SITE` to pass the Datadog site.

## [3.0.0] - 2021-09-16
### Changed
    - agent setup command documentation

## [2.0.0] - 2021-09-14
### Added
    - Paramerized the commands inputs
### Changed
    - Moved to use the orb SDK
### Removed
    - Environmental variables for Datadog API key, site and agent version.
