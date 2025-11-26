# Application Load Balancer should be configured to drop http headers

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Networking   |

## PCI DSS versions that include this policy

| Version | Included |
|---------|----------|
| 3.2.1   | &cross;  |
| 4.0.1   | &check;  |

## Description

This policy evaluates AWS Application Load Balancers to ensure they are configured to drop invalid HTTP headers. 

This rule is covered by the [elb-drop-invalid-http-headers](https://github.com/hashicorp/policy-library-pcidss-policy-set-for-aws-terraform/blob/main/policies/elb/elb-drop-invalid-http-headers.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - elb-drop-invalid-http-headers.sentinel

      Description:
        This policy checks if application load balancers are configured
        to drop invalid HTTP headers

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy elb-drop-invalid-http-headers.

      ✓ Found 0 resource violations

      elb-drop-invalid-http-headers.sentinel:50:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - elb-drop-invalid-http-headers.sentinel

      Description:
        This policy checks if application load balancers are configured
        to drop invalid HTTP headers

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elb-drop-invalid-http-headers.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_lb.this
          | ✗ failed
          | Application load balancers should be configured to drop invalid HTTP headers. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/elb-controls.html#elb-4 for more details.


      elb-drop-invalid-http-headers.sentinel:50:1 - Rule "main"
        Value:
          false
```

---