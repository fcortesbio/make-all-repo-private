#!/bin/bash

USERNAME="fcortesbio"

echo "Listing public repositories for @$USERNAME..."

# Get a list of all public repo names, one per line
PUBLIC_REPOS=$(gh repo list $USERNAME --limit 1000 --json name,visibility --jq '.[] | select(.visibility == "PUBLIC") | .name')

if [ -z "$PUBLIC_REPOS" ]; then
    echo "No public repositories found for @$USERNAME."
    exit 0
fi

echo "The following public repositories will be made private:"
echo "$PUBLIC_REPOS"
echo ""

read -p "Are you absolutely sure you want to make these repositories private? This action is irreversible (e.g., losing stars/watchers, detaching forks). Type 'yes' to confirm: " confirmation

if [ "$confirmation" != "yes" ]; then
    echo "Operation cancelled."
    exit 1
fi

echo "Proceeding to change visibility..."

# Convert list into array to handle names safely
readarray -t REPO_ARRAY <<< "$PUBLIC_REPOS"

for REPO_NAME in "${REPO_ARRAY[@]}"; do
    echo "Changing $USERNAME/$REPO_NAME to private..."
    gh repo edit "$USERNAME/$REPO_NAME" --visibility private --accept-visibility-change-consequences
    if [ $? -eq 0 ]; then
        echo "✅ Successfully changed $USERNAME/$REPO_NAME to private."
    else
        echo "❌ Failed to change $USERNAME/$REPO_NAME to private."
    fi
done

echo "🎉 Visibility change process complete."