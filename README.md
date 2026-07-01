# Devbox

Provision a disposable cloud development workstation on AWS.

## Usage

1. Create the `token.actions.githubusercontent.com` OIDC provider in IAM
2. Store the bootstrap credentials in SSM:
    - `/devbox/github-auth-token`
    - `/devbox/tailscale-auth-key`
3. Create the stack using CloudFormation

### Start/Stop

GitHub Actions can start and stop the EC2 instance using the CloudFormation-managed OIDC role.

Configure these GitHub repository variables:

- `DEVBOX_AWS_REGION`: the stack region
- `DEVBOX_AWS_ROLE_ARN`: the `GitHubActionsRoleArn` CloudFormation output
- `DEVBOX_INSTANCE_ID`: the `InstanceId` CloudFormation output

Run the `Start Devbox` or `Stop Devbox` workflow manually; `Stop Devbox` also runs daily at `04:00` UTC.

## Development

```sh
make check      # yamllint, cfn-lint
make deploy     # update cloudformation stack
make latest-ami # latest ami id
make upgrade    # uv sync --upgrade
```
