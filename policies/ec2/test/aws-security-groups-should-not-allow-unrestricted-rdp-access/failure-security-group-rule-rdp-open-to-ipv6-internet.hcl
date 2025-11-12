mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-security-group-rule-rdp-open-to-ipv6-internet/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-security-group-rule-rdp-open-to-ipv6-internet/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-security-group-rule-rdp-open-to-ipv6-internet/mock-tfstate-v2.sentinel"
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