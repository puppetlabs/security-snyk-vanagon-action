# security-snyk-vanagon-action

This action runs snyk on generated gemfiles for vanagon builds. 

### What this will identify
This tool will use the output of `vanagon inspect` in order to identify any gems pulled in from `rubygems.org`. It builds a pseudo Gemfile for each project and platform in the `configs` directory of a vanagon repository. It then creates a Gemfile.lock from the pseudo Gemfile and scans it with snyk.

## Inputs
### twinGateKey (not required)
Uses the TwinGate VPN to replace reverse proxy connections.

### snykToken (required)
This input is the secret snyk token

### snykOrg (required)
The organization in snyk to send results to

### branch
Branch name to prepend to the snyk project name. If branch is set to `""` then the name in snyk would be in the form `<project>_<platform>`. If branch is not empty it will be in the form `<branch>_<project>_<platform>`. Branch can be automatically set using `{{ github.ref_name }}`. Branch is limited to < 10 alphanumeric characters plus dash.

### noMonitor (not required)
If you just want to run `snyk test` and not `snyk monitor` you should set this input to `true`

### skipProjects
A comma separated list of projects to skip

### skipPlatforms
A comma separated list of platforms to skip

### sshKey
A SSH key to install on the docker container in `/root/.ssh/<sshKeyName>`. It **must** be base64 encoded

### sshKeyName
The name of the SSH key

## Outputs
### vulns
An array of vulnerable packages

## Example usage
please see `sample_workflow.yaml` for a sample
