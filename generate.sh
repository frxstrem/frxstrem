#!/bin/bash -e
cd "$(dirname "$0")"

export KNOWLEDGE_ITEMS="$(
    npx js-yaml knowledge_items.yaml | \
      jq -rc '.[] | "**\(.title)**:  ", (.items[] | @uri "![](https://img.shields.io/badge/-\(.text)-informational?style=flat&logo=\(.logo)&logoColor=white&color=2bbc8a)"), ""'
)"

envsubst '${KNOWLEDGE_ITEMS}' <TEMPLATE.md >README.md