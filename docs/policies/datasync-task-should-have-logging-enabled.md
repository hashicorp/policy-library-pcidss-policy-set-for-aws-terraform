# DataSync tasks should have logging enabled

| Provider            | Category  |
| ------------------- |  -------  |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources of type aws_datasync_task is present in the root module.

This control checks whether an AWS DataSync task has logging enabled. The control fails if the task doesn't have logging enabled.

Audit logs track and monitor system activities. They provide a record of events that can help you detect security breaches, investigate incidents, and comply with regulations. Audit logs also enhance the overall accountability and transparency of your organization.

This rule is covered by the [datasync-task-should-have-logging-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/datasync/datasync-task-should-have-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - datasync-task-should-have-logging-enabled.sentinel

        Description:
        This policy requires resources of type `aws_datasync_task` have attribute
        `cloudwatch_log_group_arn` should not be empty and log_level should not be
        'OFF'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy datasync-task-should-have-logging-enabled.

        ✓ Found 0 resource violations

        datasync-task-should-have-logging-enabled.sentinel:63:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - datasync-task-should-have-logging-enabled.sentinel

        Description:
        This policy requires resources of type `aws_datasync_task` have attribute
        `cloudwatch_log_group_arn` should not be empty and log_level should not be
        'OFF'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy datasync-task-should-have-logging-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_datasync_task.example
            | ✗ failed
            | Attribute 'cloudwatch_log_group_arn' must not be empty and 'log_level' must not be 'OFF' for 'aws_datasync_task' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/datasync-controls.html#datasync-1 for more details.


        datasync-task-should-have-logging-enabled.sentinel:63:1 - Rule "main"
        Value:
            false
```

---
