# ECS task sets should not automatically assign public IP addresses

| Provider            |             Category           |
| ------------------- |  ----------------------------  |
| Amazon Web Services |  Secure Network Configuration  |

## Description

This control checks whether an Amazon ECS task set is configured to automatically assign public IP addresses. The control fails if AssignPublicIP is set to ENABLED.

A public IP address is reachable from the internet. If you configure your task set with a public IP address, the resources associated with the task set can be reached from the internet. ECS task sets shouldn't be publicly accessible, as this may allow unintended access to your container application servers.

This rule is covered by the [ecs-task-set-assign-public-ip-disabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/ecs/ecs-task-set-assign-public-ip-disabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ecs-task-set-assign-public-ip-disabled.sentinel

        Description:
        This policy requires resources of type `aws_ecs_task_set` have attribute
        `assign_public_ip` should be false.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ecs-task-set-assign-public-ip-disabled.

        ✓ Found 0 resource violations

        ecs-task-set-assign-public-ip-disabled.sentinel:49:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ecs-task-set-assign-public-ip-disabled.sentinel

        Description:
        This policy requires resources of type `aws_ecs_task_set` have attribute
        `assign_public_ip` should be false.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecs-task-set-assign-public-ip-disabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_ecs_task_set.example
            | ✗ failed
            | Attribute 'assign_public_ip' must be either false for 'aws_ecs_task_set' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-16 for more details.


        ecs-task-set-assign-public-ip-disabled.sentinel:49:1 - Rule "main"
        Value:
            false
```

---
