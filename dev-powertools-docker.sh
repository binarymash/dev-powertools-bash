#!/bin/bash

# show all docker containers [filtered on the specified pattern]
# dps [<filterPattern>]
dps(){
  if [ $# -eq 0 ]; then
    docker ps -a
  else
    docker ps -a | grep $1
  fi
}

# show logs for the specified container
# dl <containerId>
dl(){
  docker logs $1
}

# show and follow logs for the specified container
# dlf <containerId>
dlf(){
  docker logs -f $1
}

# delete all containers [or specified container]
# drm [<containerId>]
drm(){
  if [ $# -eq 0 ]; then
    docker rm -f $(docker ps -aq)
  else
    docker rm -f $1
  fi
}

# open an interactive bash session on the specified container
# dbash <containerId>
dbash(){
  winpty docker exec -it $1 bash
}

# list docker networks [filtered on pattern]
# dn [<filterPattern>]
dn(){
  if [ $# -eq 0 ]; then
    docker network ls
  else
    docker network ls | grep $1
  fi
}


# inspect the specified docker network
# dni <networkId>
dni(){
  docker network inspect $1
}


di(){
  if [ $# -eq 0 ]; then
    docker images -a
  else
    docker images -a | grep $1
  fi
}

# prune the system volumes
# dprune
dprune(){
  docker system prune --volumes
}

# start container
# ds <containerId>
ds(){
  docker start $1
}
