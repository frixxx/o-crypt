function help() {
  echo "$SCRIPT_NAME - Encrypt and decrypt text with openssl (aes-256)."
  echo
  echo "Usage:"
  echo "  $SCRIPT_NAME COMMAND OPTIONS <text>"
  echo
  echo "Commands:"
  echo "  encrypt    Checkout a local git branch (default)"
  echo "  decrypt   Checkout a remote git branch"
  echo
  echo "Options:"
  echo "  -p <text>  The crypto passphrase"
  exit 0
}

function parseArguments() {
  arguments=()
  read -A arguments <<< "$*"

  argstr="${arguments[@]}"
  [[ -z $argstr ]] && help

  OPERATION=""
  PASSPHRASE=""
  if [[ "$#arguments" == "1" ]]; then # only input text
    OPERATION="encrypt"
    INPUT="${arguments[1]}"
  elif [[ "$#arguments" == "2" && ("${arguments[1]}" == "encrypt" || "${arguments[1]}" == "decrypt" ) ]]; then # only command and input text
    OPERATION="${arguments[1]}"
    INPUT="${arguments[2]}"
  elif [[ "$#arguments" == "3" && "${arguments[1]}" == "-p" ]]; then # password option + input text
    OPERATION="encrypt"
    PASSPHRASE=${arguments[2]}
    INPUT="${arguments[3]}"
  elif [[ "$#arguments" == "4" && "${arguments[2]}" == "-p" && ("${arguments[1]}" == "encrypt" || "${arguments[1]}" == "decrypt" ) ]]; then # command + password option + input text
    OPERATION=${arguments[1]}
    PASSPHRASE=${arguments[3]}
    INPUT="${arguments[4]}"
  else
    help
    exit 0
  fi

  export OPERATION
  export PASSPHRASE
  export INPUT
}
