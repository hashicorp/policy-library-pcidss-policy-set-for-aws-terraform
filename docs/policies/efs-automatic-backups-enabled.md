# EFS file systems should have automatic backups enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Recover      |

## Description

DISCLAIMER - This policy works when all resources of type aws_efs_file_system and aws_efs_backup_policy are present in the root module.

This control checks whether an Amazon EFS file system has automatic backups enabled. This control fails if the EFS file system doesn't have automatic backups enabled.

A data backup is a copy of your system, configuration, or application data that's stored separately from the original. Enabling regular backups helps you safeguard valuable data against unforeseen events like system failures, cyberattacks, or accidental deletions. Having a robust backup strategy also facilitates quicker recovery, business continuity, and peace of mind in the face of potential data loss.

This rule is covered by the [efs-automatic-backups-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-automatic-backups-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - efs-automatic-backups-enabled.sentinel

    Description:
    This policy requires EFS file systems to have automatic backups enabled

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy efs-automatic-backups-enabled.

    ✓ Found 0 resource violations

    efs-automatic-backups-enabled.sentinel:90:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - efs-automatic-backups-enabled.sentinel

    Description:
    This policy requires EFS file systems to have automatic backups enabled

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-automatic-backups-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_efs_file_system.first
        | ✗ failed
        | EFS file systems should have automatic backups enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-7 for more details.


    efs-automatic-backups-enabled.sentinel:90:1 - Rule "main"
    Value:
        false
```

---