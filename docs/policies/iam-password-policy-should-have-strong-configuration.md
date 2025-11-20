# Password policies for IAM users should have strong configurations

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services | Secure Access Management |

## PCI DSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &check;  |
| 4.0.1   | &cross;  |

## Description

This control checks whether the account password policy for IAM users uses the following minimum PCI DSS configurations.

- RequireUppercaseCharacters – Require at least one uppercase character in password. (Default = true)
- RequireLowercaseCharacters – Require at least one lowercase character in password. (Default = true)
- RequireNumbers – Require at least one number in password. (Default = true)
- MinimumPasswordLength – Password minimum length. (Default = 7 or longer)
- PasswordReusePrevention – Number of passwords before allowing reuse. (Default = 4)
- MaxPasswordAge – Number of days before password expiration. (Default = 90)

This rule is covered by the [iam-password-policy-should-have-strong-configuration](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-have-strong-configuration.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
        Pass - iam-password-policy-should-have-strong-configuration.sentinel

        Description:
        This policy requires that the `aws_iam_account_password_policy` resource
        have the strong configurations

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-policy-should-have-strong-configuration.

        ✓ Found 0 resource violations

        Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
        Fail - iam-password-policy-should-have-strong-configuration.sentinel

        Description:
        This policy requires that the `aws_iam_account_password_policy` resource
        have the strong configurations

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-policy-should-have-strong-configuration.


        Found 1 resource violations

       → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.iam_example
            | ✗ failed
            | IAM account password policy must have strong configurations. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-10 for more details.



        Rule "main"
        Value:
            false
```

---