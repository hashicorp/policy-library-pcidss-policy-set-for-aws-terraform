mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-security-group-ssh-port-22-restricted-to-specific-ips/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-security-group-ssh-port-22-restricted-to-specific-ips/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-security-group-ssh-port-22-restricted-to-specific-ips/mock-tfstate-v2.sentinel"
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