function vault_aws_creds --description 'Exports vault temp AWS keys into env.'
  # argv[1] = Account, either aws_dev or aws_prod
  # argv[2] = Role name: administrator, devopser, readonly
  set json (vault read -format=json "$argv[1]/sts/$argv[2]")
  set json "$json"

  echo "Exporting the following into your environment: "
  set export (echo $json | jq '.data | "set -xg AWS_ACCESS_KEY_ID \(.access_key)"' | sed 's/"//g')
  echo $export
  eval $export
  set export (echo $json | jq '.data | "set -xg AWS_SECRET_ACCESS_KEY \(.secret_key)"' | sed 's/"//g')
  echo $export
  eval $export
  set export (echo $json | jq '.data | "set -xg AWS_SESSION_TOKEN \(.security_token)"' | sed 's/"//g')
  echo $export
  eval $export
end

