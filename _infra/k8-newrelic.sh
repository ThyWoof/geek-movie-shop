#!/bin/sh

usage() {
  echo
  echo "k8-newrelic.sh: manage required manifests to monitor a k8 cluster from new relic"
  echo
  echo "  -a, applies new relic manifests"
  echo "  -c, creates new relic manifests"
  echo "  -d, deletes new relic manifests"
  echo
  echo "obs: must run from the _infra folder"
  echo
}

# enforce syntax
while getopts 'cad' OPT
do
  case $OPT in
    a)
      COMMAND=apply
      ;;
    c)
      COMMAND=create
      ;;
    d)
      COMMAND=delete
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

if [ -z $COMMAND ]
then
  usage
  exit 1
fi

if [ ! -f ../.env ]
then
  usage
  exit 1
fi

IFS=$'\n'
for VAR in $(egrep '^.+=' ../.env)
do
  export $VAR
done

if [ -z $CLUSTER_NAME ]
then
  usage
  exit 1
fi

# source variables into manifests and dump to STDOUT
render_yaml() {
eval "cat <<EOF
$(<$1)
EOF
"
}

# installs kube state metrics
for yaml in manifests/newrelic/kube-state-metrics/*; do
  render_yaml "${yaml}" | kubectl $COMMAND -f -
done

# installs required New Relic service account and roles
render_yaml manifests/newrelic/newrelic-service-account.yaml |
  kubectl $COMMAND -f -

# installs New Relic metadata injection webhook
render_yaml manifests/newrelic/newrelic-webhook.yaml |
  kubectl $COMMAND -f -

# installs the kubernetes NRI service account, roles and daemon sets
render_yaml manifests/newrelic/newrelic-infrastructure-k8s.yaml |
  kubectl $COMMAND -f -

# installs the mongodb NRI config map
render_yaml manifests/newrelic/newrelic-configmap-mongodb.yaml |
  kubectl $COMMAND -f -

# installs the mysql NRI config map
render_yaml manifests/newrelic/newrelic-configmap-mysql.yaml |
  kubectl $COMMAND -f -

# installs the rabbitmq NRI config map
render_yaml manifests/newrelic/newrelic-configmap-rabbitmq.yaml |
  kubectl $COMMAND -f -

# installs the redis NRI config map
render_yaml manifests/newrelic/newrelic-configmap-redis.yaml |
  kubectl $COMMAND -f -