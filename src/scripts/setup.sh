Install() {
    PARAM_DD_API_KEY=$(eval echo "\$$PARAM_DD_API_KEY")
    DD_API_KEY=${PARAM_DD_API_KEY} DD_AGENT_MAJOR_VERSION=${PARAM_DD_AGENT_MAJOR_VERSION} DD_SITE=${PARAM_DD_SITE} \
        DD_HOSTNAME="none" DD_INSTALL_ONLY="true" DD_APM_ENABLED="true" \
        bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

    if [ "$UID" = "0" ]; then export SUDO=''; else export SUDO='sudo'; fi
    $SUDO find /etc/datadog-agent/conf.d/ -iname "*.yaml.default" -delete

    if ! command -v service &> /dev/null
    then
        $SUDO systemctl start datadog-agent
    else
        $SUDO service datadog-agent start
    fi
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
