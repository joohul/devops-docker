#!/bin/bash

GITHUB_REPO="$1"
DOCKER_REPO="$2"

echo "GITHUB_REPO: $GITHUB_REPO"
echo "DOCKER_REPO: $DOCKER_REPO"

GITHUB_REPO_URL="https://github.com/$GITHUB_REPO.git"

# Required environment variables for non-interactive login
# export DOCKER_USERNAME=your_username
# export DOCKER_PASSWORD=your_password_or_token

if [ -z "$DOCKER_USERNAME" ] || [ -z "$DOCKER_PASSWORD" ]; then
  echo "DOCKER_USERNAME and DOCKER_PASSWORD environment variables must be set"
  exit 1
fi

REPO_DIR=$(basename -s .git "$GITHUB_REPO_URL")

echo "Cloning repository"
git clone "$GITHUB_REPO_URL"

cd "$REPO_DIR"

if [ ! -f "Dockerfile" ]; then
  echo "Dockerfile not found in repository root"
  exit 1
fi

echo "Building Docker image"
docker build -t "$DOCKER_REPO" .

echo "Logging into Docker Hub"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "Pushing image"
docker push "$DOCKER_REPO"

echo "Completed"