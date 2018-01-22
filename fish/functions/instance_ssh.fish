function instance_ssh --description 'SSH to private IP of an instance.'
  #argv[1] Which ssh key to use.
  #argv[2] Which instance id.
  #argv[3] Alterantive username to ssh with.
  #Requires an exported AWS_SSH_KEYS_ROOT_PATH variable.

  set -q AWS_SSH_KEYS_ROOT_PATH
  if test $status -ne 0
    echo "Please set AWS_SSH_KEYS_ROOT_PATH."
    return 1
  end

  set sshkey "$AWS_SSH_KEYS_ROOT_PATH/$argv[1].pem"

  if test ! -f "$sshkey"
    echo "$sshkey does not exist."
    return 1
  end

  set instance_ip (aws_instance_ip $argv[2])

  if test (count $argv) -gt 2; and test -n "$argv[3]"
    ssh -i "$sshkey" "$argv[3]@$instance_ip"
  else
    ssh -i "$sshkey" "ec2-user@$instance_ip"
  end
end
