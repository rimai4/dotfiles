function acc-bastion --wraps='AWS_PROFILE=uno-acc aws ssm start-session --region eu-central-1 --target  --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters host=qas-dpl.hec.alliander.local,portNumber=30441,localPortNumber=30441' --wraps=AWS_PROFILE=uno-acc\ aws\ ssm\ start-session\ --region\ eu-central-1\ --target\ \$\(aws\ ec2\ describe-instances\ \ --query\ \'Reservations\[0\].Instances\[0\].InstanceId\'\ \ --output\ text\ --filters\ \"Name=instance-state-name,Values=running\"\ \"Name=tag:Name,Values=\*bastion\*\"\)\ --document-name\ AWS-StartPortForwardingSessionToRemoteHost\ --parameters\ host=qas-dpl.hec.alliander.local,portNumber=30441,localPortNumber=30441 --description alias\ acc-bastion\ AWS_PROFILE=uno-acc\ aws\ ssm\ start-session\ --region\ eu-central-1\ --target\ \$\(aws\ ec2\ describe-instances\ \ --query\ \'Reservations\[0\].Instances\[0\].InstanceId\'\ \ --output\ text\ --filters\ \"Name=instance-state-name,Values=running\"\ \"Name=tag:Name,Values=\*bastion\*\"\)\ --document-name\ AWS-StartPortForwardingSessionToRemoteHost\ --parameters\ host=qas-dpl.hec.alliander.local,portNumber=30441,localPortNumber=30441
  AWS_PROFILE=uno-acc aws ssm start-session --region eu-central-1 --target $(aws ec2 describe-instances  --query 'Reservations[0].Instances[0].InstanceId'  --output text --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=*bastion*") --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters host=qas-dpl.hec.alliander.local,portNumber=30441,localPortNumber=30441 $argv
        
end
