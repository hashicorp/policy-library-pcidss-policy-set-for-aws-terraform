# Pre-written Sentinel Policies for AWS PCI DSS Foundations Benchmarking

Pre-written Sentinel policies are ready to use compliance checks for PCI DSS AWS Foundations Benchmarking to help enable your AWS resources meet industry security standards.

At HashiCorp, we’re committed to making policy management easier for our customers. We understand that developing policies from scratch can be time-consuming and resource-intensive. To address this, we’re introducing our Prewritten Policy Libraries—expertly crafted, ready-to-use policies designed to streamline your compliance processes and enhance security across your infrastructure.

This repository contains several policies designed to accelerate the adoption of the PCI DSS AWS Foundations Benchmark within HCP Terraform. These policies can be utilized to enforce best practices and security standards across your AWS environment.

For more details on how to work with these policies and to understand the Sentinel language and framework, please refer to the [Sentinel documentation](https://developer.hashicorp.com/sentinel/) or the README documentation included with each of the policy [libraries](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies).

## Feedback

We aim to validate the effectiveness of our policies by collecting diverse user feedback and understanding real-world use cases. This input will help refine our policies and enhance their overall impact.

1. You can submit your feedback via a [public survey](https://docs.google.com/forms/d/e/1FAIpQLScswwLMaVaRuYRGJzDjNiycwM4BUa_gAIsAE_zOPdgyFeLXCA/viewform).

2. If you have any issues or enhancement suggestions to the library, please create [a new GitHub issue](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/issues/new).

3. Alternatively, we welcome any contributions that improve the impact of this library! To learn more about contributing and suggesting changes to this library, refer to the [contributing guide](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/CONTRIBUTING.md).

## Getting Started

This getting started guide assumes that:

1. You are familiar with core workflows in HCP Terraform and Terraform Enterprise, and you have an existing workspace configured with AWS access credentials.

   > **Tip:** If you do not have these prerequisites, please refer to the [Use VCS-Driven Workflow](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change) and [Create a Variable Set](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-variable-set) tutorials for guidance.

2. You have a user account that is part of the ["owners"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#organization-owners) team or have ["Manage Policies"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#manage-policies) organization-level permissions to create new policy sets and policies.

3. Ensure you are using HCP Terraform or Terraform Enterprise [v202312-1](https://developer.hashicorp.com/terraform/enterprise/releases/2023/v202312-1) or a later version.

4. You are using Sentinel version 0.26.x and later version.

By default, the module will enable all policies within the library, and they will be enforced by the HCP Platform with the `enforcement_level` set to `advisory` only.

**Example:**

```
policy "iam-password-policy-strong-configuration" {
  source = "./policies/iam/iam-password-policy-strong-configuration.sentinel"
  enforcement_level = "advisory"
  params = {
    minimum_password_length_param = 14
  }
}
```

If you want to enable only a subset of the policies or change the [enforcement levels](https://developer.hashicorp.com/sentinel/docs/concepts/enforcement-levels) to either `soft-mandatory` or `hard-mandatory`, we recommend updating the contents of the `sentinel.hcl` file in each library before applying the Terraform configuration.

> **Important:**
> The policies in each library are opinionated and depend on several Sentinel modules. To learn more about modules, please refer to the [Sentinel module](https://developer.hashicorp.com/sentinel/docs/extending/modules) documentation.
>
> To learn more about how to configure a policy set as a [policy evaluation](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets#policy-evaluations), please review the Terraform Enterprise provider [documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/policy_set#agent_enabled).

## Consuming Pre-Written Sentinel Policies for PCI DSS AWS Foundations Benchmark

Following methods outlines various ways to consume and implement pre-written Sentinel policies for the PCI DSS AWS Foundations Benchmark. These policies can be used in both Terraform Enterprise (TFE) and HCP Terraform environments. Below are the recommended methods for integrating these policies into your workflows.

### Terraform Registry Method:

- Navigate to the [Terraform Registry](https://registry.terraform.io/browse/policies) and select the desired Sentinel policy.
- Copy the provided policy snippet from the registry.
- Create a GitHub repository (or use an existing one) to store your policies.
- Add a Sentinel.hcl file to the repository and paste the copied policy snippet(s) into this file.
- Connect the repository to HCP Terraform or Terraform Enterprise using the VCS (Version Control System) workflow.
- Trigger policy execution automatically during the plan stage in HCP Terraform or Terraform Enterprise.

### Using the Public GitHub Repository:

- Access the public GitHub repository containing the policy library.
- You can directly use the repository as-is or fork it to customize the policies for your specific requirements.
- If forking, ensure you sync your fork with the upstream repository periodically to stay updated with the latest changes.
- Avoid using the default branch for consumption in HCP Terraform or Terraform Enterprise. Instead, use the release branches for better stability.
- Attach the repository (or your fork) to HCP Terraform or Terraform Enterprise using the VCS workflow.
- Run a Terraform plan to execute the policies during the post-plan stage.

#### Notes and Best Practices

- These policies are compatible with both HCP Terraform (HCPT) and Terraform Enterprise (TFE). Ensure your workflow is configured accordingly.
- When using the public GitHub repository, it is recommended to use release branches for stability and avoid consuming policies directly from the default branch.
- Regularly update your policies to align with the latest PCI DSS AWS Foundations Benchmark standards and Terraform best practices.
- Customize policies as needed to meet your organization's specific compliance and security requirements.

## Resources

- [Get Started - HCP Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started)
- [Connecting VCS Providers to HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Policy Enforcement](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement)
- [Managing Policy Sets](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets)
- [Introduction to Sentinel](https://developer.hashicorp.com/sentinel/intro/what)
- [Sentinel Documentation](https://developer.hashicorp.com/sentinel/docs)
- [Sentinel Language](https://developer.hashicorp.com/sentinel/docs/language/)
- [Sentinel Language Specification](https://developer.hashicorp.com/sentinel/docs/language/spec)
- [Policy Libraries](https://registry.terraform.io/browse/policies)

### Policies Included

- This policy checks if resources of type 'aws_redshift_cluster' have the ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-audit-logging-enabled.sentinel))

- This policy requires resources of type `aws_dms_endpoint` have attribute "ssl_mode" set to one of: require, verify-ca, verify-full. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-endpoints-should-use-ssl.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-endpoints-should-use-ssl.sentinel))

- This policy requires resources of type `aws_elasticsearch_domain` have the `log_publishing_options` should have 'enabled' attribute set to `true` and 'log_type' set to 'AUDIT_LOGS'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-audit-logging-enabled.sentinel))

- This policy requires resources of type `aws_elasticsearch_domain` have the `tls_security_policy` set to latest policy that is 'Policy-Min-TLS-1-2-PFS-2023-10' and 'enforce_https' set to true for `domain_endpoint_options` attribute. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-https-required.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-https-required.sentinel))

- This control checks if Amazon S3 logs for an 'aws_codebuild_project' are encrypted. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/codebuild-s3-logs-should-be-encrypted.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-s3-logs-should-be-encrypted.sentinel))

- This policy requires that the `aws_elasticache_replication_group` resource with `engine_version` ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-replication-group-redis-auth-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-replication-group-redis-auth-enabled.sentinel))

- This control checks whether 'aws_cloudfront_distribution' are using deprecated SSL protocols for HTTPS communication between CloudFront edge locations and your custom origins. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-not-use-deprecated-ssl-protocols.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-not-use-deprecated-ssl-protocols.sentinel))

