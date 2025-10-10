# EC2 VPC Block Public Access settings should block internet gateway traffic

| Provider            |             Category           |
| ------------------- |  ----------------------------  |
| Amazon Web Services |  Secure Neiwork Configuration  |

## Description

This control checks whether Amazon EC2 VPC Block Public Access (BPA) settings are configured to block internet gateway traffic for all Amazon VPCs in the AWS account. The control fails if VPC BPA settings aren't configured to block internet gateway traffic. For the control to pass, the VPC BPA InternetGatewayBlockMode must be set to block-bidirectional or block-ingress. If the parameter vpcBpaInternetGatewayBlockMode is provided, the control passes only if the VPC BPA value for InternetGatewayBlockMode matches the parameter.

Configuring the VPC BPA settings for your account in an AWS Region lets you block resources in VPCs and subnets that you own in that Region from reaching or being reached from the internet through internet gateways and egress-only internet gateways.

This rule is covered by the [ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.sentinel

        Description:
        This policy requires resources of type `aws_vpc_block_public_access_options`
        have attribute `internet_gateway_block_mode` should be either
        'block-bidirectional' or 'block-ingress'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.

        ✓ Found 0 resource violations

        ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.sentinel:45:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.sentinel

        Description:
        This policy requires resources of type `aws_vpc_block_public_access_options`
        have attribute `internet_gateway_block_mode` should be either
        'block-bidirectional' or 'block-ingress'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_vpc_block_public_access_options.example
            | ✗ failed
            | Attribute 'internet_gateway_block_mode' must be either 'block-bidirectional' or 'block-ingress' for 'aws_vpc_block_public_access_options' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-172 for more details.


        ec2-vpc-block-public-access-options-should-block-internet-gateway-traffic.sentinel:45:1 - Rule "main"
        Value:
            false
```

---
