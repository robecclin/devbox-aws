.PHONY: check upgrade

check:
	uv run yamllint .
	uv run cfn-lint -c I -- devbox.yaml

upgrade:
	uv sync --upgrade
