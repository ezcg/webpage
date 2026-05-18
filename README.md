This is a TypeScript without a framework server project. 

It is a single page application.

server.ts is the main entry point and it only loads public/index.html.

It runs in a Docker container.  Bash files for managing the container are in the root directory:
* dcBuild.sh
* dcUp.sh
* dcDown.sh   

Set ports in .env file. 
