.PHONY: help venv

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z%A-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

venv: ## set up a simple python virtual environment and install additional pre-commit hooks
	python3 -m venv .venv \
	&& source .venv/bin/activate \
	&& python3 -m pip install --upgrade pip \
	&& python3 -m pip install -r requirements.txt \
	&& python3 -m pip install -r requirements-dev.txt \
	&& python3 -m pip install -e . \
	&& pre-commit install --hook-type pre-push --hook-type post-checkout --hook-type pre-commit
