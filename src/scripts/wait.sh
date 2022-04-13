Wait() {
    set +e
    attempts=0
    max_attempts=240

    until [[ $attempts -eq $max_attempts ]]; do
      if $SUDO datadog-agent health; then
        echo "Agent is ready"
        exit 0
      fi

      attempts=$((attempts+1))
      echo "Waiting for agent to start, attempt no. ${attempts}"
      sleep 1
    done

    echo "Could not start the agent"
    exit 1
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Wait
fi