- This control checks whether server access logging is enabled on 'aws_cloudfront_distribution'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-have-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-have-logging-enabled.sentinel))

- This control checks whether 'aws_guardduty_detector' is enabled in your GuardDuty account and Region. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/guardduty-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/guardduty/guardduty-should-be-enabled.sentinel))

- This policy checks if resources of type 'aws_opensearch_domain' have the 'enable' attribute set to true and 'log_type' set to 'AUDIT_LOGS' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-audit-logging-enabled.sentinel))

- // This policy requires `aws_network_acl` resources to have 'subnet_ids' present. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-network-acl-should-have-subnet-ids.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-network-acl-should-have-subnet-ids.sentinel))

- This policy requires resources of type `aws_vpc` to have no traffic for default security group. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-vpc-default-security-group-no-traffic.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-vpc-default-security-group-no-traffic.sentinel))

- This policy checks if 'aws_eks_cluster' does not ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-supported-k8s-version-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-supported-k8s-version-check.sentinel))

- This policy checks if 'aws_eks_cluster' uses KMS ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-encrypted-kubernetes-secrets.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-encrypted-kubernetes-secrets.sentinel))

- This policy checks if 'aws_eks_cluster' resources have ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-audit-logging-enabled.sentinel))

- This control checks whether an Amazon Aurora PostgreSQL DB cluster is configured to publish logs to Amazon CloudWatch Logs. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/aurora-postgresql-db-clusters-should-publish-logs-to-cloudwatch-logs.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/aurora-postgresql-db-clusters-should-publish-logs-to-cloudwatch-logs.sentinel))

