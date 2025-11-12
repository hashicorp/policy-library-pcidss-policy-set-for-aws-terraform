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

policy "aws-iam-password-policy-should-require-lowercase-letters" {
  source = "./policies/aws-iam-password-policy-should-require-lowercase-letters"
enforcement_level = "advisory"
}

policy "aws-iam-password-policy-should-require-numbers" {
  source = "./policies/aws-iam-password-policy-should-require-numbers"
enforcement_level = "advisory"
}

policy "aws-iam-password-policy-should-require-uppercase-letters" {
  source = "./policies/aws-iam-password-policy-should-require-uppercase-letters"
enforcement_level = "advisory"
}

policy "aws-iam-password-policy-should-expire-within-90-days" {
  source = "./policies/aws-iam-password-policy-should-expire-within-90-days"
enforcement_level = "advisory"
}

policy "aws-iam-password-policy-should-prevent-password-reuse" {
  source = "./policies/aws-iam-password-policy-should-prevent-password-reuse"
enforcement_level = "advisory"
}

policy "aws-cloudtrail-at-least-one-trail-should-be-enabled" {
  source = "./policies/aws-cloudtrail-at-least-one-trail-should-be-enabled"
enforcement_level = "advisory"
}

policy "aws-iam-support-role-should-be-created-for-incident-management" {
  source = "./policies/aws-iam-support-role-should-be-created-for-incident-management"
enforcement_level = "advisory"
}

policy "aws-iam-password-policy-should-have-strong-configuration" {
  source = "./policies/aws-iam-password-policy-should-have-strong-configuration"
enforcement_level = "advisory"
}

policy "aws-cloudtrail-s3-bucket-should-have-access-logging-enabled" {
  source = "./policies/aws-cloudtrail-s3-bucket-should-have-access-logging-enabled"
enforcement_level = "advisory"
}

policy "aws-security-groups-should-not-allow-unrestricted-ssh-access" {
  source = "./policies/aws-security-groups-should-not-allow-unrestricted-ssh-access"
enforcement_level = "advisory"
}

policy "aws-cloudtrail-should-log-s3-object-read-events" {
  source = "./policies/aws-cloudtrail-should-log-s3-object-read-events"
enforcement_level = "advisory"
}

policy "aws-ec2-security-groups-should-not-allow-ipv6-ingress-to-admin-ports" {
  source = "./policies/aws-ec2-security-groups-should-not-allow-ipv6-ingress-to-admin-ports"
enforcement_level = "advisory"
}

policy "aws-cloudtrail-should-log-s3-object-write-events" {
  source = "./policies/aws-cloudtrail-should-log-s3-object-write-events"
enforcement_level = "advisory"
}

policy "aws-s3-cloudtrail-bucket-should-not-be-publicly-accessible" {
  source = "./policies/aws-s3-cloudtrail-bucket-should-not-be-publicly-accessible"
enforcement_level = "advisory"
}

policy "aws-cloudwatch-log-metric-filter-and-alarm-should-exist-for-root-user-usage" {
  source = "./policies/aws-cloudwatch-log-metric-filter-and-alarm-should-exist-for-root-user-usage"
enforcement_level = "advisory"
}

policy "aws-ec2-security-groups-should-not-allow-unrestricted-admin-port-access" {
  source = "./policies/aws-ec2-security-groups-should-not-allow-unrestricted-admin-port-access"
enforcement_level = "advisory"
}

policy "aws-security-groups-should-not-allow-unrestricted-rdp-access" {
  source = "./policies/aws-security-groups-should-not-allow-unrestricted-rdp-access"
enforcement_level = "advisory"
}