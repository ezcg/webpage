#!/bin/bash

#For Windows, remove trailing \r character by running on the cmd line:
#sed -i 's/\r$//' docker_init.sh

printf "\n\n===============================running docker_init.sh\n\n"

touch /root/.bashrc
echo "alias ll='ls -ltra'" > /root/.bashrc
echo "set statusline=%f
set pastetoggle=<F2>
set smartcase
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
hi apacheComment guifg=white
set syntax=php
au BufRead,BufNewFile *.html,*.php,*.phtml,*.inc setfiletype php " > /root/.vimrc

if [ ! -d node_modules ]; then
  printf "\n\nInstalling node modules...\n\n"
  npm install
fi

printf "\n\nRunning 'npm run-script startdev'\n\n"
#make package.json if there isn't one
FILE="/var/app/current/package.json"
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist. making it..."
    cd /var/app/current && npm init -y
    printf "\n\n"
    chown ubuntu:ubuntu package.json
    echo "Installing typescript..."
    npm install --save-dev typescript @types/node ts-node
fi
printf "\n\n"
#make tsconfig.json if there isn't one
FILE="/var/app/current/tsconfig.json"
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist. making it..."
    cd /var/app/current && npx tsc --init
    chown ubuntu:ubuntu tsconfig.json
fi
printf "\n\n"
echo "Running npm install --save-dev @types/node"
printf "\n\n"
npm install --save-dev @types/node
printf "\n\n"
echo "Running npm install --save-dev typescript ts-node"
printf "\n\n"
npm install --save-dev typescript ts-node
printf "\n\n"
echo "Running inside of Docker npm install -g typescript"
printf "\n\n"
npm install -g typescript


printf "\n\n"
exec npm run-script startdev