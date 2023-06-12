# Dessia pyinstaller-linux

## Motivation
The well known https://github.com/cdrx/docker-pyinstaller is running an old version of python and pyinstaller.

## Usage

To build your application, you need to mount your source code into the /src/ volume.

The source code directory should have your .spec file that PyInstaller generates. If you don't have one, you'll need to run PyInstaller once locally to generate it.

If the src folder has a requirements.txt file, the packages will be installed into the environment before PyInstaller runs.

For example, in the folder that has your source code, .spec file and requirements.txt:

docker run -v "$(pwd):/src/" dessia/pyinstaller-linux



## Repo
See source, create issues and PR at https://github.com/Dessia-tech/docker-images/tree/master/pyinstaller
