# Amazon Inspector EC2 scanning should be enabled

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services |    Detection services    | 

## Description

This control checks whether Amazon Inspector EC2 scanning is enabled. For a standalone account, the control fails if Amazon Inspector EC2 scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have EC2 scanning enabled.

In a multi-account environment, the control generates findings in only the delegated Amazon Inspector administrator account. Only the delegated administrator can enable or disable the EC2 scanning feature for the member accounts in the organization. Amazon Inspector member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated administrator has a suspended member account that doesn't have Amazon Inspector EC2 scanning enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in Amazon Inspector.

Amazon Inspector EC2 scanning extracts metadata from your Amazon Elastic Compute Cloud (Amazon EC2) instance, and then compares this metadata against rules collected from security advisories to produce findings. Amazon Inspector scans instances for package vulnerabilities and network reachability issues.

This rule is covered by the [inspector-ec2-scan-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/inspector/inspector-ec2-scan-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - inspector-ec2-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector EC2 scanning is enabled

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy inspector-ec2-scan-enabled.

    ✓ Found 0 resource violations

    inspector-ec2-scan-enabled.sentinel:41:1 - Rule "main"
    Description:
        Rules

    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - inspector-ec2-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector EC2 scanning is enabled

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy inspector-ec2-scan-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_inspector2_enabler.enable_ec2
        | ✗ failed
        | Amazon Inspector EC2 scanning should be enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/inspector-controls.html#inspector-1 for more details.


    inspector-ec2-scan-enabled.sentinel:41:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---