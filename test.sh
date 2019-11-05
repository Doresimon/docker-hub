CNAME=node

if command -v $CNAME >/dev/null 2>&1; 
then
    echo "$CNAME found"
else
    echo "$CNAME not found"
fi

__fn__notice_done(){
    echo ""
    echo "######## done ########"
}