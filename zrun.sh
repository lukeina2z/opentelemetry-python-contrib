#!bash


echo "Run the test..."

tox -e py312-test-instrumentation-botocore-0

tox -e py312-test-instrumentation-botocore-1

tox -e spellcheck

tox -e lint-instrumentation-botocore

tox -e ruff

# tox -e py312-test-instrumentation-botocore-1 --   -m debugpy --listen 5678 --wait-for-client -m pytest

# tox -e py312-test-instrumentation-botocore-1 --   -m debugpy --listen 5678 --wait-for-client -m pytest


# Unit Test Dbg
# 1. Run tox
# 2. In VSCode, change interpreter to either of
#   "./.tox/py312-test-instrumentation-botocore-0/bin/python"
#   "./.tox/py312-test-instrumentation-botocore-1/bin/python"
# 3. Update unit test name in launch.json. Set breakpoint and run.

## If debugger hangs, switch to global python and trigger a run. Then switch back to tox interpreter.

