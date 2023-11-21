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

Certainly! Here's a top-level documentation for using the `data_generator.py` script, including details on how to structure the JSON templates:

---

## [data_generator.py](./data_generator.py)

This script is a command-line tool designed to generate an array of data objects based on a specified JSON template. It allows users to define fields in the template that should be populated with random data, making it useful for generating test or sample data.

### Requirements

- Python 3.x

### JSON Template Structure

The JSON template should be structured as a single object where each field can be either a static value or an object specifying randomization. Fields marked for randomization should be defined as objects with the following properties:

- `type`: Specifies the type of random data to generate. Supported types are `string`, `int`, and `float`. Additional types can be added in the script if needed.

Example of a JSON template structure:

```json
{
  "userid": {"type": "int"},
  "username": {"type": "string"},
  "profileimageurl": "https://example.com/image.jpg",
  "department": {"type": "string"}
}
```

In this example, `userid` and `username` will be replaced with random integers and strings, respectively, while `profileimageurl` will remain unchanged.

### How to Use

1. **Prepare the JSON Template**: Write your JSON template according to the structure described above and save it in a file (e.g., `template.json`).

2. **Run the Script**: Use the command line to navigate to the directory containing the `data_generator.py` script and run it with the path to your JSON template file and the desired size of the data array.

   Command format:

   ```bash
   python data_generator.py [path_to_json_file] [array_size]
   ```

   Example command:

   ```bash
   python data_generator.py template.json 5
   ```

   This will generate an array of 5 data objects based on the template provided in `template.json`.

The script outputs the generated data array in JSON format to the console. You can redirect this output to a file or the clipboard using pipes if needed.
