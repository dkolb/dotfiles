function metalks --description 'metalks (p|np) (o|c|i)'
  if test (count $argv) -eq 0
    printf "%s\n" \
      'metalks (p|np) (o|c|i)' \
      '  Various shortcuts for using ALKS to get into awsmet and awsmetnp'
      '  p    prod acct (awsmet)' \
      '  np   nonprod acct (awsmetnp)' \
      '  o    open session' \
      '  c    open console' \
      '  i    open an iam session' \
      'GLOBALS REQUIRED' \
      '  METALKS_PROD_ACCT, METALKS_NONPROD_ACCT' \
      '    Used for the -a argument in alks to determine account.' \
      '  METALKS_IAM_ROLE' \
      '    Used for the -r argumetn in alks to determine role for creds.'
    return 0
  end

  if test (count $argv) -ne 2
    echo 'Wrong number of args.'
    return 1
  end

  set -q METALKS_EVENTER_PROD_ACCT METALKS_EVENTER_NONPROD_ACCT METALKS_EVENTER_IAM_ROLE_NAME
  if test $status -ne 0
    echo -n 'Either METALKS_PROD_ACCT or METALKS_NONPROD_ACCT '
    echo 'METALKS_IAM_ROLE_NAME univerals are missing.'
    return 1
  end

  set role "$METALKS_EVENTER_IAM_ROLE_NAME"

  switch $argv[1]
    case p
      set acct "$METALKS_EVENTER_PROD_ACCT"
    case np
      set acct "$METALKS_EVENTER_NONPROD_ACCT"
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
