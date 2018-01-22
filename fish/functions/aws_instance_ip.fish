function aws_instance_ip --description 'Finds the private IP of an EC2\
 instance ID.'

 if test (count $argv) -ne 1
   echo "Only pass a single instance id."
   return 1
 end

  echo (aws ec2 describe-instances \
  --instance-ids $argv[1] \
  --output text \
  --query 'Reservations[*].Instances[*].PrivateIpAddress')
end
