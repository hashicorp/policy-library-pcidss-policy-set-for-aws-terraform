# CloudFront distributions should use origin access control

| Provider            |         Category         |
|---------------------| -------------------------|
| Amazon Web Services | Secure access management |

## Description

DISCLAIMER - This policy works when all resources of type aws_cloudfront_distribution and aws_cloudfront_origin_access_control are present in the root module.

This control checks whether an Amazon CloudFront distribution with an Amazon S3 origin has origin access control (OAC) configured. The control fails if OAC isn't configured for the CloudFront distribution.

When using an S3 bucket as an origin for your CloudFront distribution, you can enable OAC. This permits access to the content in the bucket only through the specified CloudFront distribution, and prohibits access directly from the bucket or another distribution. Although CloudFront supports Origin Access Identity (OAI), OAC offers additional functionality, and distributions using OAI can migrate to OAC. While OAI provides a secure way to access S3 origins, it has limitations, such as lack of support for granular policy configurations and for HTTP/HTTPS requests that use the POST method in AWS Regions that require AWS Signature Version 4 (SigV4). OAI also doesn't support encryption with AWS Key Management Service. OAC is based on an AWS best practice of using IAM service principals to authenticate with S3 origins.

This rule is covered by the [cloudfront-s3-origin-access-control-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudfront/cloudfront-s3-origin-access-control-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - cloudfront-s3-origin-access-control-enabled.sentinel

    Description:
    This policy checks whether an 'aws_cloudfront_distribution' with an Amazon S3
    origin has 'aws_cloudfront_origin_access_control' configured.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudfront-s3-origin-access-control-enabled.

    ✓ Found 0 resource violations

    cloudfront-s3-origin-access-control-enabled.sentinel:88:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - cloudfront-s3-origin-access-control-enabled.sentinel

    Description:
    This policy checks whether an 'aws_cloudfront_distribution' with an Amazon S3
    origin has 'aws_cloudfront_origin_access_control' configured.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudfront-s3-origin-access-control-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_cloudfront_distribution.valid_origin
        | ✗ failed
        | 'aws_cloudfront_distribution' with an Amazon S3 origin has 'aws_cloudfront_origin_access_control' should have configured. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudfront-controls.html#cloudfront-13 for more details.


    cloudfront-s3-origin-access-control-enabled.sentinel:88:1 - Rule "main"
    Value:
        false

```
---