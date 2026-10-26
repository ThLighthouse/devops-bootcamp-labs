# AWS Services
## Module Overview

AWS is the most popular and widely used cloud platform. AWS is an Infrastructure as a Service Cloud Platform.

In this module we look to such concepts as:

- Introduction to AWS Services
- Manage Users & Permissions with IAM(Identity and Access Managment)
- Regions & Availability Zones
- Configure own private network with VPC(Virtual Private Cloud)
- Create virtual servers with EC2(Elastic Compute Cloud)
- Build Pipeline to deploy to EC2 Instance
- Introduction to AWS CLI

### Introduction to Amazon Web Services
#### AWS Account and Services Scope

When we create AWS Account we get a `global` top level resource which is our `account`.
With the AWS Account(IAM Users) we can create our infrastructure in any of the different `regions`. And any region have two or more `availability zones`(physical datacenters).

Global Scope: 
- `IAM Service` 
- `Billing` 
- `Route53`
etc

Region Scope:
- `S3 Bucket`
- `VPC`
- `DynamoDB`

Availability Zones Scope:

- `EC2`
- `EBS`
- `RDS`

#### Identity & Access Managment(IAM)

IAM Manages access to AWS services and resources. When we create an account `root user` is created by default. The best practice is to create and configure `admin user` with less priviliges that root user. Beside that there are `system users` also, it could be Jenkins or other tools which we give access to do something with our AWS Account.
We also have `groups` for granting access to multiple IAM users.

IAM Users mostlty are Human and System Users. Hovewer in AWS we cannot assigh policies to AWS Services directly. That is why we firslty assigh the role and the assigh that role to the service.

#### Regions and Availability Zones

Cloud providers have physical data centers all over the world. There are 30+ physical location on AWS, where data centers are clustered in order to customers get faster access to the servers.


#### Virtual Private Cloud

VPC - is your own isolated network in the cloud. When we create EC2 instance, aws automatically creates compononets in addition to EC2.

Subnets - are sub networks of the VPC. While VPC spans whole region, subnets spans individula availability zones.
There are `Private` and `Public` Subnets. Firewall Rule configuration makes it either a private and/or public subnet. 

For example if we block all the Internet communication from outside to the subnet we make this subnet private. But other Services inside the VPC will still has an access.

And a public subnet allows external traffic into that subnet at any port.

To allow external communication to our VPC we have `Internet Gateway`. 
Also to configure access on subnet level we have `Network Access Control List(NACL)`.
To configure access on instance level we have `Security Group`.