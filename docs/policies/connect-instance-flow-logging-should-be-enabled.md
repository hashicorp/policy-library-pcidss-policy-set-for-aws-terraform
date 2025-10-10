# Amazon Connect instances should have CloudWatch logging enabled

| Provider            | Category  |
| ------------------- |  -------  |
| Amazon Web Services |  Logging  |

## Description

This control checks whether an Amazon Connect instance is configured to generate and store flow logs in an Amazon CloudWatch log group. The control fails if the Amazon Connect instance isn't configured to generate and store flow logs in a CloudWatch log group.

Amazon Connect flow logs provide real-time details about events in Amazon Connect flows. A flow defines the customer experience with an Amazon Connect contact center from start to finish. By default, when you create a new Amazon Connect instance, an Amazon CloudWatch log group is created automatically to store flow logs for the instance. Flow logs can help you analyze flows, find errors, and monitor operational metrics. You can also set up alerts for specific events that can occur in a flow.

This rule is covered by the [connect-instance-flow-logging-should-be-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/connect/connect-instance-flow-logging-should-be-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - connect-instance-flow-logging-should-be-enabled.sentinel

        Description:
        This policy requires resources of type `aws_connect_instance` have attribute
        `contact_flow_logs_enabled` should be true.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy connect-instance-flow-logging-should-be-enabled.

        ✓ Found 0 resource violations

        connect-instance-flow-logging-should-be-enabled.sentinel:44:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - connect-instance-flow-logging-should-be-enabled.sentinel

        Description:
        This policy requires resources of type `aws_connect_instance` have attribute
        `contact_flow_logs_enabled` should be true.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy connect-instance-flow-logging-should-be-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_connect_instance.test
            | ✗ failed
            | Attribute 'contact_flow_logs_enabled' must be true for 'aws_connect_instance' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/connect-controls.html#connect-2 for more details.


        connect-instance-flow-logging-should-be-enabled.sentinel:44:1 - Rule "main"
        Value:
            false
```

---
