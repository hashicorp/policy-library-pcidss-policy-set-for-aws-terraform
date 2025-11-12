mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-cloudwatch-log-metric-filter-root-user-detection-transformation-value-missing-or-zero/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-cloudwatch-log-metric-filter-root-user-detection-transformation-value-missing-or-zero/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-cloudwatch-log-metric-filter-root-user-detection-transformation-value-missing-or-zero/mock-tfstate-v2.sentinel"
	}
}


mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
	module {
		source = "../../../../modules/mocks/report/report.sentinel"
	}
}

test {
	rules = {
		main = false
	}
}