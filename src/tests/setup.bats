# For this tests to work the following environmental variables have to be set
# DD_API_KEY
# DD_AGENT_MAJOR_VERSION
# DD_SITE

setup() {
    source ./src/scripts/setup.sh
}

@test '1: Check agent installed and running' {
    Install
    if [ "$UID" = "0" ]; then export SUDO=''; else export SUDO='sudo'; fi
    $SUDO datadog-agent status # If the agent did not install and is not running this will fail
}