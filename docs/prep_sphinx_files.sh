#!/bin/bash

# Check if the /src directory exists in the current directory
if [ -d "../src" ]; then
    echo "Contents of /src directory:"
    
    # List the files and directories within /src, separated by new lines
    find "../src" -mindepth 1 -maxdepth 1 -exec basename {} \; | sed 's/\.[^.]*$//' | tr '\n' '\0' | xargs -0 -I {} echo -e '\t{}' > temp.txt

    # Replace the "[start.package.names.here]" string in /api.rst with the contents of temp.txt
    sed -i '/\[insert\.package\.names\.here\]/{
      r temp.txt
      d
    }' "./api.rst"
    rm temp.txt

    echo "File names and directories (without extensions) replaced in /api.rst."

    # List the files and directories within /src, separated by new lines (without extensions)
    find "../src" -mindepth 1 -maxdepth 1 -exec basename {} \; | sed 's/\.[^.]*$//' | tr '\n' '\0' | xargs -0 -I {} echo -e '\t{} <_autosummary/{}>' > temp.txt

    # Replace the "[insert.api.package.titles.here]" string in index.rst with the contents of temp.txt
    sed -i '/\[insert\.api\.package\.titles\.here\]/{
      r temp.txt
      d
    }' "./index.rst"
    rm temp.txt

    echo "Updated index.rst with file names (without extensions) from /src."
else
    echo "The /src directory does not exist in the current directory."
fi

project_name=$(basename "$(dirname "$(dirname "$(realpath "$0")")")")

# Function to capitalize the first letter of each word
capitalize() {
    echo "$1" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1'
}

# Check if the "[insert.project.name.here]" string is present in index.rst
if grep -q "\[insert\.project\.name\.here\]" "./index.rst"; then
    # Project name was found in index.rst
    # Check if the project name was obtained successfully
    if [ -n "$project_name" ]; then
        # Capitalize the first letter of each word in the project name
        project_name=$(capitalize "$project_name")

        # Calculate the length of the title, including the prefix
        title_length=$((33 + ${#project_name})) # 24 for "Welcome to the Documentation for "

        # Generate a line of "=" characters with the same length as the title
        underline=$(printf '=%.0s' $(seq 1 "$title_length"))

        # Search and replace the string in index.rst
        sed -i "s/\[insert\.project\.name\.here\]/$project_name/g" "./index.rst"

        # Append the "=" line below the title
        sed -i "/$project_name/a\\$underline" "./index.rst"

        echo "Replaced [insert.project.name.here] with '$project_name' in index.rst."
    else
        echo "Failed to determine the project name."
    fi
else
    echo "[insert.project.name.here] not found in index.rst. No changes were made."
fi

