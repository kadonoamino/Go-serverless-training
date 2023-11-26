# Use the official Go image as the base image
FROM golang:latest

# Set environment variables for Go cross-compilation
ENV GOOS linux
ENV GOARCH amd64
ENV CGO_ENABLED 0

# Set the working directory inside the container
WORKDIR /app

# Install Go language server (gopls) 
RUN go install -v golang.org/x/tools/gopls@latest
# For debugging
RUN apt-get update && apt-get install -y gcc libc-dev
RUN go install github.com/go-delve/delve/cmd/dlv@latest
# Air Hot-Reload library (Not necessary)
RUN go install github.com/cosmtrek/air@latest
# Install the AWS CLI to make it easier to interact with AWS services
RUN apt-get update && apt-get install -y awscli

# Expose any ports your application will use (e.g., 8080)
EXPOSE 8000