- This policy verifies if the attributes of the 'aws_s3_bucket_public_access_block' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-block-public-access-bucket-level.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-block-public-access-bucket-level.sentinel))

- This control checks whether an Amazon S3 Multi-Region Access Point has block public access settings enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-multi-region-access-points-should-have-block-public-access-settings-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-multi-region-access-points-should-have-block-public-access-settings-enabled.sentinel))

- This policy checks if resources of type 'aws_dms_replication_instance' have the 'auto_minor_version_upgrade' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-auto-minor-version-upgrade-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-auto-minor-version-upgrade-check.sentinel))

- This policy requires resources of type `aws_elasticsearch_domain` have the `subnet_ids` should not be empty inside 'vpc_options'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-in-vpc-only.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-in-vpc-only.sentinel))

- This policy checks if resources of type 'aws_rds_cluster' have the 'master_username' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-cluster-default-admin-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-cluster-default-admin-check.sentinel))

- This policy requires that resources of type `aws_cloudtrail` have server-side encryption enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-server-side-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel))

- This policy checks if resources of type 'aws_redshift_cluster' referenced to the ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-should-be-encrypted-at-transit.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-should-be-encrypted-at-transit.sentinel))

- This policy checks whether logging is enabled for an 'aws_waf_web_acl'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/waf-classic-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/waf/waf-classic-logging-enabled.sentinel))

- // This policy checks whether 'aws_cloudfront_distribution' are associated with either AWS WAF Classic or AWS WAF web ACLs. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-associated-with-waf.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-associated-with-waf.sentinel))

- This policy requires resources of type `aws_secretsmanager_secret` should be configured for automatic rotation. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/secretsmanager-auto-rotation-enabled-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/secretsmanager/secretsmanager-auto-rotation-enabled-check.sentinel))

- This policy requires resources of type `aws_acm_certificate` with rsa key algorithm should have atleast 2048 bits key length. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/acm-rsa-certificate-key-length-atleast-2048.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/acm/acm-rsa-certificate-key-length-atleast-2048.sentinel))

- This policy checks if resources of type 'aws_dms_replication_task' have the 'replication_task_settings' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-replication-task-sourcedb-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-replication-task-logging-enabled.sentinel))

- This policy checks if resources of type 'aws_dms_endpoint' have the 'certificate_arn' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-endpoint-should-be-ssl-configured.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-endpoint-should-be-ssl-configured.sentinel))

- This policy requires AWS Step Functions state machines to have logging configuration enabled with level set to "ALL", "ERROR", or "FATAL". ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/step-functions-state-machine-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/stepfunction/step-functions-state-machine-logging-enabled.sentinel))

- This policy requires `aws_cloudwatch_event_bus` resources to be attached to a policy. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/eventbridge-custom-event-bus-should-have-attached-policy.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/eventbridge/eventbridge-custom-event-bus-should-have-attached-policy.sentinel))

- This policy ensures that Amazon Inspector Lambda code scanning is enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/inspector-lambda-code-scan-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/inspector/inspector-lambda-code-scan-enabled.sentinel))

