mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-https-ipv6-unrestricted-allowed/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-https-ipv6-unrestricted-allowed/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-security-group-ingress-https-ipv6-unrestricted-allowed/mock-tfstate-v2.sentinel"
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