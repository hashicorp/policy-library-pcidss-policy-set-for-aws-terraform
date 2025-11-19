# At least one CloudTrail trail should be enabled

| Provider            |            Category          |
| ------------------- |  --------------------------  |
| Amazon Web Services |            Logging           |

## Description

This control checks whether an AWS CloudTrail trail is enabled in your AWS account.
The control fails if your account doesn't have at least one CloudTrail trail enabled.

This rule is covered by the [cloudtrail-at-least-one-should-be-enabled](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-at-least-one-trail-should-be-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - cloudtrail-at-least-one-trail-should-be-enabled.sentinel

        Description:
        This policy requires at least one CloudTrail trail to be enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy cloudtrail-enabled.

        ✓ Found 0 resource violations

        cloudtrail-at-least-one-trail-should-be-enabled.sentinel:54:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - cloudtrail-at-least-one-trail-should-be-enabled.sentinel

        Description:
        This policy requires at least one CloudTrail trail to be enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_cloudtrail
            | ✗ failed
            | At least one CloudTrail trail should be enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3 for more details.


        cloudtrail-at-least-one-trail-should-be-enabled.sentinel:54:1 - Rule "main"
        Value:
            false
```

---