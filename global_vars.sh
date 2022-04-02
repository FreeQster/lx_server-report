###Vars
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DF_FILE="$SCRIPTPATH/df.txt"

###Source
source $SCRIPTPATH/config.sh
for f in $SCRIPTPATH/functions; do source $f; done
