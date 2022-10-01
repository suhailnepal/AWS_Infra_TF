## This script will delete all EC2 instances with the tag value `Created by: Suhail`

import boto3
from datetime import datetime, timezone

profile_to_assume = 'default'

boto3.setup_default_session(profile_name=profile_to_assume)
ec2_client = boto3.client('ec2', region_name='ap-southeast-2')

custom_filter = [{
    'Name':'tag:CreatedBy', 
    'Values': ['Suhail']}]

response = ec2_client.describe_instances(Filters=custom_filter)

for reserv in response['Reservations']:
    for inst in reserv['Instances']:
        Instances = inst['InstanceId']
        ec2_client.terminate_instances(InstanceIds=[Instances])