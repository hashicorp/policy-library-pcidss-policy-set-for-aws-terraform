mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ssh-port-range-unrestricted-ipv4/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ssh-port-range-unrestricted-ipv4/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ssh-port-range-unrestricted-ipv4/mock-tfstate-v2.sentinel"
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