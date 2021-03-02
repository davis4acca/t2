#!/usr/bin/env bash

# INPUTS > TICKET, TEMPLATE

cd $T2_HOME

# HELPER FUNCTIONS
PARSE_TICKET_TEMPLATE_ARGUMENTS_PATH="$T2_HOME/scripts/helpers/parse-ticket-template-arguments.sh"

echo "hello" ${PARSE_TICKET_TEMPLATE_ARGUMENTS_PATH}

source ${PARSE_TICKET_TEMPLATE_ARGUMENTS_PATH}

echo ${TICKET} ${TEMPLATE}

# # # NO TICKET = EXIT
# if [ "$TICKET" ]; then
#   echo "CREATING $TICKET"
# else
#   echo "NO TICKET PROVIDED"
#   exit 1
# fi

# #  PROJECT WITH THE TICKET NR ALREADY EXIST = EXIT
# TICKET_PROJECT_PATH="$T2_HOME/projects/t2-$TICKET"

# if test -d "$TICKET_PROJECT_PATH"; then
#   echo "PROJECT WITH THE TICKET NR ALREADY EXIST"
#   exit 1
# fi

# PROJECT_DIR_PATH="$T2_HOME/projects/t2-$TICKET"
# TEMPLATE_DIR_PATH="$T2_HOME/templates/$TEMPLATE"


# git pull && /

# # ANGULAR SPECIFIC

# ng new hello --directory "./projects/t2-$TICKET" --style scss --routing false --strict true --skip-git true && /
# npm i --save ag-grid-angular ag-grid-community ag-grid-enterprise --prefix $PROJECT_DIR_PATH && /


# # test if TEMPLATE PROVIDED AND IF TEMPLATE FOLDER EXIST
# # If exist then use that template by copying over files from template to project
# if [ "$TEMPLATE" ]; then
#   if test -d "$TEMPLATE_DIR_PATH"; then
#     echo "applying $TEMPLATE template"
#     'cp' -rf $TEMPLATE_DIR_PATH/* $PROJECT_DIR_PATH
#   fi
# else
#   echo "NO TEMPLATE PROVIDED - creating regular angular project"
# fi

# git add . && /
# git commit -m "t2-$TICKET  with $TEMPLATE template created" && /
# git push && /

# echo "complete"
# echo "LINK TO CODESANDBOX: https://codesandbox.io/s/github/davis4acca/t2/tree/main/projects/t2-${TICKET}"
