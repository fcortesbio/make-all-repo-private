#!/bin/bash

# Replace with your GitHub username
USERNAME="fcortesbio"

echo "Listing public repositories for @$USERNAME..."

# Get a list of all public repository names
# --json name --jq '.[].name' extracts only the 'name' field from the JSON output
# and formats it as a list of names.
PUBLIC_REPOS=$(gh repo list "$USERNAME" --json name,visibility --jq '.[] | select(.visibility == "public") | .name')

if [ -z "$PUBLIC_REPOS" ]; then
    echo "No public repositories found for @$USERNAME."
    exit 0
fi

echo "The following public repositories will be made private:"
echo "$PUBLIC_REPOS"
echo ""

read -p "Are you absolutely sure you want to make these repositories private? This action has irreversible consequences (e.g., losing stars/watchers, detaching forks). Type 'yes' to confirm: " confirmation

if [ "$confirmation" != "yes" ]; then
    echo "Operation cancelled."
    exit 1
fi

echo "Proceeding to change visibility..."

# Loop through each public repository and change its visibility
for REPO_NAME in $PUBLIC_REPOS; do
    echo "Changing $USERNAME/$REPO_NAME to private..."
    gh repo edit "$USERNAME/$REPO_NAME" --visibility private --accept-visibility-change-consequences
    if [ $? -eq 0 ]; then
        echo "Successfully changed $USERNAME/$REPO_NAME to private."
    else
        echo "Failed to change $USERNAME/$REPO_NAME to private. Check the error message above."
    fi
done

echo "Visibility change process complete."