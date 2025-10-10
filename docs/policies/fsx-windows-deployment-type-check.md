# FSx for Windows File Server file systems should be configured for Multi-AZ deployment

| Provider            | Category   |
| ------------------- | ---------- |
| Amazon Web Services | Resilience |

## Description

This control checks whether an Amazon FSx for Windows File Server file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type.

Amazon FSx for Windows File Server supports two deployment types for file systems: Single-AZ and Multi-AZ. The deployment types offer different levels of availability and durability. Single-AZ file systems are composed of a single Windows file server instance and a set of storage volumes within a single Availability Zone (AZ). Multi-AZ file systems are composed of a high-availability cluster of Windows file servers spread across two Availability Zones. We recommend using the Multi-AZ deployment type for most production workloads due to the high availability and durability model that it provides.

This rule is covered by the [fsx-windows-deployment-type-check](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/fsx/fsx-windows-deployment-type-check.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - fsx-windows-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_windows_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy fsx-windows-multi-az-required.

    ✓ Found 0 resource violations

    fsx-windows-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - fsx-windows-deployment-type-check.sentinel

    Description:
    This policy requires aws_fsx_windows_file_system resources to use MULTI_AZ_1
    deployment type.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy fsx-windows-multi-az-required.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_fsx_windows_file_system.pass
        | ✗ failed
        | FSx for Windows File Server file systems must be configured with MULTI_AZ_1 deployment for high availability. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/fsx-controls.html#fsx-5 for more details.


    fsx-windows-deployment-type-check.sentinel:54:1 - Rule "main"
    Value:
        false
```

---
