function metalks-shell --description 'metalks-shell (p|np)'
  function usage
    printf "%s\n" \
      'metalks-shell (p|np)' \
      '  Outpust alks credentials in FISH shell format. See also metalks.' \
      '  p    prod acct (awsmet)' \
      '  np   nonprod acct (awsmetnp)' \
      'GLOBALS REQUIRED' \
      '  METALKS_PROD_ACCT, METALKS_NONPROD_ACCT' \
      '    Used for the -a argument in alks to determine account.' \
      '  METALKS_IAM_ROLE' \
      '    Used for the -r argumetn in alks to determine role for creds.' 
  end

  if test (count $argv) -ne 1
    echo 'Wrong numger of args.' >&2
    usage
    return 1
  end

  if test $argv[1] != 'p'; and test $argv[1] != 'np'
    echo 'Bad account arg.' >&2
    usage
    return 1
  end

  set role "$METALKS_IAM_ROLE_NAME"

  switch $argv[1]
    case p
      set acct "$METALKS_PROD_ACCT"
    case np
      set acct "$METALKS_NONPROD_ACCT"
    case '*'
      echo 'Bad arg. metalks (p|np) (c|o)'
      return 1
  end

  set jq_arg "set -xg AWS_ACCESS_KEY_ID \(.accessKey);" \
    "set -xg AWS_SECRET_ACCESS_KEY \(.secretKey);" \
    "set -xg AWS_SESSION_TOKEN \(.sessionToken);" \
    "set -xg AWS_SESSION_EXPIRES \(.expires);"

  set aws_env (alks sessions open -a $acct -r $role -o json \
    | jq "\"$jq_arg\"" \
    | sed 's/^"//' \
    | sed 's/"$//')

  echo "Eval-ing the following into your shell."

  echo $aws_env

  eval $aws_env
end
