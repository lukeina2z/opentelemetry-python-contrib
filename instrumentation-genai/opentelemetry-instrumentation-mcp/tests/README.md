# MCP Instrumentation Test Suite

This directory contains comprehensive unit tests for the OpenTelemetry MCP (Model Context Protocol) instrumentation.

## Test Structure

The test suite is organized into multiple files for better maintainability:

### test_basic.py
Basic smoke tests to verify the instrumentor can be imported and instantiated.

**Tests (2):**
- Import verification
- Instance creation

### test_instrumentor.py
Core instrumentor functionality tests including initialization, instrumentation/uninstrumentation, and utility methods.

**Test Classes:**
- `TestMcpInstrumentorInit` (3 tests): Initialization with various configurations
- `TestMcpInstrumentorDependencies` (1 test): Dependency declarations
- `TestMcpInstrumentorInstrument` (3 tests): Hook registration
- `TestMcpInstrumentorUninstrument` (5 tests): Hook removal
- `TestMcpInstrumentorSerialize` (8 tests): JSON serialization utility

**Total: 20 tests**

### test_session_wrapper.py
Tests for client-side session send wrapper (`_wrap_session_send`).

**Test Classes:**
- `TestWrapSessionSend` (9 tests): Message wrapping, span creation, trace context injection, error handling

**Total: 9 tests**

### test_server_wrapper.py
Tests for server-side request/notification handlers.

**Test Classes:**
- `TestWrapServerHandleRequest` (2 tests): Request wrapper
- `TestWrapServerHandleNotification` (2 tests): Notification wrapper  
- `TestWrapServerMessageHandler` (7 tests): Core message handling logic
- `TestExtractSessionId` (3 tests): Session ID extraction

**Total: 14 tests**

### test_attributes.py
Tests for semantic convention constants.

**Test Classes:**
- `TestMCPSpanAttributes` (8 tests): Span attribute constants
- `TestMCPMethodValue` (8 tests): Method value constants

**Total: 16 tests**

## Running Tests

Run all tests:
```bash
tox -e py313-test-instrumentation-mcp-latest
```

Run specific test file:
```bash
tox -e py313-test-instrumentation-mcp-latest -- tests/test_instrumentor.py
```

Run specific test:
```bash
tox -e py313-test-instrumentation-mcp-latest -- tests/test_instrumentor.py::TestMcpInstrumentorInit::test_init_default
```

## Test Coverage

The test suite covers:

✅ **Initialization**: Default and custom tracer providers/propagators  
✅ **Instrumentation**: Hook registration for all 4 MCP methods  
✅ **Uninstrumentation**: Proper cleanup of all hooks  
✅ **Client-side wrapping**: Span creation, trace context injection, error handling  
✅ **Server-side wrapping**: Trace context extraction, span linking, error handling  
✅ **Utility methods**: JSON serialization with edge cases  
✅ **Constants**: All semantic convention attributes and method values  
✅ **Edge cases**: Missing data, exceptions, various message types  

## Design Principles

1. **Isolation**: Each test is independent and doesn't rely on external dependencies
2. **Mocking**: External dependencies (mcp module, OpenTelemetry components) are properly mocked
3. **Coverage**: Tests cover happy paths, error cases, and edge conditions
4. **Clarity**: Test names clearly describe what is being tested
5. **Maintainability**: Tests are organized by functionality for easy navigation

## Total Test Count

**60 tests** across 5 test files, all passing ✅
