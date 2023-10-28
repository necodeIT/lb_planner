import json
import re
import sys


def extract_function_info(file_content):
    function_info = []

    # Removing comments, PHP tags, and definitions
    clean_content = re.sub(r"//.*|<\?php|defined\(.*\)\s*\|\|\s*die\(\);", "", file_content)

    # Splitting the content based on function definition blocks
    functions = re.findall(r"'(.*?)' => array\((.*?)\),", clean_content, re.DOTALL)

    for function in functions:
        func_dict = {}

        # Extracting function name and group
        func_name_match = re.match(r"local_lbplanner_(.*?)_(.*)", function[0])
        if func_name_match:
            func_dict["function_name"] = function[0]
            func_dict["group"] = func_name_match.group(1)
        else:
            continue

        # Extracting and adjusting capabilities
        capabilities = re.search(r"'capabilities' => '.*:(.*?)'", function[1])
        func_dict["capabilities"] = capabilities.group(1) if capabilities else None

        # Extracting description
        description = re.search(r"'description' => '(.*?)'", function[1])
        func_dict["description"] = description.group(1) if description else None

        # Extracting and adjusting path
        classpath = re.search(r"'classpath' => 'local/(.*?)'", function[1])
        func_dict["path"] = classpath.group(1) if classpath else None

        # Only adding to the list if all information is present
        if all(value is not None for value in func_dict.values()):
            function_info.append(func_dict)

    return function_info


def extract_php_functions(php_code):
    # Regular expression to match the function names and bodies
    pattern = re.compile(r"(public static function \w+_(?:returns|parameters).*?{.*?})", re.DOTALL)

    # Find all matches in the PHP code
    matches = pattern.findall(php_code)

    parameters_function = None
    returns_function = None

    for match in matches:
        # Extract function name
        function_name = re.search(r"public static function (\w+)", match).group(1)

        if function_name.endswith("_parameters"):
            parameters_function = match
        elif function_name.endswith("_returns"):
            returns_function = match

    return parameters_function, returns_function


def parse_returns(input_str):
    pattern = r"'(\w+)' => new external_value\((\w+), '([^']+)'"
    matches = re.findall(pattern, input_str)

    output_dict = {}
    for match in matches:
        key, value_type, description = match
        output_dict[key] = {"type": convert_param_type_to_normal_type(value_type), "description": description}

    # Check for the presence of 'external_multiple_structure'
    is_multiple_structure = "external_multiple_structure" in input_str

    return output_dict, is_multiple_structure


def convert_param_type_to_normal_type(param_type):
    CONVERSIONS = {
        "PARAM_INT": "int",
        "PARAM_TEXT": "String",
        "PARAM_URL": "String",
        "PARAM_BOOL": "bool",
    }

    return CONVERSIONS.get(param_type, param_type)


def parse_params(input_text):
    # Regular expression to match the parameters inside the 'new external_value()' function
    pattern = r"'(\w+)' => new external_value\s*\(\s*(\w+)\s*,\s*'([^']+)',\s*(\w+),\s*([\w\d]+|\w+),\s*(\w+)\s*\)"

    # Find all matches of the pattern in the input text
    matches = re.findall(pattern, input_text)

    result = {}
    for match in matches:
        param_name = match[0]
        result[param_name] = {
            "type": convert_param_type_to_normal_type(match[1]),
            "description": match[2],
            "required": True if match[3] == "VALUE_REQUIRED" else False,
            "default_value": match[4] if match[4] != "null" else None,
            "nullable": False if match[5] == "NULL_NOT_ALLOWED" else True,
        }

    return result


