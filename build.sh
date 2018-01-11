#!/bin/sh
USERUID=$(id -u)
USERGID=$(id -g)
IMGNAME=$(hostname -s)

sed 's/__USERUID__/'"${USERUID}"'/g; s/__USERGID__/'"${USERGID}"'/g; s/__IMGNAME__/'"${IMGNAME}"'/g' templates/Dockerfile.stage1.template > Dockerfiles/Dockerfile.stage1
docker build -f ./Dockerfiles/Dockerfile.stage1 -t ${IMGNAME}/jekylldev:stage1 .

if [ $USERUID -eq 0 ]; then
    sed 's/__USERUID__/'"${USERUID}"'/g; s/__USERGID__/'"${USERGID}"'/g; s/__IMGNAME__/'"${IMGNAME}"'/g' templates/Dockerfile.stage2b.template > Dockerfiles/Dockerfile.stage2
else
    sed 's/__USERUID__/'"${USERUID}"'/g; s/__USERGID__/'"${USERGID}"'/g; s/__IMGNAME__/'"${IMGNAME}"'/g' templates/Dockerfile.stage2.template > Dockerfiles/Dockerfile.stage2
fi

docker build -f ./Dockerfiles/Dockerfile.stage2 -t ${IMGNAME}/jekylldev:stage2 .

sed 's/__USERUID__/'"${USERUID}"'/g; s/__USERGID__/'"${USERGID}"'/g; s/__IMGNAME__/'"${IMGNAME}"'/g' templates/docker-compose.yml.template > docker-compose.yml
sed 's/__USERUID__/'"${USERUID}"'/g; s/__USERGID__/'"${USERGID}"'/g; s/__IMGNAME__/'"${IMGNAME}"'/g' templates/docker-compose-r.yml.template > docker-compose-r.yml

docker-compose up -d
