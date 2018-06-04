function manvault --description "manvault [l|ad|ap]"
  if test (count $argv) -ne 1
    echo "Need one of login, awsdev, or awsprod."
  end

  switch $argv[1]
    case l
      vault login -method=ldap username=$MANHEIM_LDAP_USERNAME
    case ad
      vault_aws_creds aws_dev administrator
    case ap
      vault_aws_creds aws_prod administrator
  end
end

