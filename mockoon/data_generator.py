import json
import random
import string
import argparse


def generate_random_data(data_type):
    """Generate random data based on the provided data type."""
    if data_type == "string":
        return "".join(random.choices(string.ascii_letters, k=10))
    elif data_type == "int":
        return random.randint(1, 100)
    elif data_type == "float":
        return round(random.uniform(1.0, 100.0), 2)
    # Add more data types as needed
    return None


def process_template(template):
    """Process the template and replace fields with random data where indicated."""
    for key, value in template.items():
        if isinstance(value, dict):
            if value.get("randomize"):
                data_type = value.get("type", "string")
                template[key] = generate_random_data(data_type)
            else:
                process_template(value)
    return template


def generate_data_array_from_file(file_path, array_size):
    """Generate an array of data based on the JSON template from a file."""
    with open(file_path, "r") as file:
        template = json.load(file)

    data_array = []
    for _ in range(array_size):
        processed_template = process_template(template.copy())
        data_array.append(processed_template)

    return data_array


def main():
    parser = argparse.ArgumentParser(
        description="Generate an array of data from a JSON file template with randomization options."
    )
    parser.add_argument("file_path", type=str, help="File path to the JSON template")
    parser.add_argument(
        "array_size", type=int, help="Size of the data array to generate"
    )

    args = parser.parse_args()

    data_array = generate_data_array_from_file(args.file_path, args.array_size)
    print(json.dumps(data_array, indent=2))


if __name__ == "__main__":
    main()
