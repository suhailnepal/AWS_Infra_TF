# This script will remove both inbound and outbound rules for all default security groups in ap-southeast-2

import boto3

profile_to_assume = 'default'

boto3.setup_default_session(profile_name=profile_to_assume)
ec2 = boto3.client('ec2', region_name='ap-southeast-2')
group_name = "default"
response = ec2.describe_security_groups(
	Filters=[
		dict(Name='group-name', Values=[group_name])
		]
)

for group in response['SecurityGroups']:
	if len(group['IpPermissionsEgress']):
		for outboundpermission in group['IpPermissionsEgress']:
			ec2.revoke_security_group_egress(GroupId=group['GroupId'],IpPermissions=[outboundpermission])

for group in response['SecurityGroups']:
	if len(group['IpPermissions']):
		for inboundpermission in group['IpPermissions']:
			ec2.revoke_security_group_ingress(GroupId=group['GroupId'],IpPermissions=[permission])
