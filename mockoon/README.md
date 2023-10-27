# Mockoon

This directory contains mock API configurations to aid in local development and testing without having to rely on actual external services. These configurations are designed for use with [Mockoon](https://mockoon.com/), a tool to quickly mock servers.

## [Public API](./public_api.json)

This mock simulates our public API.

- Port: `6008`
- URL: `http://localhost:6008/api`

## [Moodle API](./moodle_api.json)

This configuration mocks the Moodle API. If you're developing features that interface with Moodle, this mock will be especially useful.

- Port: `6000`
- URL: `http://localhost:6000`

## [Unit Tests](./unit_tests.json)

Contains mock endpoints specifically designed for unit testing. These mocks provide controlled responses to ensure that unit tests have a consistent behavior irrespective of external factors.

- Port: `3000`
- URL: `http://localhost:3000`

## [Files](./files.json)

Mocks endpoints that allow for the downloading of various files. This can be particularly helpful when testing download functionalities.

- Port: `5000`
- URL: `http://localhost:5000`
