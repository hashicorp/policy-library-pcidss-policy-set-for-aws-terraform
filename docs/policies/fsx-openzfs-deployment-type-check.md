# FSx for OpenZFS file systems should be configured for Multi-AZ deployment

| Provider            | Category    |
| ------------------- | ------------|
| Amazon Web Services | Resilience  |

## Description

This control checks whether an Amazon FSx for OpenZFS file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type.

Amazon FSx for OpenZFS supports several deployment types for file systems: Multi-AZ (HA), Single-AZ (HA), and Single-AZ (non-HA). The deployment types offer different levels of availability and durability. Multi-AZ (HA) file systems are composed of a high-availability (HA) pair of file servers that are spread across two Availability Zones (AZs). We recommend using the Multi-AZ (HA) deployment type for most production workloads due to the high availability and durability model that it provides.

This rule is covered by the [fsx-openzfs-deployment-type-check](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/fsx/fsx-openzfs-deployment-type-check.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - fsx-openzfs-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_openzfs_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy fsx-openzfs-deployment-type-check.

    ✓ Found 0 resource violations

    fsx-openzfs-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - fsx-openzfs-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_openzfs_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy fsx-openzfs-deployment-type-check.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_fsx_openzfs_file_system.fail
        | ✗ failed
        | FSx for OpenZFS file systems must be configured with MULTI_AZ_1 deployment for high availability. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/fsx-controls.html#fsx-3 for more details.


    fsx-openzfs-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        false
```

---
