# FSx for NetApp ONTAP file systems should be configured for Multi-AZ deployment

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |          Resilience         |

## Description

This control checks whether an Amazon FSx for NetApp ONTAP file system is configured to use a multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use a Multi-AZ deployment type. You can optionally specify a list of deployment types to include in the evaluation.

Amazon FSx for NetApp ONTAP supports several deployment types for file systems: Single-AZ 1, Single-AZ 2, Multi-AZ 1, and Multi-AZ 2. The deployment types offer different levels of availability and durability. We recommend using a Multi-AZ deployment type for most production workloads due to the high availability and durability model that Multi-AZ deployment types provide. Multi-AZ file systems support all the availability and durability features of Single-AZ file systems. In addition, they're designed to provide continuous availability to data even when an Availability Zone (AZ) is unavailable.

This rule is covered by the [fsx-ontap-deployment-type-check](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/fsx/fsx-ontap-deployment-type-check.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - fsx-ontap-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_ontap_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy fsx-ontap-deployment-type-check.

    ✓ Found 0 resource violations

    fsx-ontap-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - fsx-ontap-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_ontap_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy fsx-ontap-deployment-type-check.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_fsx_ontap_file_system.testmultiazgen2
        | ✗ failed
        | FSx for NetApp ONTAP file systems must be configured with MULTI_AZ_1 deployment for high availability. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/fsx-controls.html#fsx-4 for more details.


    fsx-ontap-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        false
```

---
