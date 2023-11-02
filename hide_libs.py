# Hides non top-level libraries in the dart-doc sidebar.
import os

top_level_libs = ["shared"]

# add the names of all folders in `lib/features` to `top_level_libs`

for folder in os.listdir("lib/features"):
    if os.path.isdir(os.path.join("lib/features", folder)):
        top_level_libs.append(folder)

# add all files in `lib/configs` as `configs.{basename}` to `top_level_libs`

for file in os.listdir("lib/configs"):
    if os.path.isfile(os.path.join("lib/configs", file)):
        top_level_libs.append("configs." + os.path.splitext(file)[0])


SCRIPT = """

let sidebar = document.querySelector("#dartdoc-sidebar-left")

const allowed = {top_level_libs};

for (let child of sidebar.getElementsByTagName('a')) {
  if (allowed.includes(child.innerText)) continue;

  child.parentElement.style.display = "none";
}
"""

script = SCRIPT.replace("{top_level_libs}", str(top_level_libs))

with open("doc/api/static-assets/docs.dart.js", "a") as f:
    f.write(script)
