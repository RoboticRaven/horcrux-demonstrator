# HORCRUX-DEMONSTRATOR
This repository contains:
- build-artifacts used to create our customized node-red image:
	- a dockerfile (containing the required project dependencies)
	- a build-script to render an docker-image from the mentioned dockerfile
	- a script for pushing the custom-image to dockerhub

- a docker-compose file:
	- referencing our customized alpine-based node-red image
	- defining volume mappings that represent the storage-root of the different actors
	- port mappings for the services to be reachable on the host
	
We developed on a virtual machine inside VMWare Workstation Pro using the (at the time of development) most recent version of Ubuntu. It is recommended to the same or a comparable (*nix-like) setup.


# Usage
Preparation: Set up a Linux environment. The following setup is recommended:
- Ubuntu LTS on VMWare Workstation Pro 
- with open-vm-tools installed for improved UX.

1. Open a terminal
2. Install docker if not already installed: https://docs.docker.com/engine/install/ubuntu/
3. Install docker-compose if not already installed: https://docs.docker.com/compose/install/
4. Clone the repository:
``git clone git@github.com:RoboticRaven/horcrux-demonstrator.git`` or ``git clone https://github.com/RoboticRaven/horcrux-demonstrator.git``
5. Start the service by running
``docker-compose up -d``
6. The node-red development environment should by now be reachable via browser:
	http://localhost:1000/
7. For testing the functionalities the following mock end-points are available:
	- http-endpoint for registration (as provided in the mca flow): http://localhost:1000/register
	- http-endpoint for login (as provided in the SP(verifier) flow): http://localhost:1000/login
8. In order to see the container logs:
	- get an overview over the currently running services
	 ``"docker ps -a"``
	- identify the containerID of the corresponding container and get the logs by running
	 ``"docker logs \<containerID\>``
