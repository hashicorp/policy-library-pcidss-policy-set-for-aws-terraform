# Ensure IAM password policy prevents password reuse

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services | Secure Access Management |

## PCI DSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &cross;  |
| 4.0.1   | &check;  |

## Description

This control checks whether the number of passwords to remember is set to 24. The control fails if the value is not 24.

IAM password policies can prevent the reuse of a given password by the same user.

CIS recommends that the password policy prevent the reuse of passwords. Preventing password reuse increases account resiliency against brute force login attempts.

This rule is covered by the [iam-password-policy-should-prevent-password-reuse](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-prevent-password-reuse.sentinel) policy.


## Policy Results (Pass)
```bash
trace:
        Pass - iam-password-policy-should-prevent-password-reuse.sentinel

        Description:
        This policy ensures IAM password policy prevents password reuse

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-policy-prevents-reuse.

        ✓ Found 0 resource violations

        iam-password-policy-should-prevent-password-reuse.sentinel:45:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
        Fail - iam-password-policy-should-prevent-password-reuse.sentinel

        Description:
        This policy ensures IAM password policy prevents password reuse

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-policy-prevents-reuse.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.strict
            | ✗ failed
            | IAM password policy must prevent password reuse. The 'password_reuse_prevention' attribute must be set to a value between 1 and 24 for 'aws_iam_account_password_policy' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-16 for more details.


        iam-password-policy-should-prevent-password-reuse.sentinel:45:1 - Rule "main"
        Value:
            false
```

---