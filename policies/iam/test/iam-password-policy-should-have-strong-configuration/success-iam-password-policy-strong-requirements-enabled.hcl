mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-iam-password-policy-strong-requirements-enabled/mock-tfplan-v2.sentinel"
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
		main = true
	}
}