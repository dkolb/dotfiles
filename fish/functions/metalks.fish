function metalks --description 'metalks (p|np) (o|c)'
  if test (count $argv) -ne 2
    echo 'Wrong number of args.'
    return 1
  end

  set -q METALKS_PROD_ACCT METALKS_NONPROD_ACCT METALKS_IAM_ROLE_NAME
  if test $status -ne 0
    echo -n 'Either METALKS_PROD_ACCT or METALKS_NONPROD_ACCT '
    echo 'METALKS_IAM_ROLE_NAME univerals are missing.'
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

  switch $argv[2]
    case o
      alks sessions open -a $acct -r $role -o creds -f
    case c
      alks sessions console -a $acct -r $role
    case i
      alks sessions open -a $acct -r $role -o creds -f -i
    case '*'
      echo 'Bad arg. metalks (p|np) (c|o)'
      return 1
  end
end
