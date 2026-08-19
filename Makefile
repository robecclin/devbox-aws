.PHONY: check install upgrade

check:
	uv run yamllint .
	uv run cfn-lint -c I -- devbox.yaml

install:
	uv sync --locked

upgrade:
	uv sync --upgrade
