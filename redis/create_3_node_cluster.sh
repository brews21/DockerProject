#!/bin/bash
#
#

echo “Deleting and Cleaning any resources ...”
docker container kill rp1 2>/dev/null
docker container kill rp2 2>/dev/null
docker container kill rp3 2>/dev/null
docker container prune -f

docker network rm network1 2>/dev/null
docker network rm network2 2>/dev/null
docker network rm network3 2>/dev/null

echo “Creating new subnets ...”
docker network create network1 --subnet=172.18.0.0/16 --gateway=172.18.0.1
docker network create network2 --subnet=172.19.0.0/16 --gateway=172.19.0.1
docker network create network3 --subnet=172.20.0.0/16 --gateway=172.20.0.1

# These commands pull redislabs/redis from the docker hub. Because of the
# port mapping rules, Redis Enterprise instances are available on ports
# 12000, 12002, 12004
echo “”
echo “Starting Redis Enterprise as Docker containers ...”
docker run -d --cap-add sys_resource -h rp1 --name rp1 -p 8443:8443 -p 9443:9443 -p 12000:12000 --network network1 --ip 172.18.0.2 redislabs/redis
docker run -d --cap-add sys_resource -h rp2 --name rp2 -p 8445:8443 -p 9445:9443 -p 12002:12000 --network network2 --ip 172.19.0.2 redislabs/redis
docker run -d --cap-add sys_resource -h rp3 --name rp3 -p 8447:8443 -p 9447:9443 -p 12004:12000 --network network3 --ip 172.20.0.2 redislabs/redis

docker network connect network2 rp1
docker network connect network3 rp1
docker network connect network1 rp2
docker network connect network3 rp2
docker network connect network1 rp3
docker network connect network2 rp3

echo “”
echo “Waiting for the servers to start ...”
echo “Sleeping for 3min ...”
sleep 180

echo “”
echo “Creating cluster and joining slaves ...”
docker exec -it rp1 /opt/redislabs/bin/rladmin cluster create name cluster1.local username r@r.com password test
docker exec -it rp2 /opt/redislabs/bin/rladmin cluster join nodes 172.18.0.2 username r@r.com password test
docker exec -it rp3 /opt/redislabs/bin/rladmin cluster join nodes 172.18.0.2 username r@r.com password test

echo “Waiting for the Cluster to be ready ...”
echo “Sleeping for 60sec ...”
sleep 60
echo “”
echo “Creating a CRDB”
docker exec -it rp1 /opt/redislabs/bin/crdb-cli crdb create --name mycrdb --memory-size 512mb --port 12000 --replication true --shards-count 2 --instance fqdn=cluster1.local,username=r@r.com,password=test 

#-instance fqdn=cluster2.local,username=r@r.com,password=test --instance fqdn=cluster3.local,username=r@r.com,password=test

echo “Setting policy to all-nodes ...”
docker exec -it rp1 /opt/redislabs/bin/rladmin bind db mycrdb endpoint 1:1 policy all-nodes

echo ""
echo "Completed the Script"
