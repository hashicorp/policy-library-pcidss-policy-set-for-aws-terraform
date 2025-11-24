# Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Logging  |

## PCI DSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &cross;  |
| 4.0.1   | &check;  |

## Description

DISCLAIMER - This policy works when all resources of type (aws_cloudtrail, aws_s3_bucket_logging) are in the root module and S3_bucket references could either be a string or reference to the aws_s3_bucket resource. If the resources are in different modules, the policy will not work as expected.

S3 bucket access logging generates a log that contains access records for each request made to your S3 bucket. An access log record contains details about the request, such as the request type, the resources specified in the request worked, and the time and date the request was processed.

PCI DSS recommends that you enable bucket access logging on the CloudTrail S3 bucket.

By enabling S3 bucket logging on target S3 buckets, you can capture all events that might affect objects in a target bucket. Configuring logs to be placed in a separate bucket enables access to log information, which can be useful in security and incident response workflows.

To run this check, Security Hub first uses custom logic to look for the bucket where your CloudTrail logs are stored and then uses the AWS Config managed rule to check if logging is enabled.

If CloudTrail delivers log files from multiple AWS accounts into a single destination Amazon S3 bucket, Security Hub evaluates this control only against the destination bucket in the Region where it's located. This streamlines your findings. However, you should turn on CloudTrail in all accounts that deliver logs to the destination bucket. For all accounts except the one that holds the destination bucket, the control status is No data.


This rule is covered by the [cloudtrail-bucket-should-have-access-logging-enabled](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-bucket-should-have-access-logging-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - cloudtrail-bucket-should-have-access-logging-enabled.sentinel

    Description:
      This policy requires that resources of type `aws_cloudtrail` have bucket
      access logging enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-bucket-should-have-access-logging-enabled.

    ✓ Found 0 resource violations

    cloudtrail-bucket-should-have-access-logging-enabled.sentinel:74:1 - Rule "main"
      Value:
        true
        
```
---

## Policy Results (Fail)
```bash
trace:
    Fail - cloudtrail-bucket-should-have-access-logging-enabled.sentinel

    Description:
      This policy requires that resources of type `aws_cloudtrail` have bucket
      access logging enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-bucket-access-logging-enabled.

    Found 1 resource violations

    → Module name: root
       ↳ Resource Address: aws_cloudtrail.cloudtrail-example
         | ✗ failed
         | CloudTrail S3 buckets must have access logging enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-7 for more details.


    cloudtrail-bucket-access-logging-enabled.sentinel:74:1 - Rule "main"
      Value:
        false

```

---