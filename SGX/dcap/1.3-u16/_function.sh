#!/bin/bash

# util functions
__fn__notice(){
    echo ""
    echo "######## $1 ########"
}
__fn__notice_done(){
    echo ""
    echo "######## done ########"
}

# nodejs
__fn__ensure_node(){
    if command -v node >/dev/null 2>&1; 
    then
        echo "nodejs found, good~"
    else
        echo "nodejs not found, try to install it."
        # Using Ubuntu
        curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
}
