mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-cloudtrail-event-selectors-read-events-specific-s3-buckets-only/mock-tfplan-v2.sentinel"
	}
}


mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-cloudtrail-event-selectors-read-events-specific-s3-buckets-only/mock-tfconfig-v2.sentinel"
	}
}


mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-cloudtrail-event-selectors-read-events-specific-s3-buckets-only/mock-tfstate-v2.sentinel"
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