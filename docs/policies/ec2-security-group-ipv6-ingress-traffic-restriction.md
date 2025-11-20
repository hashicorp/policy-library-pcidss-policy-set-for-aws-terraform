# AWS Security Group should not allow ingress traffic from ::/0 to port 22 and 3389

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## PCIDSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &cross;  |
| 4.0.1   | &check;  |

## Description

DISCLAIMER - This policy works when all resources of type aws_security_group, aws_security_group_rule and aws_vpc_security_group_ingress_rule 
have their `cidr_blocks`,`ipv6_cidr_blocks`,`cidr_ipv4` or `cidr_ipv6`  attributes set as a constant value.

This control checks whether an Amazon EC2 security group allows ingress from ::/0 to remote server administration ports (ports 22 and 3389). The control fails if the security group allows ingress from ::/0 to port 22 or 3389.

Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. We recommend that no security group allow unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TDP (6), UDP (17), or ALL (-1) protocols. Permitting public access to these ports increases resource attack surface and the risk of resource compromise.

This rule is covered by the [ec2-security-group-ingress-traffic-restriction](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-protocol.sentinel) policy when the `prevent_unknown_ipv6_ingress` parameter is passed as `true`.

## Policy Results (Pass)
```bash
trace:
  Pass - ec2-security-group-ipv6-ingress-traffic-restriction.sentinel

Description:
  This policy requires resources of type `aws_security_group`,
  `aws_security_group_rule` and `aws_vpc_security_group_ingress_rule`
  to block ingress traffic from unknown sources to ports 22 and 3389

Print messages:

→ → Overall Result: true

This result means that all resources have passed the policy check for the policy ec2-security-group-ingress-traffic-restriction.

✓ Found 0 resource violations

ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:142:1 - Rule "main"
  Value:
    true

ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:132:1 - Rule "is_aws_security_group_compliant"
  Description:
    Checks if 'aws_security_group' resources block ingress traffic
    from unknown sources to ports 22 and 3389

  Value:
    true

ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:126:1 - Rule "is_aws_security_group_rule_compliant"
  Description:
    Checks if 'aws_security_group_rule' resources block ingress
    traffic
    from unknown sources to ports 22 and 3389

  Value:
    true

ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:138:1 - Rule "is_aws_vpc_security_group_ingress_rule_compliant"
  Description:
    Checks if 'aws_vpc_security_group_ingress_rule' resources block
    ingress traffic
    from unknown sources to ports 22 and 3389

  Value:
    true
```

---

## Policy Results (Fail)
```bash
trace:
 Fail - ec2-security-group-ipv6-ingress-traffic-restriction.sentinel

Description:
  This policy requires resources of type `aws_security_group`,
  `aws_security_group_rule` and `aws_vpc_security_group_ingress_rule`
  to block ingress traffic from unknown sources to ports 22 and 3389

Print messages:

→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-security-group-ingress-traffic-restriction.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: aws_security_group_rule.sgr1
     | ✗ failed
     | Security group rules should not allow ingress to port 22 and 3389 from from '::/0'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-54 for more details.


ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:142:1 - Rule "main"
  Value:
    false

ec2-security-group-ipv6-ingress-traffic-restriction.sentinel:126:1 - Rule "is_aws_security_group_rule_compliant"
  Description:
    Checks if 'aws_security_group_rule' resources block ingress
    traffic
    from unknown sources to ports 22 and 3389

  Value:
    false
```

---