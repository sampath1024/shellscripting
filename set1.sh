#!/bin/bash
{
set -n  # Syntax check mode, commands will not be executed

echo "This script will not be executed."
kkdir /test-directory  # This command will not be executed
} > /tmp/resultsscript

