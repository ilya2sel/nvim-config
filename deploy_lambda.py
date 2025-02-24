#!/usr/bin/env python3
import subprocess
import os
import sys

def run_command(cmd, cwd=None):
    """Run a shell command and exit if it fails."""
    print(f"Running command: {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if result.returncode != 0:
        print(f"Error running command: {' '.join(cmd)}")
        print("stdout:", result.stdout)
        print("stderr:", result.stderr)
        sys.exit(result.returncode)
    else:
        print(result.stdout)

def main():
    # Ensure the lambda_package directory exists; if not, create it.
    if not os.path.isdir("lambda_package"):
        os.mkdir("lambda_package")

    # Copy the ./app/ directory into lambda_package/
    run_command(["cp", "-r", "./app/", "lambda_package/"])

    # Change to the lambda_package directory
    package_dir = "lambda_package"

    # Remove existing deployment.zip in the parent directory
    run_command(["rm", "-rf", "../deployment.zip"], cwd=package_dir)

    # Zip all files and the .env file from lambda_package into ../deployment.zip
    run_command(["zip", "-r", "../deployment.zip", ".", ".env"], cwd=package_dir)

    # Return to project root for subsequent commands
    root_dir = os.getcwd()

    # Delete the existing Lambda function (if it exists)
    run_command(["awslocal", "lambda", "delete-function", "--function-name", "ore_service_lambda"], cwd=root_dir)

    # Create the new Lambda function with the deployment package
    run_command([
        "awslocal", "lambda", "create-function",
        "--function-name", "ore_service_lambda",
        "--runtime", "python3.10",
        "--handler", "app.app.lambda_handler",
        "--zip-file", "fileb://deployment.zip",
        "--role", "arn:aws:iam::000000000000:role/lambda-role",
        "--timeout", "15"
    ], cwd=root_dir)

    print("Deployment complete.")

if __name__ == "__main__":
    main()
