
tox -e py312-test-instrumentation-botocore-0

tox -e py312-test-instrumentation-botocore-1

tox -e spellcheck

tox -e lint-instrumentation-botocore

tox -e ruff
