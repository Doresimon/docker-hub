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

# generate self-signed cert & key
__fn__gen_self_signed_cert(){
    FNAME_PRIVATE_KEY_PEM=private.pem
    FNAME_CERT_REQUEST_PEM=csr.pem
    FNAME_CERT_PEM=file.crt
    if [ ! -f "$FNAME_PRIVATE_KEY_PEM"];
    then
        echo "self-signed cert not found, try to generate it."
        openssl genrsa 1024 > $FNAME_PRIVATE_KEY_PEM 
        openssl req -new -key $FNAME_PRIVATE_KEY_PEM -out $FNAME_CERT_REQUEST_PEM
        openssl x509 -req -days 3650 -in $FNAME_CERT_REQUEST_PEM -signkey $FNAME_PRIVATE_KEY_PEM -out $FNAME_CERT_PEM
    else
        echo "self-signed cert found, good~"
    fi
}