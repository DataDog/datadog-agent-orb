# For this tests to work the following environmental variables have to be set
# DD_API_KEY
# DD_AGENT_MAJOR_VERSION
# DD_SITE

setup() {
    source ./src/scripts/setup.sh
    source ./src/scripts/stop.sh
}

@test '1: Check agent installed and then stopped' {
    # Check if the install was already run
    run which datadog-agent
    if [ "$status" -ne 0 ]; then
        Install
    fi

    StopAgent
    run datadog-agent status # If the agent did not install and is not running this will fail
    [ "$status" -ne 0 ]
}