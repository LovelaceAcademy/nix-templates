# OpenCode Guidelines for nix-templates

This repository contains various Nix flake templates. Here are some general guidelines for working with them:

## Commands

-   **Enter Development Shell**: `nix develop`
-   **Build Project**: `nix build` (or `nix build .#<template-name>` for a specific template's default package, or `nix build .#<template-name>:exe:<executable-name>` for a specific executable)
-   **Run Project**: `nix run` (or `nix run .#<template-name>` for a specific template's default package, or `nix run .#<template-name>:exe:<executable-name>` for a specific executable)
-   **Run a Single Test**: This varies by template. You'll need to consult the specific `flake.nix` or project's documentation. For JavaScript-based templates (like `pix-ctl-full`), check `package.json` for test scripts (e.g., `npm test`).

## Code Style Guidelines

Due to the polyglot nature of this repository, specific code style guidelines vary by language and template. However, general best practices apply:

-   **Readability**: Write clear, concise, and self-documenting code.
-   **Consistency**: Follow existing patterns and conventions within each template.
-   **Naming Conventions**: Use descriptive names for variables, functions, and modules.
-   **Error Handling**: Implement robust error handling mechanisms.
-   **Imports**: Organize imports logically, typically at the top of the file.

## Additional Notes

-   Always check the `flake.nix` and `package.json` (if present) within each template's directory for specific build, lint, and test commands.
-   Look for `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md` for AI-specific guidelines if they exist in a given project.