SCRIPT = r"""

const funcs = /* JSON data here */;


let groups = [];

for (let func of funcs) {
    let group = groups.find(g => g.groupName === func.group);
    if (!group) {
        group = {
            groupName: func.group,
            functions: []
        };
        groups.push(group);
    }
    group.functions.push(func);
}

const sidebar = document.getElementById('sidebar');
const content = document.getElementById('content');

let currentFunction = null;


function searchFunction() {

    const input = document.getElementById('search').value.toUpperCase();
    const functions = document.querySelectorAll('.func-name');

    for (let i = 0; i < functions.length; i++) {
        const textValue = functions[i].textContent || functions[i].innerText;
        if (funcName(textValue).toUpperCase().includes(input)) {
            functions[i].style.display = "";
        } else {
            functions[i].style.display = "none";
        }
    }

    // check for func-group and if it has any children that are visible and if not hide it
    const groups = document.querySelectorAll('.func-group');
    for (let group of groups) {
        let visible = false;
        for (let child of group.children) {
            if (!child.classList.contains('func-name')) continue;

            child.style.display !== 'none' ? visible = true : null;

            if (visible) break;
        }

        visible ? group.style.display = '' : group.style.display = 'none';
    }
}

const groupsElement = document.querySelector('#func-groups');
const detailsPane = document.querySelector('#func-details');

function displayGroupsAndFunctions() {
    groups.forEach(group => {
        const groupElement = document.createElement('div');
        groupElement.classList.add('func-group');

        groupName = document.createElement('h1');
        groupName.textContent = group.groupName;

        groupElement.appendChild(groupName);
        groupsElement.appendChild(groupElement);

        group.functions.forEach(func => {
            const funcElement = document.createElement('p');
            funcElement.classList.add('func-name');
            funcElement.textContent = func.function_name;
            funcElement.onclick = () => {
                if (currentFunction) {
                    currentFunction.removeAttribute('active');
                }

                funcElement.setAttribute('active', '');

                currentFunction = funcElement;

                displayFunctionDetails(func);
            };
            groupElement.appendChild(funcElement);
        });
    });
    let bottomSpacer = document.createElement('div');
    bottomSpacer.style.height = '100px';
    groupsElement.appendChild(bottomSpacer);
}

function funcName(fullName) {
    // remove everything from the third underscore
    const split = fullName.split('_');
    return split.slice(3, split.length).join(' ');
}

function displayFunctionDetails(func) {

    detailsPane.innerHTML = `
    <h1>${funcName(func.function_name)}</h1>
    <p id="full-func-name">${func.function_name} <i class="fa-regular fa-copy" id="copy"></i></p>
    <hr />
    <p id="func_desc">${func.description}</p>
    <h2>Capabilities</h2>
    <hr />
    <p>${func.capabilities}</p>
    <h2>Parmeters</h2>
    <hr />
    ${Object.keys(func.parameters).map(param => `
    <div class="param">
        <div class="param-signature">
            <p class="param-name">${param}</p>
            <p>${func.parameters[param].type}</p>
            <p class="param-${func.parameters[param].required ? 'required' : 'optional'}">${func.parameters[param].required ? 'required' : 'optional'}</p>
        </div>
        <p class="param-desc">${func.parameters[param].description}</p>
    </div>
`).join('')}
    <h2>Returns${func.returns_multiple ? '<p class="badge" style="  font-size: 0.7rem;">Array</p>' : ""}</h2>
    <hr />
    ${Object.keys(func.returns).map(ret => `
    <div class="value">
    <div class="value-signature">
      <p class="value-name">${ret}</p>
      <p>${func.returns[ret].type}</p>
    </div>
    <p class="value-desc">${func.returns[ret].description}</p>
  </div>
`).join('')}
    `;

    let copy = document.getElementById('copy');
    copy.onclick = () => {
        navigator.clipboard.writeText(func.function_name);
    }

    let returnValues = document.querySelectorAll('.value-name');
    let params = document.querySelectorAll('.param-name');

    for (let value of returnValues){
        value.addEventListener('click', () => {
            navigator.clipboard.writeText(value.innerText)
        });
    }

    for (let param of params){
        param.addEventListener('click', () => {
            navigator.clipboard.writeText(param.innerText)
        });
    }
}

displayGroupsAndFunctions();

document.getElementById('search').addEventListener('keyup', searchFunction);
"""

if __name__ == "__main__":
    with open("lbplanner/db/services.php", "r") as file:
        content = file.read()
        info = extract_function_info(content)

        complete_info = []

        for i, info in enumerate(info):
            with open(info["path"], "r") as func_file:
                func_content = func_file.read()
                params_func, returns_func = extract_php_functions(func_content)

                returns, returns_multiple = parse_returns(returns_func)

                incomplete_info = info

                params = parse_params(params_func)

                incomplete_info["parameters"] = params
                incomplete_info["returns"] = returns
                incomplete_info["returns_multiple"] = returns_multiple

                complete_info.append(incomplete_info)

        script = SCRIPT.replace("/* JSON data here */", json.dumps(complete_info))

        with open(f"{sys.argv[1]}/script.js", "w") as output_file:
            output_file.write(script)
