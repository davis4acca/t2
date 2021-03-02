
# HARDCODED PARSE TICKET AND TEMPLATE ARGUMENTS
# WHEN USER WRITES TEMPLATE="angular" TICKET="123" then these get stored into the variables 
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            TICKET)              TICKET=${VALUE} ;;
            TEMPLATE)    TEMPLATE=${VALUE} ;;     
            *)   
    esac    
done