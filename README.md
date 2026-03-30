# ecloud-container
Container for performing Electron Cloud simulations using the [PyCOMPLETE](https://github.com/pycomplete) suite. 
## Short Architecture Description
- Python version inside container is 3.14. It is installed inside a conda environment named (ecloud-env)
- The package manager for the container is `Micromamba`
- The PyCOMPLETE version can be found in the path: `/home/eclouduser/PyCOMPLETE`
- Container version can be verified through the environment variable `ECLOUD_CONTAINER_VERSION`
- This container implements a multi-stage build to reduce the size of the container. 
## Published versions
The container is published on ghcr:
```text
ghcr.io/ekatralis/ecloud-containers:latest
```
On PCs/clusters with access to CVMFS, the container can be found in:
```text
/cvmfs/unpacked.cern.ch/ghcr.io/ekatralis/ecloud-containers\:latest
```