#!/bin/bash
gcloud vmware private-clouds vcenter credentials describe --private-cloud $PC_NAME --location $LOCATION --format="value(password)" | tr -d '\n' | gcloud secrets versions add $VCENTER_SECRET --data-file=- || exit 1
gcloud vmware private-clouds nsx credentials describe --private-cloud $PC_NAME --location $LOCATION --format="value(password)" | tr -d '\n' | gcloud secrets versions add $NSX_SECRET --data-file=- || exit 1
gcloud vmware private-clouds describe $PC_NAME --location $LOCATION --format="value(vcenter.fqdn)" | tr -d '\n' >/workspace/vcenter-fqdn.txt
gcloud vmware private-clouds describe $PC_NAME --location $LOCATION --format="value(nsx.fqdn)" | tr -d '\n' >./nsx-fqdn.txt

# Checking Private Connection
if [ -z $(gcloud vmware private-connections list --location $REGION --format="value(name)") ]
    then
        echo "Private Connection not present"
        # Get the service project
        service_project=$(gcloud compute networks peerings list --network=$VPC --flatten=peerings --filter=peerings.name:servicenetworking-googleapis-com --format="value(peerings.network)" | cut -d \/ -f 7)
        gcloud vmware private-connections create --service-project=$service_project --type=PRIVATE_SERVICE_ACCESS --vmware-engine-network=$REGION-default || exit 1
    else
        echo "Private Connection already present"
fi

echo "Done"