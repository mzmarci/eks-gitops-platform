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

## EKS Add-ons

The EKS platform relies on several core components to provide
cluster functionality.

### CoreDNS

CoreDNS provides DNS-based service discovery within the Kubernetes
cluster. It allows workloads to communicate with Kubernetes Services
using stable DNS names rather than hardcoded IP addresses.

### AWS VPC CNI

The AWS VPC CNI provides Pod networking by assigning Pod IP addresses
from the AWS VPC and enabling Pods to communicate using VPC networking.

### Amazon EBS CSI Driver

The EBS CSI Driver allows Kubernetes workloads to use Amazon EBS
volumes as persistent storage. It enables Kubernetes to provision,
attach, mount, and manage EBS-backed persistent volumes.

### Mental Model

CoreDNS → DNS/service discovery

VPC CNI → Pod networking

EBS CSI → Persistent storage