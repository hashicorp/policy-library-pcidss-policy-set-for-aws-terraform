# Kinesis streams should have an adequate data retention period

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services | Security  |

## Description

This control checks whether an Amazon Kinesis data stream has a data retention period greater than or equal to the specified time frame. The control fails if the data retention period is less than the specified time frame. Unless you provide a custom parameter value for the data retention period, Security Hub uses a default value of 168 hours.

In Kinesis Data Streams, a data stream is an ordered sequence of data records meant to be written to and read from in real time. Data records are stored in shards in your stream temporarily. The time period from when a record is added to when it is no longer accessible is called the retention period. Kinesis Data Streams almost immediately makes records older than the new retention period inaccessible after decreasing the retention period. For example, changing the retention period from 24 hours to 48 hours means that records added to the stream 23 hours 55 minutes prior are still available after 24 hours.

This rule is covered by the [kinesis-stream-backup-retention-check](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/kinesis/kinesis-stream-backup-retention-check.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - kinesis-stream-backup-retention-check.sentinel

    Description:
    This policy requires resources of type `aws_kinesis_stream` have attribute
    "retention_period" set to at least 168 hours (7 days).

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy kinesis-stream-backup-retention-check.

    ✓ Found 0 resource violations

    kinesis-stream-backup-retention-check.sentinel:46:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - kinesis-stream-backup-retention-check.sentinel

    Description:
    This policy requires resources of type `aws_kinesis_stream` have attribute
    "retention_period" set to at least 168 hours (7 days).

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy kinesis-stream-backup-retention-check.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_kinesis_stream.test_stream
        | ✗ failed
        | Attribute 'retention_period' must be set to at least 168 hours (7 days) for 'aws_kinesis_stream' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/kinesis-controls.html#kinesis-3 for more details.


    kinesis-stream-backup-retention-check.sentinel:46:1 - Rule "main"
    Value:
        false
```

---
