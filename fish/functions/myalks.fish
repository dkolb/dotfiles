function myalks --description 'myalks [ACCT] [ENV] [ACTION]'
  function _myalks_print_usage
    printf "%s\n" \
      'myalks (e|am) (p|np) (o|c|i)' \
      '  Various shortcuts for using ALKS to get into manheim accounts' \
      '' \
      '  ACCT    The account to access.' \
      '    e  awsmet/awsmetnp' \
      '    am awsmancs/awsmancsnp' \
      '' \
      '  ENV     The environment (prod/nonprod) to access.' \
      '    p    prod acct (awsmet)' \
      '    np   nonprod acct (awsmetnp)' \
      '' \
      '  ACTION  The action to take.'\
      '    o    open session' \
      '    c    open console' \
      '' \
      'GLOBALS REQUIRED' \
      '' \
      '  AWSMET_PROD_ACCT, AWSMET_NONPROD_ACCT' \
      '    Used for the -a argument in alks to determine eventer account.' \
      '  AWSMET_IAM_ROLE' \
      '    Used for the -r argumetn in alks to determine role for creds.' \
      '  AWSMANCS_PROD_ACCT, AWSMANCS_NONPROD_ACCT' \
      '    Used for the -a argument in alks to determine acct mngmnt account' \
      '  AWSMANCS_IAM_ROLE' \
      '    Used for the -r argument in alks to determine role for creds.'
    return 0
  end

  if test (count $argv) -eq 0
    _myalks_print_usage
    return 1
  end

  if test (count $argv) -ne 3
    echo 'ERROR: Wrong number of args.'
    _myalks_print_usage
    return 1
  end

  set -q AWSMET_PROD_ACCT AWSMET_NONPROD_ACCT AWSMET_IAM_ROLE \
    AWSMANCS_PROD_ACCT AWSMANCS_NONPROD_ACCT AWSMANCS_IAM_ROLE
  if test $status -ne 0
    echo "ERROR: One of the globals is missing."
    _myalks_print_usage
    return 1
  end

  switch $argv[1]
    case e
      set prefix AWSMET
    case am
      set prefix AWSMANCS
    case '*'
      echo "ERROR: Bad account argument."
      _myalks_print_useage
      return 1
  end

  set role_var_name {$prefix}_IAM_ROLE

  switch $argv[2]
    case p
      set acct_var_name {$prefix}_PROD_ACCT
    case np
      set acct_var_name {$prefix}_NONPROD_ACCT
    case '*'
      echo 'ERROR: Bad environment arg. metalks (p|np) (c|o)'
      _myalks_print_usage
      return 1
  end

  switch $argv[3]
    case o
      alks sessions open -a "$$acct_var_name" \
        -r "$$role_var_name" -o creds -f -i
    case c
      alks sessions console -a "$$acct_var_name" \
        -r "$$role_var_name"
    case '*'
      echo 'ERROR: Bad action arg.'
      _myalks_print_usage
      return 1
  end
end
