mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-s3-bucket-logging-enabled-with-target-bucket-and-prefix/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-s3-bucket-logging-enabled-with-target-bucket-and-prefix/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-s3-bucket-logging-enabled-with-target-bucket-and-prefix/mock-tfstate-v2.sentinel"
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