- This policy requires resources of type `aws_efs_access_point` have attribute `posix_user` should be defined. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/efs-access-point-should-enforce-user-identity.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/efs/efs-access-point-should-enforce-user-identity.sentinel))

- This policy requires resources of type `aws_elasticsearch_domain` have the `encrypt_at_rest` should have 'enabled' attribute set to `true`. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-encrypted-at-rest.sentinel))

- This control checks whether 'aws_guardduty_detector' S3 Protection is enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/guardduty-s3-protection-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/guardduty/guardduty-s3-protection-should-be-enabled.sentinel))

- S3 general purpose buckets should block public read access ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-block-public-read-access.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-block-public-read-access.sentinel))

- // This policy requires `aws_subnet` resources to have attribute 'map_public_ip_on_launch' to be false. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-subnet-with-auto-assign-public-ip-disabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-subnet-with-auto-assign-public-ip-disabled.sentinel))

- This policy checks if classic load balancers with SSL listeners ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-ssl-listener-predefined-security-policy.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-ssl-listener-predefined-security-policy.sentinel))

- This policy requires resources of type `aws_db_instance` to have `enabled_cloudwatch_logs_exports` set to valid array of values. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-cloudwatch-logs-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cloudwatch-logs-enabled.sentinel))

- This policy checks if resources of type 'aws_dms_endpoint' have the 'ssl_security_protocol' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-redis-tls-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-redis-tls-enabled.sentinel))

- This policy requires that the elasticbeanstalk environment have platform updates enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticbeanstalk-managed-platform-updates-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticbeanstalk/elasticbeanstalk-managed-platform-updates-enabled.sentinel))

- This policy checks if resources of type 'aws_redshift_cluster' have the 'publicly_accessible' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-public-access-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-public-access-check.sentinel))

- This policy checks if resources of type 'aws_launch_template' have the attribute ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-launch-template-imdsv2-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-launch-template-imdsv2-check.sentinel))

- This control checks whether 'aws_guardduty_detector_feature' EKS Runtime Monitoring with automated agent management is enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/guardduty-eks-protection-runtime-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/guardduty/guardduty-eks-protection-runtime-should-be-enabled.sentinel))

- IAM policies should not allow administrator privileges to users/roles/groups. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-no-admin-privileges-allowed-by-policies.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-no-admin-privileges-allowed-by-policies.sentinel))

- This policy checks if application load balancers are configured ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elb-drop-invalid-http-headers.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-drop-invalid-http-headers.sentinel))

- This control checks whether an Amazon RDS for PostgreSQL DB instance is configured to publish logs to Amazon CloudWatch Logs. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-for-postgresql-db-instances-should-publish-logs-to-cloudwatch-logs.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-for-postgresql-db-instances-should-publish-logs-to-cloudwatch-logs.sentinel))

- S3 Buckets should have object lock enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-should-have-object-lock-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-should-have-object-lock-enabled.sentinel))

- S3 Buckets should have cross-region replication enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-should-use-cross-region-replication.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-should-use-cross-region-replication.sentinel))

- This policy requires that the `aws_dax_cluster` resource has `cluster_endpoint_encryption_type` attribute set to `TLS` ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.sentinel))

- This policy requires block public access setting is enabled and any port other than 22 should not be allowed ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/emr-block-public-access-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/emr/emr-block-public-access-enabled.sentinel))

- This policy checks whether OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-in-vpc-only.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-in-vpc-only.sentinel))

- This policy checks if resources of type 'aws_ecr_repository' have ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ecr-image-scanning-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ecr/ecr-image-scanning-enabled.sentinel))

- This policy checks if resources of type 'aws_ecs_service' have ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-service-no-public-ip-assignment.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-service-no-public-ip-assignment.sentinel))

- This policy requires that the elasticbeanstalk environment have cloudwatch log streaming enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticbeanstalk-cloudwatch-log-streaming-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticbeanstalk/elasticbeanstalk-cloudwatch-log-streaming-enabled.sentinel))

