#!/bin/sh

usage() {
  echo
  echo "k8-loader.sh: manage required manifest for our loader"
  echo
  echo "  -a, applies services manifest"
  echo "  -c, creates services manifest"
  echo "  -d, deletes services manifest"
  echo
  echo "  -n NUMBER, number of threads (defaults to 1)"
  echo
  echo "obs: must run from the _infra folder"
  echo
}

CLIENTS=1

# enforce syntax
while getopts 'cadn:' OPT
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
    n)
      CLIENTS=$OPTARG
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

if [ -z $CLUSTER_NAME ] || [ -z $PUBLIC_URL ]
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

render_yaml "manifests/services/loader.yaml" | kubectl $COMMAND -f -