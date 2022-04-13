Wait() {
    set +e
    attempts=0

    until [[ $attempts -eq 10 ]] || $SUDO datadog-agent health; do
        attempts=$((attempts+1))
        sleep_time=$(( attempts*5 < 30 ? attempts*5 : 30 ))
        echo "Waiting for agent to start up sleeping for ${sleep_time} seconds"
        sleep $sleep_time
    done

    if [[ $attempts -eq 10 ]]; then
        echo "Could not start the agent"
        exit 1
    else
        echo "Agent is ready"
    fi
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Wait
fi
