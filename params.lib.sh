#!/bin/sh
#
#Copyright (C) Anton Riabchevskiy (AntonRiab)
#Tested on Ubuntu 16.04
#
###############################################################################
#include this script without quotes to the end of your script, like next
#". params.lib.sh"
###############################################################################
#EXAMPLE OF CALL result script
#variable1=test ./scriptname function_in_script function_argv
#./scriptname help
#./scriptname help list
#./scriptname help function_in_script
###############################################################################

TARGET_CONTENT=$(cat $(pwd)/$0)
TARGET_METHODS=$(echo "$TARGET_CONTENT" \
                | grep -oE '^[0-9a-zA-Z_]*\(\) *{' \
                | tr -d '(){' | sed 's/_loop$//')

####<help>
help_list_advanced() {
  ALL_HELPS=$(echo "$TARGET_CONTENT" \
    | grep -oE '^[0-9A-Za-z_]+_help' | sed 's/_help$//')

  FUNCTION_W_HELP=$(printf "$TARGET_METHODS\n$ALL_HELPS\n" \
                    | sed 's/ *$//' | sort | uniq -D | uniq)
  VARIAVLE_W_HELP=$(printf "$ALL_HELPS\n$FUNCTION_W_HELP\n" | sort | uniq -u)

  printf "$FUNCTION_W_HELP\n" | sed 's/^/\t--/'

  for v0 in ${VARIAVLE_W_HELP}; do
    printf "\t${v0}=\"$(eval echo "\$$v0")\"\n"
  done
}

help() {
  if [ "$1" = "list" ];then
    echo "$(help_list_advanced)"
    exit 0
  fi

  VAR_CONTAIN="$(eval echo \"\$$1_help\")"
  if [ "$VAR_CONTAIN" ];then
    echo "$VAR_CONTAIN"
    exit 0
  else
    test $# -lt 1 && test -z "$_help" \
      && echo -n "Current script does't contain global _help..."
    output_help_list_advanced=$(help_list_advanced)
    if [ "$output_help_list_advanced" ];then
      echo "Undefined!!!"
      echo "But you can try to use next advanced help peer values/function:"
      echo "$output_help_list_advanced" | sed 's/^/\t/'
    else
      echo "It does not contain help about $2"
    fi

    echo
    exit 1
  fi
}
TARGET_METHODS=$(printf "${TARGET_METHODS}\nhelp")
####</help>
####<parse input>
CMD=""
ARGV=""

call_last_method() {
  ARGV=$(echo "$ARGV" | sed 's/^[\\ ]*//')
  if [ "$CMD" ];then
    if [ "${CMD%%*_loop}" ];then 
      eval $CMD $ARGV
    else
      for C_ARG in $ARGV;do
        eval $CMD $C_ARG
      done
    fi
    CMD=""
    ARGV=""
  fi
}

####read input...
for READ_STRING in $@;do
  NEED_TO_FIND_METHOD=$(echo "$READ_STRING" | sed 's/^-*//')
  if [ "$CMD" != 'help' -a $(echo "$TARGET_METHODS"\
       | grep -E "^${NEED_TO_FIND_METHOD} *$") ];then
    call_last_method
    CMD="${NEED_TO_FIND_METHOD}"
  elif [ "$CMD" ];then
      ARGV="$ARGV $READ_STRING"
  fi
done
call_last_method
####</parse input>
