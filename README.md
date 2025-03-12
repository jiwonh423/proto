# Proto Repository Setup Guide

This guide explains how to set up a Protocol Buffers repository for managing service contracts in a microservices architecture.

## Prerequisites

- Go 1.16+ installed
- Protocol Buffers compiler (protoc) installed

## Initial Setup

### 1. Create Project Structure

You can create your project either inside or outside GOPATH when using Go modules.

```sh
# Create project directory (can be inside or outside GOPATH with GO111MODULE=on)
mkdir -p ~/projects/proto
cd ~/projects/proto

# Create service directories
mkdir -p services/user/v1
```

### 2. Initialize Go Module

```sh
# Initialize a new Go module
go mod init github.com/jiwonh423/proto

# Ensure module mode is enabled
export GO111MODULE=on
```

### 3. Install Dependencies

```sh
# Install required Go packages
go get google.golang.org/grpc
go get google.golang.org/protobuf

# Install protoc plugins for Go
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Update dependencies
go mod tidy
```

### 4. Configure PATH

Add GOPATH/bin to your PATH to ensure the protoc plugins can be found:

```sh
# Temporarily add to PATH for current session
export PATH="$PATH:$(go env GOPATH)/bin"

# Check if it works
which protoc-gen-go
which protoc-gen-go-grpc
```

To permanently add GOPATH/bin to your PATH:

```sh
# For Zsh users
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >> ~/.zshrc
source ~/.zshrc

# For Bash users
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >> ~/.bash_profile
source ~/.bash_profile
```

## Creating Proto Files

### 1. Create Sample Proto File

Create a file at `services/user/v1/user.proto`:

### 2. Create Makefile

Create a `Makefile` in the project root:

## Code Generation

Generate Go code from proto files:

```sh
make gen
```

This will create `.pb.go` and `_grpc.pb.go` files next to your proto files.