- This policy checks if resources of type 'aws_mq_broker' have the 'auto_minor_version_upgrade' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/mq-auto-minor-version-upgrade-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/mq/mq-auto-minor-version-upgrade-enabled.sentinel))

- This policy requires resources of type `aws_elasticsearch_domain` have the `enabled` value set to 'true' for `node_to_node_encrytion` attribute. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-node-to-node-encryption-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-node-to-node-encryption-check.sentinel))

- This policy checks if resources of type 'aws_opensearch_domain' have the 'auto_software_update_enabled' attribute set to true ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-update-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-update-check.sentinel))

- This control checks whether the 'aws_lambda_function' resource-based policy prohibits public access outside of your account. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/lambda-function-public-access-prohibited.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/lambda/lambda-function-public-access-prohibited.sentinel))

- This control checks if DNS query logging is enabled for an Amazon Route 53 public hosted zone. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/route-53-public-hosted-zones-should-log-dns-queries.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/route53/route-53-public-hosted-zones-should-log-dns-queries.sentinel))

- This policy checks if the aws rds instances are publicly accessible ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-instance-should-be-private.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-instance-should-be-private.sentinel))

- This policy checks if resources of type 'aws_dms_endpoint' have the 'auth_mechanism' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-mongo-db-authentication-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-mongo-db-authentication-enabled.sentinel))

- This policy ensures that Amazon Inspector EC2 scanning is enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/inspector-ec2-scan-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/inspector/inspector-ec2-scan-enabled.sentinel))

- This policy requires resources of type `aws_mskconnect_connector` to have encryption in transit enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/msk-connect-connector-encrypted.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/msk/msk-connect-connector-encrypted.sentinel))

- This policy requires that the `auto_minor_version_upgrade` attribute of the `aws_elasticache_cluster` or `aws_elasticache_replication_group` ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-cluster-auto-minor-version-upgrade-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-cluster-auto-minor-version-upgrade-enabled.sentinel))

- This policy checks if resources of type 'aws_mq_broker' have the attribute 'logs' with parameter ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/mq-cloudwatch-audit-log-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/mq/mq-cloudwatch-audit-log-enabled.sentinel))

- This policy requires resources of type `aws_cloudtrail` to have log file validation enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-log-file-validation-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel))

- This control checks whether 'aws_cloudfront_distribution' are encrypting traffic to custom origins. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.sentinel))

- This control checks whether an 'aws_cloudfront_distribution' is configured to return a specific object ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-should-have-default-root-object-configured.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-should-have-default-root-object-configured.sentinel))

- S3 general purpose buckets should block public write access ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-block-public-write-access.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-block-public-write-access.sentinel))

- This policy requires `aws_autoscaling_group` resources to be associated with load balancers and to have attribute 'health_check_health_check_type' should be 'ELB'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/autoscaling-group/autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel))

- This policy requires resources of type `aws_ecs_task_set` have attribute `assign_public_ip` should be false. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-task-set-assign-public-ip-disabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-set-assign-public-ip-disabled.sentinel))

- This policy mandates all requests to 'aws_s3_bucket' resources to use ssl using 'aws_s3_bucket_policy' resource. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-require-ssl.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-require-ssl.sentinel))

- This policy requires attribute 'enable_cloudwatch_logs_exports' to contain 'audit' for 'aws_neptune_cluster' resources ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/neptune-cluster-audit-logs-publishing-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/neptune/neptune-cluster-audit-logs-publishing-enabled.sentinel))

- This policy requires `aws_ebs_snapshot_block_public_access` resources to have attribute state to either 'block-new-sharing' or 'block-all-sharing'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-ebs-snapshot-public-restorable-check-account-level.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-ebs-snapshot-public-restorable-check-account-level.sentinel))

- WAFv2 Web ACLs should have logging enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/wafv2-webacl-should-have-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/waf/wafv2-webacl-should-have-logging-enabled.sentinel))

- This policy requires resources of type `aws_launch_configuration` should have 'associate_public_ip_address' set to false. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/autoscaling-launch-config-public-ip-disabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/autoscaling-group/autoscaling-launch-config-public-ip-disabled.sentinel))

