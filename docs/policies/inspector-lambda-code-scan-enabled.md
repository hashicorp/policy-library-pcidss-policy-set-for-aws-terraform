# Amazon Inspector Lambda code scanning should be enabled

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services |    Detection services    |

## Description

This control checks whether Amazon Inspector Lambda code scanning is enabled. For a standalone account, the control fails if Amazon Inspector Lambda code scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have Lambda code scanning enabled.

In a multi-account environment, the control generates findings in only the delegated Amazon Inspector administrator account. Only the delegated administrator can enable or disable the Lambda code scanning feature for the member accounts in the organization. Amazon Inspector member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated administrator has a suspended member account that doesn't have Amazon Inspector Lambda code scanning enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in Amazon Inspector.

Amazon Inspector Lambda code scanning scans the custom application code within an AWS Lambda function for code vulnerabilities based on AWS security best practices. Lambda code scanning can detect injection flaws, data leaks, weak cryptography, or missing encryption in your code.

This rule is covered by the [inspector-lambda-code-scan-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/inspector/inspector-lambda-code-scan-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - inspector-lambda-code-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector Lambda code scanning is enabled

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy inspector-lambda-code-scan-enabled.

    ✓ Found 0 resource violations

    inspector-lambda-code-scan-enabled.sentinel:41:1 - Rule "main"
    Description:mak
        Rules

    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - inspector-lambda-code-scan-enabled.sentinel

    Description:
    This policy ensures that Amazon Inspector Lambda code scanning is enabled

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy inspector-lambda-code-scan-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_inspector2_enabler.enable_ec2
        | ✗ failed
        | Amazon Inspector Lambda code scanning should be enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/inspector-controls.html#inspector-3 for more details.


    inspector-lambda-code-scan-enabled.sentinel:41:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---