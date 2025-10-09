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

policy "autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck" {
  source = "./policies/autoscaling-group/autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel"
  enforcement_level = "advisory"
}
