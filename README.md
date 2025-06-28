# Piccolo
A game architecture library for LÖVE

[![Build status](https://github.com/Keyslam/Piccolo/actions/workflows/run-tests.yaml/badge.svg)](https://github.com/Keyslam/Piccolo/actions/workflows/run-tests.yaml)
[![Coverage](https://codecov.io/github/Keyslam/Piccolo/branch/main/graph/badge.svg?token=4D71ZA5CXD)](https://codecov.io/github/Keyslam/Piccolo)

![GitHub release](https://img.shields.io/github/v/release/Keyslam/Piccolo)
![License](https://img.shields.io/badge/license-MIT-green)
![LuaJIT](https://img.shields.io/badge/LuaJIT-blue)

> ⚠️ **Work in progress**: Piccolo is still under active development. Documentation may be incomplete, inaccurate, or cover unimplemented features.

## Installation

1. **Download** this repository (or add it as a submodule).
2. Include the `piccolo` folder in your project.
3. Require it in your code:
   ```lua
   local piccolo = require("piccolo")
   ```

## Versioning

Piccolo uses [Semantic Versioning (SemVer)](https://semver.org/).
Until a `1.0.0` release, minor version bumps may include breaking changes. After `1.0.0`, backwards compatibility will follow SemVer guarantees.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

This project uses the [`class` module from Batteries](https://github.com/1bardesign/batteries), licensed under MIT.
