#/bin/bash

# Clone repository into /codebase directory
rm -rf codebase
git clone $repo codebase

# Build image from codebase
docker build codebase -t $image_name

# Publish to Docker Hub
cat pwd.txt | docker login -u $username --password-stdin
docker tag $image_name $username/$image_name
docker push $username/$image_name