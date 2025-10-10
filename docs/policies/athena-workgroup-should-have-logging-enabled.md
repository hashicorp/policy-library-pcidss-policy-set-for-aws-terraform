# Athena workgroups should have logging enabled

| Provider            |      Category     |
| ------------------- |  ---------------  |
| Amazon Web Services |  Data Protection  |

## Description

This control checks whether an Amazon Athena workgroup has logging enabled. The control fails if the workgroup doesn't have logging enabled.

Audit logs track and monitor system activities. They provide a record of events that can help you detect security breaches, investigate incidents, and comply with regulations. Audit logs also enhance the overall accountability and transparency of your organization.

This rule is covered by the [athena-workgroup-should-have-logging-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/athena/athena-workgroup-should-have-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - athena-workgroup-should-have-logging-enabled.sentinel

        Description:
        This policy requires resources of type `aws_athena_workgroup` have attribute
        `publish_cloudwatch_metrics_enabled` should be `true`.

        Print messages:

        CloudWatch enabled value:  true
        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy athena-workgroup-should-have-logging-enabled.

        ✓ Found 0 resource violations

        athena-workgroup-should-have-logging-enabled.sentinel:54:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - athena-workgroup-should-have-logging-enabled.sentinel

        Description:
        This policy requires resources of type `aws_athena_workgroup` have attribute
        `publish_cloudwatch_metrics_enabled` should be `true`.

        Print messages:

        CloudWatch enabled value:  false
        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy athena-workgroup-should-have-logging-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_athena_workgroup.example
            | ✗ failed
            | Attribute 'publish_cloudwatch_metrics_enabled' must be set to 'true' for 'aws_athena_workgroup' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/athena-controls.html#athena-4 for more details.


        athena-workgroup-should-have-logging-enabled.sentinel:54:1 - Rule "main"
        Value:
            false
```

---
