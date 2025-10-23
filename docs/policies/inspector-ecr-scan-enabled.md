# Amazon Inspector ECR scanning should be enabled

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services |    Detection services    |

## Description

This control checks whether Amazon Inspector ECR scanning is enabled. For a standalone account, the control fails if Amazon Inspector ECR scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have ECR scanning enabled.

In a multi-account environment, the control generates findings in only the delegated Amazon Inspector administrator account. Only the delegated administrator can enable or disable the ECR scanning feature for the member accounts in the organization. Amazon Inspector member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated administrator has a suspended member account that doesn't have Amazon Inspector ECR scanning enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in Amazon Inspector.

Amazon Inspector scans container images stored in Amazon Elastic Container Registry (Amazon ECR) for software vulnerabilities to generate package vulnerability findings. When you activate Amazon Inspector scans for Amazon ECR, you set Amazon Inspector as your preferred scanning service for your private registry. This replaces basic scanning, which is provided at no charge by Amazon ECR, with enhanced scanning, which is provided and billed through Amazon Inspector. Enhanced scanning gives you the benefit of vulnerability scanning for both operating system and programming language packages at the registry level. You can review findings discovered using enhanced scanning at the image level, for each layer of the image, on the Amazon ECR console. Additionally, you can review and work with these findings in other services not available for basic scanning findings, including AWS Security Hub and Amazon EventBridge.

This rule is covered by the [inspector-ecr-scan-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/inspector/inspector-ecr-scan-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - inspector-ecr-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector ECR scanning is enabled

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy inspector-ecr-scan-enabled.

    ✓ Found 0 resource violations

    inspector-ecr-scan-enabled.sentinel:41:1 - Rule "main"
    Description:
        Rules

    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - inspector-ecr-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector ECR scanning is enabled

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy inspector-ecr-scan-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_inspector2_enabler.enable_ec2
        | ✗ failed
        | Amazon Inspector ECR scanning should be enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/inspector-controls.html#inspector-2 for more details.


    inspector-ecr-scan-enabled.sentinel:41:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---