# S3 general purpose buckets should log object-level write events

| Provider            |            Category          |
| ------------------- |  --------------------------  |
| Amazon Web Services |            Logging           |

## Description

This control checks whether an AWS account has at least one AWS CloudTrail multi-Region trail that logs all write data events for Amazon S3 buckets. The control fails if the account doesn't have a multi-Region trail that logs write data events for S3 buckets.

This rule is covered by the [cloudtrail-should-log-s3-object-write-events](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-should-log-s3-object-write-events.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - cloudtrail-should-log-s3-object-write-events.sentinel

        Description:
        S3 general purpose buckets should log object-level write events

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-log-object-level-write-events.

        ✓ Found 0 resource violations

        cloudtrail-should-log-s3-object-write-events.sentinel:108:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - cloudtrail-should-log-s3-object-write-events.sentinel

        Description:
        S3 general purpose buckets should log object-level write events

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-log-object-level-write-events.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: AWS::::Account
            | ✗ failed
            | S3 general purpose buckets should log object-level write events. At least one multi-region CloudTrail trail must log all write data events for S3 buckets. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-22 for more details.


        cloudtrail-should-log-s3-object-write-events.sentinel:108:1 - Rule "main"
        Value:
            false
```

---