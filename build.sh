
# build images
cd python-gmsh

docker build -t dessia/python-gmsh -t dessia/python-gmsh:3.9 .


# Upload, to be done after if login fails
docker push dessia/python
docker push dessia/python-gmsh:3.9
