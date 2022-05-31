#!/bin/bash

# oc tkn kn
CLIENTS_ARCH="https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-client-linux.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/pipeline/latest/tkn-linux-amd64.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/serverless/latest/kn-linux-amd64.tar.gz"

# roxctl
CLIENTS_BIN="https://mirror.openshift.com/pub/rhacs/assets/3.66.1/bin/Linux/roxctl https://github.com/kubevirt/kubevirt/releases/download/"

for i in $CLIENTS_ARCH
do
	curl -kL $i -o $( basename $i )
	tar zxvf $( basename $i )
	rm -f *.tar.gz *.tgz
done

for i in $CLIENTS_BIN
do
	curl -kL $i -o $( basename $i )
done

chmod +x * || true

# virtctl
curl -kL "https://github.com/kubevirt/kubevirt/releases/download/v0.53.1/virtctl-v0.53.1-linux-amd64" -o virtctl ; chmod +x virtctl
