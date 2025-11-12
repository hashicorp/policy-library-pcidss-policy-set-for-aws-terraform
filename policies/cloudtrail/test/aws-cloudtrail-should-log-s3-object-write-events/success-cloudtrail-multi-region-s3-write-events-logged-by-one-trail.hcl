mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-s3-write-events-logged-by-one-trail/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-s3-write-events-logged-by-one-trail/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-s3-write-events-logged-by-one-trail/mock-tfstate-v2.sentinel"
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