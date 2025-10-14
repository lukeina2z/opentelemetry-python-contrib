#!bash


echo "Run the test..."

tox -e  py310-test-instrumentation-mcp-oldest  
tox -e  py310-test-instrumentation-mcp-latest  
tox -e  py311-test-instrumentation-mcp-oldest  
tox -e  py311-test-instrumentation-mcp-latest  
tox -e  py312-test-instrumentation-mcp-oldest  
tox -e  py312-test-instrumentation-mcp-latest  
tox -e  py313-test-instrumentation-mcp-oldest  

tox -e  py313-test-instrumentation-mcp-latest

tox -e  pypy3-test-instrumentation-mcp-oldest  
tox -e  pypy3-test-instrumentation-mcp-latest  
tox -e  lint-instrumentation-mcp

tox -e spellcheck

tox -e ruff

pushd ./instrumentation-genai/opentelemetry-instrumentation-mcp
tox -e typecheck
popd

# tox -e py312-test-instrumentation-botocore-1 --   -m debugpy --listen 5678 --wait-for-client -m pytest

# tox -e py312-test-instrumentation-botocore-1 --   -m debugpy --listen 5678 --wait-for-client -m pytest


# Unit Test Dbg
# 1. Run tox
# 2. In VSCode, change interpreter to either of
#   "./.tox/py313-test-instrumentation-mcp-latest/bin/python"
# 3. Update unit test name in launch.json. Set breakpoint and run.

## If debugger hangs, switch to global python and trigger a run. Then switch back to tox interpreter.

