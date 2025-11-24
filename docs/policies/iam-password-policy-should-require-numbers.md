# Ensure IAM password policy requires at least one number

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

PCI DSS recommends that the password policy require at least one number. Setting a password complexity policy increases account resiliency against brute force login attempts.

This rule is covered by the [iam-password-policy-should-require-numbers](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-require-numbers.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - iam-password-policy-should-require-numbers.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attribute 'require_numbers' set to true.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-policy-should-require-numbers.

        ✓ Found 0 resource violations

        iam-password-policy-should-require-numbers.sentinel:44:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - iam-password-policy-should-require-numbers.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attribute 'require_numbers' set to true.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-policy-should-require-numbers.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.strict
            | ✗ failed
            | Attribute 'reqire_numbers' must be set to true for 'aws_iam_account_password_policy'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-14 for more details.


        iam-password-policy-should-require-numbers.sentinel:44:1 - Rule "main"
        Value:
            false
```

---