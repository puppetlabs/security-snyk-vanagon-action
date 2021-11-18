# security-snyk-vanagon-action

This action runs snyk on generated gemfiles for vanagon builds. 

### What this will identify
This tool will use the output of `vanagon inspect` in order to identify any gems pulled in from `rubygems.org`. It builds a pseudo Gemfile for each project and platform in the `configs` directory of a vanagon repository. It then creates a Gemfile.lock from the pseudo Gemfile and scans it with snyk.

## Inputs

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

### urlsToReplace
This is a comma separated list of URLs to replace with the value of `newHost`. This is in the format `<domain>,<format>`. Domains will *always* be replaced with `https://`

For example if `newHost` is `a.baz.com` and `urlsToReplace` is:

```
foo.example.com,%s/foo,bar.another.net,%s/
```

Then the output would be:

```
foo.example.com -> a.baz.com/foo
bar.another.net -> a.baz.com/
```

### newHost
This is the new host to use to replace URLs from `urlsToReplace` with

### rproxyKey
If `newHost` is `localhost` then this key will be added as a basic authentication header via nginx rewrite

### rproxyUser
If `newHost` is `localhost` then this user will be added as a basic authentication header via nginx rewrite

### sshKey
A SSH key to install on the docker container in `/root/.ssh/<sshKeyName>`. It **must** be base64 encoded

### sshKeyName
The name of the SSH key

## Outputs
### vulns
An array of vulnerable packages

## Example usage
please see `sample_workflow.yaml` for a sample
