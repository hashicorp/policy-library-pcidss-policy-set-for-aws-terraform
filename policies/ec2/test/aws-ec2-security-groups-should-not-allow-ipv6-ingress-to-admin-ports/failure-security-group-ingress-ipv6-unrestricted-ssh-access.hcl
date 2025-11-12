mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ipv6-unrestricted-ssh-access/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ipv6-unrestricted-ssh-access/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-security-group-ingress-ipv6-unrestricted-ssh-access/mock-tfstate-v2.sentinel"
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