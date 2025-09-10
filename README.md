# Observability components into Microsoft Azure

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/11158/badge)](https://www.bestpractices.dev/en/projects/11158)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/nlamirault/terraform-azurerm-observability/badge)](https://securityscorecards.dev/viewer/?uri=github.com/nlamirault/terraform-azurerm-observability)
[![SLSA 3](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev)

This module consists of the following submodules:

- [Prometheus](https://github.com/nlamirault/terraform-azure-observability/tree/master/modules/prometheus)
- [Thanos](https://github.com/nlamirault/terraform-azure-observability/tree/master/modules/thanos)
- [Loki](https://github.com/nlamirault/terraform-azure-observability/tree/master/modules/loki)
- [Tempo](https://github.com/nlamirault/terraform-azure-observability/tree/master/modules/tempo)

See more details in each module's README.

## SLSA

All _artifacts_ provided by this repository meet [SLSA L3](https://slsa.dev/spec/v1.0/levels#build-l3)

### Verify SLSA provenance using the Github CLI

```shell
$ gh attestation verify oci://ghcr.io/nlamirault/modules/terraform-azurerm-observability:v3.0.0 --repo nlamirault/terraform-azurerm-observability
Loaded digest sha256:490d19a89443991519a7d892f9ae295c99cd6f4370bbf5053129394763f9d797 for oci://ghcr.io/nlamirault/modules/terraform-azurerm-observability:v3.0.0
Loaded 1 attestation from GitHub API
✓ Verification succeeded!

sha256:490d19a89443991519a7d892f9ae295c99cd6f4370bbf5053129394763f9d797 was attested by:
REPO                                        PREDICATE_TYPE                  WORKFLOW
nlamirault/terraform-azurerm-observability  https://slsa.dev/provenance/v1  .github/workflows/terraform-oci.yaml@refs/tags/v3.0.0
```

### Verify SLSA provenance using Cosign

```shell
$ cosign verify-attestation \
  --type slsaprovenance \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp '^https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v[0-9]+.[0-9]+.[0-9]+$' \
  ghcr.io/nlamirault/modules/terraform-azurerm-observability:v3.0.0@sha256:490d19a89443991519a7d892f9ae295c99cd6f4370bbf5053129394763f9d797

Verification for ghcr.io/nlamirault/modules/terraform-azurerm-observability:v3.0.0@sha256:490d19a89443991519a7d892f9ae295c99cd6f4370bbf5053129394763f9d797 --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The code-signing certificate was verified using trusted certificate authority certificates
Certificate subject: https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v2.1.0
Certificate issuer URL: https://token.actions.githubusercontent.com
GitHub Workflow Trigger: push
GitHub Workflow SHA: d82e841b8c05ae63e142c6c2fa6826192bb5bc6a
GitHub Workflow Name: Terraform / OCI
GitHub Workflow Repository: nlamirault/terraform-azurerm-observability
GitHub Workflow Ref: refs/tags/v3.0.0
...
```

## OCI

You could discover all the referrers of manifest with annotations, displayed in a tree view:

```shell
$ oras discover --format tree ghcr.io/nlamirault/modules/terraform-azurerm-observability:v3.0.0
ghcr.io/nlamirault/modules/terraform-azurerm-observability@sha256:490d19a89443991519a7d892f9ae295c99cd6f4370bbf5053129394763f9d797
└── application/vnd.dev.sigstore.bundle.v0.3+json
    └── sha256:3934c4486bb698f1fce7291a9936baaaafb800607b92b299e6657a6f6f37404e
```

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
