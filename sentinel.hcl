# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

import "module" "report" {
  source = "./modules/report/report.sentinel"
}

import "module" "tfresources" {
  source = "./modules/tfresources/tfresources.sentinel"
}

import "module" "tfplan-functions" {
  source = "./modules/tfplan-functions/tfplan-functions.sentinel"
}

import "module" "tfconfig-functions" {
  source = "./modules/tfconfig-functions/tfconfig-functions.sentinel"
}

policy "ecr-image-scanning-enabled" {
  source = "./policies/ecr/ecr-image-scanning-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "eks-cluster-supported-k8s-version-check" {
  source = "./policies/eks/eks-cluster-supported-k8s-version-check.sentinel"
  enforcement_level = "advisory"
}

policy "eks-cluster-encrypted-kubernetes-secrets" {
  source = "./policies/eks/eks-cluster-encrypted-kubernetes-secrets.sentinel"
  enforcement_level = "advisory"
}

policy "eks-cluster-audit-logging-enabled" {
  source = "./policies/eks/eks-cluster-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "eks-cluster-endpoints-restrict-public-access" {
  source = "./policies/eks/eks-cluster-endpoints-restrict-public-access.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-fargate-service-platform-compatibility" {
  source = "./policies/ecs/ecs-fargate-service-platform-compatibility.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definition-no-secrets-as-environment-variables" {
  source = "./policies/ecs/ecs-task-definition-no-secrets-as-environment-variables.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-service-no-public-ip-assignment" {
  source = "./policies/ecs/ecs-service-no-public-ip-assignment.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-cluster-auto-minor-version-upgrade-enabled" {
  source = "./policies/elasticache/elasticache-redis-cluster-auto-minor-version-upgrade-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-replication-group-encryption-at-transit-enabled" {
  source = "./policies/elasticache/elasticache-redis-replication-group-encryption-at-transit-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elb-configure-https-tls-termination-classic-load-balancer" {
  source = "./policies/elb/elb-configure-https-tls-termination-classic-load-balancer.sentinel"
  enforcement_level = "advisory"
}

policy "elb-drop-invalid-http-headers" {
  source = "./policies/elb/elb-drop-invalid-http-headers.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-http-request-redirection" {
  source = "./policies/elb/elb-ensure-http-request-redirection.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-ssl-listener-predefined-security-policy" {
  source = "./policies/elb/elb-ensure-ssl-listener-predefined-security-policy.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-valid-desync-mitigation-mode-application-load-balancer" {
  source = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = {
    lb_type = "application"
  }
}

policy "elb-ensure-valid-desync-mitigation-mode-classic-load-balancer" {
  source = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = {
    lb_type = "classic"
  }
}

policy "rds-instance-should-be-private" {
  source = "./policies/rds/rds-instance-should-be-private.sentinel"
  enforcement_level = "advisory"
}

policy "rds-ensure-cloudwatch-logs-enabled" {
  source = "./policies/rds/rds-ensure-cloudwatch-logs-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-ensure-automatic-minor-version-upgrades-enabled" {
  source = "./policies/rds/rds-ensure-automatic-minor-version-upgrades-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-cluster-default-admin-check" {
  source = "./policies/rds/rds-cluster-default-admin-check.sentinel"
  enforcement_level = "advisory"
}

policy "rds-instance-default-admin-check" {
  source = "./policies/rds/rds-instance-default-admin-check.sentinel"
  enforcement_level = "advisory"
}

policy "rds-aurora-mysql-audit-logging-enabled" {
  source = "./policies/rds/rds-aurora-mysql-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-for-postgresql-db-instances-should-publish-logs-to-cloudwatch-logs" {
  source = "./policies/rds/rds-for-postgresql-db-instances-should-publish-logs-to-cloudwatch-logs.sentinel"
  enforcement_level = "advisory"
}

policy "aurora-postgresql-db-clusters-should-publish-logs-to-cloudwatch-logs" {
  source = "./policies/rds/aurora-postgresql-db-clusters-should-publish-logs-to-cloudwatch-logs.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-account-level" {
  source = "./policies/s3/s3-block-public-access-account-level.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-bucket-level" {
  source = "./policies/s3/s3-block-public-access-bucket-level.sentinel"
  enforcement_level = "advisory"
}

policy "s3-require-ssl" {
  source = "./policies/s3/s3-require-ssl.sentinel"
  enforcement_level = "advisory"
}

policy "s3-multi-region-access-points-should-have-block-public-access-settings-enabled" {
  source = "./policies/s3/s3-multi-region-access-points-should-have-block-public-access-settings-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-should-be-encrypted-at-rest" {
  source = "./policies/s3/s3-bucket-should-be-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-should-have-object-lock-enabled" {
  source = "./policies/s3/s3-bucket-should-have-object-lock-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    valid_mode = ["GOVERNANCE", "COMPLIANCE"]
  }
}

policy "s3-bucket-should-use-cross-region-replication" {
  source = "./policies/s3/s3-bucket-should-use-cross-region-replication.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-replication-group-redis-auth-enabled" {
  source = "./policies/elasticache/elasticache-redis-replication-group-redis-auth-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "docdb-cluster-backup-retention-check" {
  source = "./policies/docdb/docdb-cluster-backup-retention-check.sentinel"
  enforcement_level = "advisory"
}

policy "docdb-cluster-audit-logging-enabled" {
  source = "./policies/docdb/docdb-cluster-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dynamo-db-accelerator-clusters-encryption-in-transit-enabled" {
  source = "./policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticbeanstalk-managed-platform-updates-enabled" {
  source = "./policies/elasticbeanstalk/elasticbeanstalk-managed-platform-updates-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticbeanstalk-cloudwatch-log-streaming-enabled" {
  source = "./policies/elasticbeanstalk/elasticbeanstalk-cloudwatch-log-streaming-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "emr-block-public-access-enabled" {
  source = "./policies/emr/emr-block-public-access-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "neptune-cluster-audit-logs-publishing-enabled" {
  source = "./policies/neptune/neptune-cluster-audit-logs-publishing-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "sagemaker-notebook-no-direct-internet-access" {
  source = "./policies/sagemaker/sagemaker-notebook-no-direct-internet-access.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-public-access-check" {
  source = "./policies/redshift/redshift-cluster-public-access-check.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-should-be-encrypted-at-transit" {
  source = "./policies/redshift/redshift-cluster-should-be-encrypted-at-transit.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-audit-logging-enabled" {
  source = "./policies/redshift/redshift-cluster-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-unrestricted-port-access-check" {
  source = "./policies/redshift/redshift-cluster-unrestricted-port-access-check.sentinel"
  enforcement_level = "advisory"
}

policy "dms-replication-instances-should-not-be-public" {
  source = "./policies/dms/dms-replication-instances-should-not-be-public.sentinel"
  enforcement_level = "advisory"
}

policy "dms-auto-minor-version-upgrade-check" {
  source = "./policies/dms/dms-auto-minor-version-upgrade-check.sentinel"
  enforcement_level = "advisory"
}

policy "dms-endpoint-should-be-ssl-configured" {
  source = "./policies/dms/dms-endpoint-should-be-ssl-configured.sentinel"
  enforcement_level = "advisory"
}

policy "dms-mongo-db-authentication-enabled" {
  source = "./policies/dms/dms-mongo-db-authentication-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dms-redis-tls-enabled" {
  source = "./policies/dms/dms-redis-tls-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dms-replication-task-targetdb-logging-enabled" {
  source = "./policies/dms/dms-replication-task-logging-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    db_type = "target"
  }
}

policy "dms-replication-task-sourcedb-logging-enabled" {
  source = "./policies/dms/dms-replication-task-logging-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    db_type = "source"
  }
}

policy "mq-cloudwatch-audit-log-enabled" {
  source = "./policies/mq/mq-cloudwatch-audit-log-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "mq-auto-minor-version-upgrade-enabled" {
  source = "./policies/mq/mq-auto-minor-version-upgrade-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "msk-in-cluster-node-require-encrypted-in-transit" {
  source = "./policies/msk/msk-in-cluster-node-require-encrypted-in-transit.sentinel"
  enforcement_level = "advisory"
}

policy "api-gateway-access-logging-should-be-configured" {
  source = "./policies/api-gateway/api-gateway-access-logging-should-be-configured.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-not-use-deprecated-ssl-protocols" {
  source = "./policies/cloudfront/cloudfront-distributions-should-not-use-deprecated-ssl-protocols.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-encrypt-traffic-to-custom-origins" {
  source = "./policies/cloudfront/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-have-logging-enabled" {
  source = "./policies/cloudfront/cloudfront-distributions-should-have-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-should-have-default-root-object-configured" {
  source = "./policies/cloudfront/cloudfront-should-have-default-root-object-configured.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-should-require-encryption-in-transit" {
  source = "./policies/cloudfront/cloudfront-should-require-encryption-in-transit.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-metadata-imdsv2-required" {
  source = "./policies/ec2/ec2-metadata-imdsv2-required.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-network-acl" {
  source = "./policies/ec2/ec2-network-acl.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-client-vpn-connection-log-enabled" {
  source = "./policies/ec2/ec2-client-vpn-connection-log-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-launch-template-imdsv2-check" {
  source = "./policies/ec2/ec2-launch-template-imdsv2-check.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-vpn-connection-logging-enabled" {
  source = "./policies/ec2/ec2-vpn-connection-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-launch-template-public-ip-disabled" {
  source = "./policies/ec2/ec2-launch-template-public-ip-disabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-encrypted-at-rest" {
  source = "./policies/elasticsearch/elasticsearch-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-in-vpc-only" {
  source = "./policies/elasticsearch/elasticsearch-in-vpc-only.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-node-to-node-encryption-check" {
  source = "./policies/elasticsearch/elasticsearch-node-to-node-encryption-check.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-audit-logging-enabled" {
  source = "./policies/elasticsearch/elasticsearch-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-https-required" {
  source = "./policies/elasticsearch/elasticsearch-https-required.sentinel"
  enforcement_level = "advisory"
}

policy "guardduty-s3-protection-should-be-enabled" {
  source = "./policies/guardduty/guardduty-s3-protection-should-be-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "guardduty-eks-protection-runtime-should-be-enabled" {
  source = "./policies/guardduty/guardduty-eks-protection-runtime-should-be-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "guardduty-should-be-enabled" {
  source = "./policies/guardduty/guardduty-should-be-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "codebuild-s3-logs-should-be-encrypted" {
  source = "./policies/codebuild/codebuild-s3-logs-should-be-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-encrypted-at-rest" {
  source = "./policies/opensearch/opensearch-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-audit-logging-enabled" {
  source = "./policies/opensearch/opensearch-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-update-check" {
  source = "./policies/opensearch/opensearch-update-check.sentinel"
  enforcement_level = "advisory"
}

policy "iam-no-policies-attached-to-users" {
  source = "./policies/iam/iam-no-policies-attached-to-users.sentinel"
  enforcement_level = "advisory"
}

policy "iam-password-policy-strong-configuration" {
  source = "./policies/iam/iam-password-policy-strong-configuration.sentinel"
  enforcement_level = "advisory"
  params = {
    max_password_age_param = 90
    min_password_reuse_prevention_param = 24
    minimum_password_length_param = 14
  }
}

policy "s3-access-point-block-public-access-enabled" {
  source = "./policies/s3/s3-access-point-block-public-access-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-block-public-read-access" {
  source = "./policies/s3/s3-bucket-block-public-read-access.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-block-public-write-access" {
  source = "./policies/s3/s3-bucket-block-public-write-access.sentinel"
  enforcement_level = "advisory"
}

policy "waf-classic-logging-enabled" {
  source = "./policies/waf/waf-classic-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "wafv2-webacl-should-have-logging-enabled" {
  source = "./policies/waf/wafv2-webacl-should-have-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-ebs-snapshot-public-restorable-check-account-level" {
  source = "./policies/ec2/ec2-ebs-snapshot-public-restorable-check-account-level.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-security-group-ingress-traffic-restriction-port-22" {
  source = "./policies/ec2/ec2-security-group-ingress-traffic-restriction-port.sentinel"
  enforcement_level = "advisory"
  params = {
    port = 22
  }
}

policy "ec2-security-group-ingress-traffic-restriction-port-3389" {
  source = "./policies/ec2/ec2-security-group-ingress-traffic-restriction-port.sentinel"
  enforcement_level = "advisory"
  params = {
    port = 3389
  }
}

policy "lambda-function-public-access-prohibited" {
  source = "./policies/lambda/lambda-function-public-access-prohibited.sentinel"
  enforcement_level = "advisory"
}

policy "lambda-functions-should-be-in-a-vpc" {
  source = "./policies/lambda/lambda-functions-should-be-in-a-vpc.sentinel"
  enforcement_level = "advisory"
}

policy "step-functions-state-machine-logging-enabled" {
  source = "./policies/stepfunction/step-functions-state-machine-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "transfer-family-server-should-not-use-ftp" {
  source = "./policies/transfer/transfer-family-server-should-not-use-ftp.sentinel"
  enforcement_level = "advisory"
}

policy "lambda-functions-should-use-supported-runtimes" {
  source = "./policies/lambda/lambda-functions-should-use-supported-runtimes.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-network-acl-should-have-subnet-ids" {
  source = "./policies/ec2/ec2-network-acl-should-have-subnet-ids.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-subnet-with-auto-assign-public-ip-disabled" {
  source = "./policies/ec2/ec2-subnet-with-auto-assign-public-ip-disabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-vpc-default-security-group-no-traffic" {
  source = "./policies/ec2/ec2-vpc-default-security-group-no-traffic.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-vpc-flow-logging-enabled" {
  source = "./policies/ec2/ec2-vpc-flow-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-in-vpc-only" {
  source = "./policies/opensearch/opensearch-in-vpc-only.sentinel"
  enforcement_level = "advisory"
}

policy "iam-no-admin-privileges-allowed-by-policies" {
  source = "./policies/iam/iam-no-admin-privileges-allowed-by-policies.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-s3-origin-non-existent-bucket" {
  source = "./policies/cloudfront/cloudfront-s3-origin-non-existent-bucket.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-associated-with-waf" {
  source = "./policies/cloudfront/cloudfront-associated-with-waf.sentinel"
  enforcement_level = "advisory"
}

policy "dms-endpoints-should-use-ssl" {
  source = "./policies/dms/dms-endpoints-should-use-ssl.sentinel"
  enforcement_level = "advisory"
}

policy "eventbridge-custom-event-bus-should-have-attached-policy" {
  source = "./policies/eventbridge/eventbridge-custom-event-bus-should-have-attached-policy.sentinel"
  enforcement_level = "advisory"
}

policy "secretsmanager-auto-rotation-enabled-check" {
  source = "./policies/secretsmanager/secretsmanager-auto-rotation-enabled-check.sentinel"
  enforcement_level = "advisory"
}

policy "acm-rsa-certificate-key-length-atleast-2048" {
  source = "./policies/acm/acm-rsa-certificate-key-length-atleast-2048.sentinel"
  enforcement_level = "advisory"
}

policy "autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck" {
  source = "./policies/autoscaling-group/autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel"
  enforcement_level = "advisory"
}

policy "autoscaling-launch-config-public-ip-disabled" {
  source = "./policies/autoscaling-group/autoscaling-launch-config-public-ip-disabled.sentinel"
  enforcement_level = "advisory"
}

policy "inspector-ec2-scan-enabled" {
  source = "./policies/inspector/inspector-ec2-scan-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "inspector-ecr-scan-enabled" {
  source = "./policies/inspector/inspector-ecr-scan-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "inspector-lambda-code-scan-enabled" {
  source = "./policies/inspector/inspector-lambda-code-scan-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "inspector-lambda-standard-scan-enabled" {
  source = "./policies/inspector/inspector-lambda-standard-scan-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "msk-connect-connector-encrypted" {
  source = "./policies/msk/msk-connect-connector-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "efs-access-point-should-enforce-user-identity" {
  source = "./policies/efs/efs-access-point-should-enforce-user-identity.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-set-assign-public-ip-disabled" {
  source = "./policies/ecs/ecs-task-set-assign-public-ip-disabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-log-file-validation-enabled" {
  source = "./policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-server-side-encryption-enabled" {
  source = "./policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./policies/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "advisory"
}

policy "appsync-field-level-logging-should-be-enabled" {
  source = "./policies/appsync/appsync-field-level-logging-should-be-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
  }
}

policy "route-53-public-hosted-zones-should-log-dns-queries" {
  source = "./policies/route53/route-53-public-hosted-zones-should-log-dns-queries.sentinel"
  enforcement_level = "advisory"
}

policy "iam-password-policy-should-require-numbers" {
  source = "./policies/iam/iam-password-policy-should-require-numbers.sentinel"
  enforcement_level = "advisory"
}