mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-iam-password-policy-uppercase-not-required/mock-tfplan-v2.sentinel"
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