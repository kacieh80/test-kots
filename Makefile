channel := Unstable
app_slug := "${REPLICATED_APP}"
version := "0.1.0-dev-${USER}"
release_notes := "CLI release by ${USER} on $(shell date)"
SHELL := /bin/bash -o pipefail

.PHONY: deps-vendor-cli
deps-vendor-cli: dist = $(shell echo `uname` | tr '[:upper:]' '[:lower:]')
deps-vendor-cli: cli_version = ""
deps-vendor-cli: cli_version = $(shell [[ -x deps/replicated ]] && deps/replicated version | grep version | head -n1 | cut -d: -f2 | tr -d , )

deps-vendor-cli:
	@if [[ -n "$(cli_version)" ]]; then \
	  echo "CLI version $(cli_version) already downloaded, to download a newer version, run 'make upgrade-cli'"; \
	  exit 0; \
	else \
	  echo '-> Downloading Replicated CLI to ./deps '; \
	  mkdir -p deps/; \
	  curl -s https://api.github.com/repos/replicatedhq/replicated/releases/latest \
	  | grep "browser_download_url.*$(dist)_amd64.tar.gz" \
	  | cut -d : -f 2,3 \
	  | tr -d \" \
	  | wget -O- -qi - \
	  | tar xvz -C deps; \
	fi

.PHONY: upgrade-cli
upgrade-cli:
	rm -rf deps
	@$(MAKE) deps-vendor-cli


.PHONY: lint
lint: check-api-token check-app deps-vendor-cli
	deps/replicated release lint --app $(app_slug) --yaml-dir manifests

.PHONY: check-api-token
check-api-token:
	@if [ -z "${REPLICATED_API_TOKEN}" ]; then echo "Missing REPLICATED_API_TOKEN"; exit 1; fi

.PHONY: check-app
check-app:
	@if [ -z "$(app_slug)" ]; then echo "Missing REPLICATED_APP"; exit 1; fi

.PHONY: list-releases
list-releases: check-api-token check-app deps-vendor-cli
	deps/replicated release ls --app $(app_slug)

.PHONY: release
release: check-api-token check-app deps-vendor-cli lint
	deps/replicated release create \
		--app $(app_slug) \
		--yaml-dir manifests \
		--promote $(channel) \
		--version $(version) \
		--release-notes $(release_notes) \
		--ensure-channel


# Use the current branch name for the channel name,
# and use the git SHA for the release version,
# adding a "-dirty" suffix to the version label if there are uncomitted changes
gitsha-release:
	@$(MAKE) release \
		channel=refs/heads/$(shell git rev-parse --abbrev-ref HEAD) \
		version=$(shell git rev-parse HEAD | head -c7)$(shell git diff --no-ext-diff --quiet --exit-code || echo -n "-dirty")





