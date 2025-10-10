# MSK Connect connectors should be encrypted in transit

| Provider            | Category         |
| ------------------- | ---------------- |
| Amazon Web Services | Data Protection  |

## Description

This control checks whether an Amazon MSK Connect connector is encrypted in transit. This control fails if the connector isn't encrypted in transit.

Data in transit refers to data that moves from one location to another, such as between nodes in your cluster or between your cluster and your application. Data may move across the internet or within a private network. Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic.

This rule is covered by the [msk-connect-connector-encrypted](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/msk/msk-connect-connector-encrypted.sentinel) policy.
git 
## Policy Results (Pass)
```bash
trace:
    Pass - msk-connect-connector-encrypted.sentinel

    Description:
    This policy requires resources of type `aws_mskconnect_connector` to have
    encryption in transit enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy msk-connect-connector-encrypted.

    ✓ Found 0 resource violations

    msk-connect-connector-encrypted.sentinel:46:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - msk-connect-connector-encrypted.sentinel

    Description:
    This policy requires resources of type `aws_mskconnect_connector` to have
    encryption in transit enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy msk-connect-connector-encrypted.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_mskconnect_connector.example
        | ✗ failed
        | MSK Connect connectors should be encrypted in transit. Ensure 'kafka_cluster_encryption_in_transit' is configured with 'encryption_type' set to 'TLS'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/msk-controls.html#msk-3 for more details.


    msk-connect-connector-encrypted.sentinel:46:1 - Rule "main"
    Value:
        false
```

---