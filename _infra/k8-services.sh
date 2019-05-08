#!/bin/sh

usage() {
  echo
  echo "k8-services.sh: manage required manifests for our sample microservices app"
  echo
  echo "  -a, applies services manifests"
  echo "  -c, creates services manifests"
  echo "  -d, deletes services manifests"
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

export services=(mysql mongodb rabbitmq redis catalogue cart user shipping ratings payment dispatch web)
for service in "${services[@]}"; do
  render_yaml "manifests/services/${service}.yaml" | kubectl $COMMAND -f -
done
