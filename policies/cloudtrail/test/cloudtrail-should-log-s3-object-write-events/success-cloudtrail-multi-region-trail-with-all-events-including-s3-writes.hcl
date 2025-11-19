mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-trail-with-all-events-including-s3-writes/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-trail-with-all-events-including-s3-writes/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-cloudtrail-multi-region-trail-with-all-events-including-s3-writes/mock-tfstate-v2.sentinel"
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