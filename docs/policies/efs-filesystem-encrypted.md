# EFS file systems should be encrypted at rest

| Provider            | Category        |
|---------------------|-----------------|
| Amazon Web Services | Data Protection |

## Description

This control checks whether an Amazon EFS file system encrypts data with AWS Key Management Service (AWS KMS). The control fails if a file system isn't encrypted.

Data at rest refers to data that's stored in persistent, non-volatile storage for any duration. Encrypting data at rest helps you protect its confidentiality, which reduces the risk that an unauthorized user can access it.

This rule is covered by the [efs-filesystem-encrypted](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-filesystem-encrypted.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - efs-filesystem-encrypted.sentinel

      Description:
        This policy requires resources of type `aws_efs_file_system` have attribute
        "encrypted" set to true.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy efs-filesystem-encrypted.

      ✓ Found 0 resource violations

      efs-filesystem-encrypted.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - efs-filesystem-encrypted.sentinel

      Description:
        This policy requires resources of type `aws_efs_file_system` have attribute
        "encrypted" set to true.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-filesystem-encrypted.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_efs_file_system.example
          | ✗ failed
          | Attribute 'encrypted' must be set to true for 'aws_efs_file_system' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-8 for more details.


      efs-filesystem-encrypted.sentinel:47:1 - Rule "main"
        Value:
          false
```

---