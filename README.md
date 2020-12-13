# HORCRUX-DEMONSTRATOR
## 1. Description 
This repository contains a demonstrator of the cryptographic auth protocol known as 'horcrux-protocol'.
```
.						. project root folder
├── mca-sp-bops					. | source directory
│   ├── bops1-data				. || bops1 (issuer) directory root
│   │   ├── accounts				. ||
│   │   ├── ipfs				. ||
│   │   │   ├── didDocs				. ||
│   │   │   └── state				. ||
│   │   └── keys				. ||
│   ├── bops2-data				. || bops2 (verifier) directory root
│   │   ├── keys				. ||
│   │   └── verify				. ||| directory that holds ephemeral verification data
│   │       └── 0x7579dC01E22ec62aa3775B88B6... . |||| holds verification data, specific to an identity	
│   │           └── pks				. ||||| issuer public keys associated with bops instance
│   ├── ipfs					. || ipfs directory root (managed by jsipfs-cli)
│   │   ├── blocks				. ||							
│   │   │   ├── 7J				. ||
│   │   │   ├── IL				. ||
│   │   │   ├── K5				. ||
│   │   │   ├── LG				. ||
│   │   │   ├── M4				. ||
│   │   │   ├── OO				. ||
│   │   │   ├── PJ				. ||
│   │   │   ├── PU				. ||
│   │   │   ├── QP				. ||
│   │   │   ├── R3				. ||
│   │   │   ├── S2				. ||
│   │   │   └── X3				. ||
│   │   ├── datastore				. ||
│   │   ├── keys				. || identities associated with each bops instance
│   │   │   ├── info				. ||
│   │   │   └── pkcs8				. ||
│   │   ├── local				. ||
│   │   ├── pins				. ||
│   │   └── repo.lock				. ||
│   ├── issuer-data				. || issuer directory root
│   │   ├── keys				. ||
│   │   └── localstorage			. ||
│   ├── mca-data				. || mobile client application directory root 
│   │   ├── keys				. ||| identities (owned & known (public keys))
│   │   ├── lib					. ||| node-red specific data
│   │   │   └── flows				. ||||
│   │   ├── localstorage			. ||| local storage of the mimicked device
│   │   └── temp				. ||| temporary storage for ephemeral data
│   │       └── 0x82CA9DAf8a81034590d79C53A4... . |||| example folder with eth-account-based naming scheme
│   └── static					. || static file serving (for the web front-end)
└── resources					. | resources root
    ├── keys					. || prefabricated keys/identities
    ├── nodeRed-customImage			. || docker image building root
    │   └── mca					. ||| image specific folder
    │       └── node-red-contrib-ethr-genaddress. |||| manually imported node (as given by instructor)
    ├── nodeRed-defaultFiles			. || defaults from node-red base docker-image
    └── test-data				. || input data to test the flows (e.g. fingerprints)
        └── fingerprints			. |||	
```												
The project mainly consists of the following parts:							
- build-artifacts used to create our customized node-red image:							
	- a dockerfile (containing the required project dependencies)
	- a build-script to render an docker-image from the mentioned dockerfile
	- a script for pushing the custom-image to dockerhub

- a docker-compose file:
	- referencing our customized alpine-based node-red image
	- defining volume mappings that represent the storage-root of the different actors
	- port mappings for the services to be reachable on the host
	
Development took place on a virtual machine inside VMWare Workstation Pro using the (at the time of development) most recent version of Ubuntu. It is recommended to the same or a comparable (*nix-like) setup.

## 2. Setup
You may run this software project as only of the following:
### OPTION I: Execute as docker-image:
- Proceed with instructions given in chapter ``3.1 Project setup``.

### OPTION II: Download our fully prepared ova-based virtual machine:
- Proceed with instructions given in chapter ``3.2 Run the code``. (project folder is on the desktop, username: max, password: muster)

### OPTION III: Manual setup
#### 2.II.1. Environment setup
Preparation: Set up a Linux environment. The following setup is recommended:
- Ubuntu LTS on VMWare Workstation Pro 
- recommended: change keyboard layout to German (Switzerland)
- optional: install open-vm-tools for improved UX (resolution- and clipboard-support) if scaling and copy-paste doesn't work.
- Proceed with instructions given in chapter ``3.1 Project setup``.

## 3. Usage
### 3.1 Project setup
1. Open a terminal
2. Install docker if not already installed: https://docs.docker.com/engine/install/ubuntu/
3. Install docker-compose if not already installed: https://docs.docker.com/compose/install/
4. Clone the repository:
- provided you have associated (with GitHub) ssh key: ``git clone git@github.com:RoboticRaven/horcrux-demonstrator.git`` 
- else you may still pull via http protocol ``git clone https://github.com/RoboticRaven/horcrux-demonstrator.git``

### 3.2 Run the code
1. Change directory (``cd``) into the project directory
2. Start the service by running ``sudo docker-compose up -d`` (only use sudo if you have no docker-group/user defined)
3. The node-red development environment should by now be reachable via browser:
	http://localhost:1000/
4. For testing the functionalities the following mock end-points are available:
	- http-endpoint for registration (as provided in the mca flow): http://localhost:1000/register
	- http-endpoint for login (as provided in the SP(verifier) flow): http://localhost:1000/login
5. Under the path ``resources/test-data`` you will find some data to test-run the flows
6. In order to see the container logs:
	- get an overview over the currently running services
	 ``"docker ps -a"``
	- identify the containerID of the corresponding container and get the logs by running
	 ``"docker logs <containerID>``
