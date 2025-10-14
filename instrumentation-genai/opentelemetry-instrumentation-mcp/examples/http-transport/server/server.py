#!/usr/bin/env python3
"""MCP server with HTTP transport using SSE."""

from mcp.server.fastmcp import FastMCP

mcp = FastMCP("MCP HTTP Server")


@mcp.tool()  # type: ignore[misc]
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b


@mcp.tool()  # type: ignore[misc]
def multiply(a: int, b: int) -> int:
    """Multiply two numbers"""
    return a * b


@mcp.resource("greeting://{name}")  # type: ignore[misc]
def get_greeting(name: str) -> str:
    """Get a personalized greeting"""
    return f"Hello, {name}!"


if __name__ == "__main__":
    # Run with SSE transport on port 8000
    mcp.run(transport="sse")
