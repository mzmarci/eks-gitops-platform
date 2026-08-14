## EKS IAM Architecture

The EKS cluster IAM role is assumed by the EKS service.
Its trust policy allows eks.amazonaws.com to assume the role,
while its permissions policy grants the control plane the AWS
permissions required to operate the cluster.

### EKS Networking

The EKS cluster is associated with the VPC subnets through the
subnet IDs provided to the EKS cluster configuration.

For our architecture, worker nodes will run in private subnets.
The Kubernetes API endpoint will use private access, while public
access will be disabled.

Subnet tags are also used to identify subnet roles for Kubernetes
and AWS integrations such as load balancers.