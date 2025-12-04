# Q1 - Networking & Subnetting (AWS VPC Setup)

## What this module creates
- 1 VPC: 10.0.0.0/16
- 2 Public subnets:
  - 10.0.1.0/24 (AZ-1)
  - 10.0.2.0/24 (AZ-2)
- 2 Private subnets:
  - 10.0.11.0/24 (AZ-1)
  - 10.0.12.0/24 (AZ-2)
- Internet Gateway (IGW) attached to the VPC
- 1 NAT Gateway (in the first public subnet) with an EIP
- Route tables:
  - Public RT: 0.0.0.0/0 -> IGW
  - Private RT: 0.0.0.0/0 -> NAT Gateway

## How to run
1. `terraform init`
2. `terraform apply -var="name_prefix=FirstName_Lastname" -var="aws_region=ap-south-1" -auto-approve`
3. `terraform output` (to get resource IDs, NAT EIP)
4. Capture screenshots specified below
5. `terraform destroy -var="name_prefix=FirstName_Lastname" -var="aws_region=ap-south-1" -auto-approve`

## Screenshots to include
- VPC (list) showing VPC ID, Name and CIDR
- Subnets list showing all four subnets and CIDRs
- Public route table showing 0.0.0.0/0 -> IGW
- Private route table showing 0.0.0.0/0 -> NAT Gateway
- NAT Gateway list showing the NAT GW and EIP
- Internet Gateway list showing the IGW attached to the VPC

## CIDR ranges used (explicit)
- VPC: 10.0.0.0/16
- Public Subnet A: 10.0.1.0/24
- Public Subnet B: 10.0.2.0/24
- Private Subnet A: 10.0.11.0/24
- Private Subnet B: 10.0.12.0/24

## Notes / Warnings
- NAT Gateway and Elastic IP may incur charges. Use the AWS Free Tier region and destroy resources after testing.
- If you need HA for NAT across AZs, create one NAT Gateway per AZ and give each private subnet a route to the NAT in its AZ (this increases cost).
