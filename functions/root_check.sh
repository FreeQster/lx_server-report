root_check(){
  # Check if the script was started as root
  USER_ID=$(id -u)
  if [[ $USER_ID != "0" ]];
  then
    echo "You are not root - EXITING"
    exit 1
  fi
}
