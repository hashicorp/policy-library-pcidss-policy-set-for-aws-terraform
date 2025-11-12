mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-ipv6-open-to-world-port-80-non-admin-port/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-ipv6-open-to-world-port-80-non-admin-port/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-ipv6-open-to-world-port-80-non-admin-port/mock-tfstate-v2.sentinel"
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