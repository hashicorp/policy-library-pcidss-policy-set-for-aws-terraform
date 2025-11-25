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

IAM password policies can require passwords to be rotated or expired after a given number of days.

PCI DSS recommends that the password policy expire passwords after 90 days or less. Reducing the password lifetime increases account resiliency against brute force login attempts. Requiring regular password changes also helps in the following scenarios:

 - Passwords can be stolen or compromised without your knowledge. This can happen via a system compromise, software vulnerability, or internal threat.

 - Certain corporate and government web filters or proxy servers can intercept and record traffic even if it's encrypted.

 - Many people use the same password for many systems such as work, email, and personal.

 - Compromised end-user workstations might have a keystroke logger.

This rule is covered by the [iam-password-policy-should-require-numbers](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-expire-within-90-days.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - iam-password-policy-should-expire-within-90-days.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attributes 'max_password_age' to be non null and less than or equal to 90 days and "expire_passwords" set to true.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-policy-should-expire-within-90-days.

        ✓ Found 0 resource violations

        iam-password-policy-should-expire-within-90-days.sentinel:47:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - iam-password-policy-should-expire-within-90-days.sentinel

        Description:
        This policy requires `aws_iam_account_password_policy` resources to have
        attributes 'max_password_age' to be non null and less than or equal to 90 days and "expire_passwords" set to true.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-policy-should-expire-within-90-days.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.strict
            | ✗ failed
            | Attribute 'max_password_age' must be less than or equal to 90 days for 'aws_iam_account_password_policy'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-17 for more details.


        iam-password-policy-should-expire-within-90-days.sentinel:47:1 - Rule "main"
        Value:
            false
```

---