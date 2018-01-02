docker build -f ./Dockerfiles/Dockerfile.jekyllmain -t treldev/jekyll:main .
docker build -f ./Dockerfiles/Dockerfile.jekylldev -t treldev/jekyll:dev .
docker-compose up -d
