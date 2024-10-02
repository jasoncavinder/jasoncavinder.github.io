#!/bin/bash
command -v pandoc >/dev/null 2>&1 || {
    [[ "$OSTYPE" == "linux-gnu"* ]] && {
        sudo apt-get update >/dev/null 2>&1 &&
        sudo apt-get install -y pandoc >/dev/null 2>&1 ||
        sudo yum install -y pandoc >/dev/null 2>&1
    } || [[ "$OSTYPE" == "darwin"* ]] && {
        brew install pandoc >/dev/null 2>&1 || {
            echo "Install Homebrew to proceed."; exit 1
        }
    }
    command -v pandoc >/dev/null 2>&1 || {
        echo "Pandoc installation failed."; exit 1
    }
    echo "Pandoc installed."
}
pandoc -s --from gfm -o index.html README.md &&
echo "Complete index.html generated." || {
    echo "HTML generation failed."; exit 1
}