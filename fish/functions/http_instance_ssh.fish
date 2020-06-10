function http_instance_ssh --description 'SSH while forwarding HTTP(S)'
  #argv[1] Which ssh key to use.
  #argv[2] Which instance id.
  #argv[3] Where to forward to
  #Requires an exported AWS_SSH_KEYS_ROOT_PATH variable.
  if test (count $argv) -ne 3
    echo 'http_instance_ssh ssh_key instance_id forward_to'
    echo 'http_instance_ssh pingfederate-dev i-134553534 an_elb.aws.com'
    return 1
  end

  set -q AWS_SSH_KEYS_ROOT_PATH
  if test $status -ne 0
    echo "Please set AWS_SSH_KEYS_ROOT_PATH."
    return 1
  end

  set sshkey "$AWS_SSH_KEYS_ROOT_PATH/$argv[1].pem"

  if test ! -f "$sshkey"
    set sshkey "$HOME/.ssh/$argv[1].pem"
  end

  if test ! -f "$sshkey"
    echo "$sshkey does not exist."
    return 1
  end

  set instance_ip (aws_instance_ip $argv[2])

  set https_f "443:"$argv[3]":443"

  echo $https_f

  sudo ssh -i "$sshkey" "-L$https_f" "ec2-user@$instance_ip"
end
