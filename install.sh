#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

INIT_GIT=false

echo -e "${YELLOW}Note: The project will be created in the parent directory of the current directory.${NC}"
read -p "Do you want to continue? (y/N): " -n 1 -s RESPONSE
echo
RESPONSE=$(echo "$RESPONSE" | tr '[:upper:]' '[:lower:]')
if [[ "$RESPONSE" != "y" ]]; then
  echo "Operation cancelled."
  exit 0
fi

echo -en "Enter the project name: ${GREEN}"
read -p "" PROJECT_NAME
echo -en "${NC}"
if [ -z "$PROJECT_NAME" ]; then
  echo -e "${RED}Error: No project name provided.${NC}"
  exit 1
fi

read -p "Do you want to initialize a Git repository? (y/N): " -n 1 -s USE_GIT
echo
USE_GIT=$(echo "$USE_GIT" | tr '[:upper:]' '[:lower:]')
if [[ "$USE_GIT" == "y" ]]; then
  INIT_GIT=true
fi

mkdir ../$PROJECT_NAME
if [ $? -ne 0 ]; then
  echo -e "${RED}Failed to create directory.${NC}"
  exit 1
fi

cp -R scaffold/* ../$PROJECT_NAME

cd ../$PROJECT_NAME
if [ $? -ne 0 ]; then
  echo -e "${RED}Failed to enter directory.${NC}"
  exit 1
fi

if [ "$INIT_GIT" == true ]; then
  git init
  if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to initialize Git repository.${NC}"
    exit 1
  fi
fi

echo -e "${GREEN}Project $PROJECT_NAME initialized successfully.${NC}"

if [ "$INIT_GIT" == false ]; then
  echo
  echo -e "${YELLOW}Note: Git repository was not initialized.${NC}"
fi

exit 0
