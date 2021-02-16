#!/usr/bin/env bash 

# INPUTS > TICKET, TEMPLATE

# Parse arguments

cd $T2_HOME

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


# NO TICKET = ERROR
 if [ "$TICKET" ]
 then
   echo "CREATING $TICKET"
 else 
   echo "NO TICKET PROVIDED"
   exit 1
 fi

# @TODO IF TICKET NR ALREADY EXIST rempromt for new ticket
TICKET_PROJECT_PATH="$T2_HOME/projects/t2-$TICKET"

if test -d "$TICKET_PROJECT_PATH"; then
    echo "TICKET ALREADY EXIST"
    exit 1
fi




PATH_TO_PROJECTS="$T2_HOME/projects/"
TEMPLATE_FILE="$T2_HOME/templates/$TEMPLATE/"

echo "Creating... TICKET = t2-$TICKET"

# git pull && /
ng new t2t$TICKET --style scss --routing false --directory $PATH_TO_PROJECTS  --strict true && /
# npm i --save ag-grid-angular ag-grid-community ag-grid-enterprise --prefix $PATH_TO_PROJECT && /

#  if [ "$TEMPLATE" ]
#  then
#     if test -d "$TEMPLATE_FILE"; then
#         echo "applying $TEMPLATE template"
#         'cp' -rf $T2_HOME/templates/$TEMPLATE/*  $T2_HOME/projects/t2-$TICKET/
#     fi
#  else 
#    echo "NO TEMPLATE PROVIDED - creating regular angular project"
#  fi



# git add . &&/
# git commit -m "t2-$TICKET  with $TEMPLATE template created" &&/
# git push && /

# echo "complete"