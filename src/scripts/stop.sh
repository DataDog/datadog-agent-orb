StopAgent() {
    if [ "$UID" = "0" ]; then export SUDO=''; else export SUDO='sudo'; fi
    if ! command -v service &> /dev/null
    then
        $SUDO systemctl stop datadog-agent
    else
        $SUDO service datadog-agent stop
    fi
}


# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    StopAgent
fi