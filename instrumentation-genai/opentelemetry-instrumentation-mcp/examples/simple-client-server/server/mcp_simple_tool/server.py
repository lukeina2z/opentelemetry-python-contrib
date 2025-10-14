import requests
import boto3
from mcp.server.fastmcp import FastMCP


def call_http(url: str) -> str:
    try:
        response = requests.get(url, timeout=5)
        return f"HTTP call succeeded. Status: {response.status_code}, Body length: {len(response.content)} bytes"
    except requests.RequestException as exc:
        return f"HTTP call failed: {str(exc)}"


def call_s3() -> str:
    try:
        s3_client = boto3.client("s3")
        response = s3_client.list_buckets()
        buckets = ", ".join([bucket["Name"] for bucket in response.get("Buckets", [])])
        if not buckets:
            buckets = "No buckets found"
        return f"S3 call succeeded. Buckets: {buckets}"
    except Exception as exc:
        return f"S3 call failed: {str(exc)}"


mcp = FastMCP("PythonMcpDemoFoo")


@mcp.tool()  # type: ignore[misc]
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b


@mcp.tool()  # type: ignore[misc]
def subtract(a: int, b: int) -> int:
    """Subtract two numbers"""
    return a - b


@mcp.tool()  # type: ignore[misc]
def pingweb(url: str) -> str:
    """Make an HTTP GET request to the specified URL"""
    return call_http(url)


@mcp.tool()  # type: ignore[misc]
def awssdkcall() -> str:
    """Make an AWS S3 API call to list buckets"""
    return call_s3()


# Add a dynamic greeting resource
@mcp.resource("greeting://{name}")  # type: ignore[misc]
def get_greeting(name: str) -> str:
    """Get a personalized greeting"""
    return f"Hello, {name}!"


def main():
    mcp.run()


if __name__ == "__main__":
    main()
