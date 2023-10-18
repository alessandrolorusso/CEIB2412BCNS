#!/bin/bash
gcloud vmware private-clouds vcenter credentials describe --private-cloud $PC_NAME --location $LOCATION --format="value(password)" | tr -d '\n' | gcloud secrets versions add $VCENTER_SECRET --data-file=- || exit 1
gcloud vmware private-clouds nsx credentials describe --private-cloud $PC_NAME --location $LOCATION --format="value(password)" | tr -d '\n' | gcloud secrets versions add $NSX_SECRET --data-file=- || exit 1
gcloud vmware private-clouds describe $PC_NAME --location $LOCATION --format="value(vcenter.fqdn)" | tr -d '\n' >/workspace/vcenter-fqdn.txt
gcloud vmware private-clouds describe $PC_NAME --location $LOCATION --format="value(nsx.fqdn)" | tr -d '\n' >./nsx-fqdn.txt

echo "Done"