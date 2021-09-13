Install() {
    DD_API_KEY=${DD_API_KEY} DD_AGENT_MAJOR_VERSION=${DD_AGENT_MAJOR_VERSION} DD_SITE=${DD_SITE} \
        DD_HOSTNAME="none" DD_INSTALL_ONLY="true" \
        bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

    if [ "$(echo "$UID")" = "0" ]; then export SUDO=''; else export SUDO='sudo'; fi
    $SUDO find /etc/datadog-agent/conf.d/ -iname "*.yaml.default" -delete
    $SUDO service datadog-agent start
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi