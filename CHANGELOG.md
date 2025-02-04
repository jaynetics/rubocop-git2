# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.7] - 2024-02-04

### Fixed

- deprecation warning for rubocop >= 1.68.0


## [0.1.6] - 2023-03-27

### Fixed

- deprecation warning for rubocop >= 1.65.0

## [0.1.5] - 2023-03-27

### Fixed

- stop using unsafe `YAML.load` on rubocop.yml

## [0.1.4] - 2023-03-24

First release as `rubocop-git2`.

### Added

- support for `--only` flag
- support for `--format` flag
  - via https://github.com/m4i/rubocop-git/pull/45

### Fixed

- fixed many cops erroring ("An error occurred while ... was inspecting ...")
- incompatibility with some git configurations
  - c.f. https://github.com/m4i/rubocop-git/issues/20
  - via https://github.com/m4i/rubocop-git/pull/32
  - fix had been merged into the original repo but was never released
- include and exclude behavior not matching rubocop's
  - c.f. https://github.com/m4i/rubocop-git/issues/30
  - partially via https://github.com/m4i/rubocop-git/pull/33
- enabled/disabled cops not being respected
  - c.f. https://github.com/m4i/rubocop-git/issues/38
  - c.f. https://github.com/m4i/rubocop-git/issues/39
  - partially via https://github.com/m4i/rubocop-git/pull/47

## [0.1.3] - 2017-04-08

Last release of the original `rubocop-git`.
