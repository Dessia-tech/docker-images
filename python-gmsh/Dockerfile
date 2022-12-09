FROM python:3.9

# Download Package Information
RUN apt-get update -y

# Install Tkinter
RUN apt-get install libxcursor1 libxrender1 libglu1-mesa libxft2 libxinerama1 libgomp1 -y

RUN useradd --create-home gmsh
USER gmsh

ENV PATH /home/gmsh/.local/bin:$PATH
ENV PYTHONPATH /home/gmsh/.local/lib:$PYTHONPATH