- This policy checks if resources of type 'aws_ecs_service' with ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-fargate-service-platform-compatibility.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-fargate-service-platform-compatibility.sentinel))

- This policy checks if resources of type 'aws_docdb_cluster' have the 'backup-retention-period' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/docdb-cluster-backup-retention-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/docdb/docdb-cluster-backup-retention-check.sentinel))

- IAM users should not be directly attached to IAM policies. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-no-policies-attached-to-users.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-no-policies-attached-to-users.sentinel))

- This policy checks if resources of type 'aws_docdb_cluster' have the 'enabled_cloudwatch_logs_exports attribute' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/docdb-cluster-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/docdb/docdb-cluster-audit-logging-enabled.sentinel))

- This policy requires that the `aws_iam_account_password_policy` resource ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-password-policy-strong-configuration.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-strong-configuration.sentinel))

- Lambda.3 ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/lambda-functions-should-be-in-a-vpc.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/lambda/lambda-functions-should-be-in-a-vpc.sentinel))

- This policy checks if the container definitions contain non allow listed ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-task-definition-no-secrets-as-environment-variables.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-no-secrets-as-environment-variables.sentinel))

- This policy requires resources of type 'aws_instance' or 'aws_ec2_instance_metadata_defaults' to have 'http_tokens' attribute set to 'required'. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-metadata-imdsv2-required.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-metadata-imdsv2-required.sentinel))

- This policy checks if 'aws_eks_cluster' resources have ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-endpoints-restrict-public-access.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-endpoints-restrict-public-access.sentinel))

- S3 Buckets should have encryption enabled at rest with AWS KMS Key ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-should-be-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-should-be-encrypted-at-rest.sentinel))

- This policy requires resources of type `aws_network_acl` and `aws_network_acl_rule` ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-network-acl.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-network-acl.sentinel))

- This policy requires AWS Transfer Servers shouldn't contain "FTP" for the attribute protocols. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/transfer-family-server-should-not-use-ftp.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/transfer/transfer-family-server-should-not-use-ftp.sentinel))

- This policy ensures that Amazon Inspector ECR scanning is enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/inspector-ecr-scan-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/inspector/inspector-ecr-scan-enabled.sentinel))

- This policy checks if 'aws_apigatewayv2_stage' have access logging configured. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/api-gateway-access-logging-should-be-configured.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-access-logging-should-be-configured.sentinel))

- This policy ensures that application load balancer in the terraform configurations ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-http-request-redirection.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-http-request-redirection.sentinel))

- This policy checks if resources of type 'aws_rds_cluster' with 'aurora-mysql' engine ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-aurora-mysql-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-aurora-mysql-audit-logging-enabled.sentinel))

- This control checks whether an 'aws_cloudfront_distribution' requires viewers to use HTTPS directly or whether it uses redirection. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-should-require-encryption-in-transit.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-should-require-encryption-in-transit.sentinel))

- This policy checks if resources of type 'aws_vpn_connection' have the cloudwatch logs ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-vpn-connection-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-vpn-connection-logging-enabled.sentinel))

- This policy requires resources of type `aws_appsync_graphql_api` have attribute `log_config` with `field_log_level` set to `ERROR` or `ALL`. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/appsync-field-level-logging-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/appsync/appsync-field-level-logging-should-be-enabled.sentinel))

- This policy requires that the `transit_encryption_enabled` attribute of the `aws_elasticache_replication_group` resource is true. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-replication-group-encryption-at-transit-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-replication-group-encryption-at-transit-enabled.sentinel))

- This policy checks if resources of type 'aws_elb' have listeners ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elb-configure-https-tls-termination-classic-load-balancer.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-configure-https-tls-termination-classic-load-balancer.sentinel))

- This control checks whether 'aws_lambda_function' runtime settings match the expected values set for the supported runtimes in each language. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/lambda-functions-should-use-supported-runtimes.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/lambda/lambda-functions-should-use-supported-runtimes.sentinel))

- This policy checks if resources of type 'aws_sagemaker_notebook_instance' have the 'direct_internet_access' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/sagemaker-notebook-no-direct-internet-access.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-notebook-no-direct-internet-access.sentinel))

