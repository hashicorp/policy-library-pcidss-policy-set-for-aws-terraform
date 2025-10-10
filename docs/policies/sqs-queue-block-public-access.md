# SQS queue access policies should not allow public access

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |  Secure Access management   |

## Description

DISCLAIMER - This policy works when all resources of type aws_sqs_queue, aws_sqs_queue_policy and aws_iam_policy_document are present in the root module.

This controls checks whether an Amazon SQS access policy allows public access to an SQS queue. The control fails if an SQS access policy allows public access to the queue.

An Amazon SQS access policy can allow public access to an SQS queue, which might allow an anonymous user or any authenticated AWS IAM identity to access the queue. SQS access policies typically provide this access by specifying the wildcard character (*) in the Principal element of the policy, not using proper conditions to restrict access to the queue, or both. 

This rule is covered by the [sqs-queue-block-public-access](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/sqs-queue-block-public-access.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - sqs-queue-block-public-access.sentinel

        Description:
        This policy requires resources of type `aws_sqs_queue` should not be public by
        the resource 'aws_sqs_queue_policy'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy sqs-queue-block-public-access.

        ✓ Found 0 resource violations

        sqs-queue-block-public-access.sentinel:103:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - sqs-queue-block-public-access.sentinel

        Description:
        This policy requires resources of type `aws_sqs_queue` should not be public by
        the resource 'aws_sqs_queue_policy'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sqs-queue-block-public-access.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_sqs_queue.q
            | ✗ failed
            | SQS queue access policies should not allow public access. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/sqs-controls.html#sqs-3 for more details.


        sqs-queue-block-public-access.sentinel:103:1 - Rule "main"
        Value:
            false
```

---
