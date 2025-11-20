# Ensure IAM password policy requires at least one uppercase letter

| Provider            |            Category          |
| ------------------- |  --------------------------  |
| Amazon Web Services |   Secure Access Management   |

## PCI DSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &cross;  |
| 4.0.1   | &check;  |

## Description

Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords use different character sets.

PCI DSS recommends that the password policy require at least one uppercase letter. Setting a password complexity policy increases account resiliency against brute force login attempts.

This rule is covered by the [iam-password-policy-should-have-one-uppercase-letter](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-have-one-uppercase-letter.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - iam-password-policy-should-have-one-uppercase-letter.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attribute 'require_uppercase_characters' set to true.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-policy-should-have-one-uppercase-letter.

        ✓ Found 0 resource violations

        iam-password-policy-should-have-one-uppercase-letter.sentinel:53:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - iam-password-policy-should-have-one-uppercase-letter.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attribute 'require_uppercase_characters' set to true.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-policy-should-have-one-uppercase-letter.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.strict
            | ✗ failed
            | Attribute 'require_uppercase_characters' must be set to true for 'aws_iam_account_password_policy'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-11 for more details.


        iam-password-policy-should-have-one-uppercase-letter.sentinel:53:1 - Rule "main"
        Value:
            false
```

---