- This policy checks if resources of type 'aws_dms_replication_instance' have the 'publicly_accessible' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/dms-replication-instances-should-not-be-public.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/dms/dms-replication-instances-should-not-be-public.sentinel))

- This policy checks if resources of type 'aws_msk_cluster' have the 'in_cluster' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/msk-in-cluster-node-require-encrypted-in-transit.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/msk/msk-in-cluster-node-require-encrypted-in-transit.sentinel))

- This policy checks if resources of type 'aws_opensearch_domain' have the 'enable' attribute set to true ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-encrypted-at-rest.sentinel))

- This policy requires resources of type `aws_s3_access_point` to have all attributes ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-access-point-block-public-access-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-access-point-block-public-access-enabled.sentinel))

- This policy checks if resources of type 'aws_db_instance' have the 'username' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-instance-default-admin-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-instance-default-admin-check.sentinel))

- This policy checks if resources of type 'aws_ec2_client_vpn_endpoint' have the cloudwatch logs ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-client-vpn-connection-log-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-client-vpn-connection-log-enabled.sentinel))

- This policy ensures that Amazon Inspector Lambda standard scanning is enabled ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/inspector-lambda-standard-scan-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/inspector/inspector-lambda-standard-scan-enabled.sentinel))

- This policy requires resources of type `aws_security_group`, `aws_security_group_rule` and `aws_vpc_security_group_ingress_rule` ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-unrestricted-port-access-check.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-unrestricted-port-access-check.sentinel))

- This policy requires resources of type `aws_vpc` and `aws_default_vpc` to have flow logs enabled. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-vpc-flow-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-vpc-flow-logging-enabled.sentinel))

- This policy checks whether 'aws_cloudfront_distribution' are pointing to non-existent Amazon S3 origins. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-s3-origin-non-existent-bucket.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-s3-origin-non-existent-bucket.sentinel))

- This policy requires resources of type `aws_cloudtrail` to have cloudwatch log group arn set. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-cloudwatch-logs-group-arn-present.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel))

- This policy checks if load_balancer resources have the ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-valid-desync-mitigation-mode-classic-load-balancer.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel))

- This policy requires resources of type `aws_db_instance` have attribute "auto_minor_version_upgrade" set to true. ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-automatic-minor-version-upgrades-enabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-automatic-minor-version-upgrades-enabled.sentinel))

- This policy verifies if the attributes of the 'aws_s3_account_public_access_block' ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-block-public-access-account-level.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-block-public-access-account-level.sentinel))

- This policy checks if resources of type 'aws_launch_template' have the attribute ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-launch-template-public-ip-disabled.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-launch-template-public-ip-disabled.sentinel))

-  AWS Security Group should not allow ingress traffic from 0.0.0.0/0 to port 22 and 3389 ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-security-group-ipv4-ingress-traffic-restriction.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-protocol.sentinel))

-  AWS Security Group should not allow ingress traffic from ::/0 to port 22 and 3389 ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-security-group-ipv6-ingress-traffic-restriction.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-protocol.sentinel))

- CloudTrail S3 bucket should not be publicly accessible  ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-s3-bucket-should-not-be-publicly-accessible.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-s3-bucket-should-not-be-publicly-accessible.sentinel))

- Password policies for IAM users should have strong configurations ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-password-policy-should-have-strong-configuration.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-have-strong-configuration.sentinel))

- Ensure that Object-level logging for read events is enabled for S3 buckets ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-enable-object-logging-for-read-events.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-enable-object-logging-for-events.sentinel))

- Ensure that Object-level logging for write events is enabled for S3 buckets ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/s3-enable-object-logging-for-write-events.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/s3/s3-enable-object-logging-for-events.sentinel))

- Ensure IAM password policy requires at least one number ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-password-policy-should-require-numbers.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-require-numbers.sentinel))

- Ensure IAM password policy prevents password reuse ([docs](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/docs/policies/iam-password-policy-should-prevent-password-reuse.md) | [code](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-should-prevent-password-reuse.sentinel))
