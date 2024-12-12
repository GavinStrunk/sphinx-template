# Automatic API Generator for Python Packages

## Table of Contents
- [Automatic API Generator for Python Packages](#automatic-api-generator-for-python-packages)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Documentation Guide](#documentation-guide)
  - [Troubleshooting](#troubleshooting)

## Requirements

* sphinx 6.2.1
* poetry 1.6.1
* pyenv 2.3.26
* myst-parser
* sphinx_rtd_theme

## Usage
Steps:
1. Subtree the docs repository into the root of your python package
```bash
git submodule
```
2. Install dependencies with poetry
```
poetry add sphinx myst-parser toml
Either
poetry add sphinx-rtd-theme
Or
poetry add sphinx-book-theme
Or 
poetry add furo
```
3. Update image locations in READMEs

The docs_python_sphinx repository is a tool to create great looking documentation for any general python package. It contains the needed Sphinx settings, scripts to automatically populate files, and several other bells and whistles to make your life easier. Enjoy!

In order for docs_python_sphinx to integrate well with your python package, a specific process must be followed:

1. Your python package repository must follow this structure: 
    * Top_Level_Directory
        * docs_python_sphinx (**this repo (see Step 3)**)
        * src/
            * package_1
                * \_\_init\_\_.py
                * module1.py
                * module2.py
                * sub_package
            * package_2
            * ...
        * .python-version (*required by pyenv to set appropriate python version*)
        * poetry.lock
        * pyproject.toml
        * README.md

1. Ensure that your pyproject.toml file contains <u>**all**</u> of the required dependencies for your packages. Sphinx will only function properly if it can import all the needed dependency for all modules, files, classes, and functions.

1. Clone or copy the docs_python_sphinx inside of your repository. 

1. Execute the following commands:
    ```
    poetry shell                --> creates a virtual environment
    poetry install              --> installs all dependencies
    cd /docs_python_sphinx
    ./prep_sphinx_files.sh      --> populates api.rst and index.rst
    make html                   --> generates your documentation
    ```

1. If any errors occur, ensure that you have the needed dependencies. Add any missing dependencies by navigating to your top-level folder, then `poetry add <package-dependency>` and it will automatically find the appropriate compatible version. **This is one of the most essential steps and will cause the documentation build to fail and miss several files**.

1. If you have images to include in your README.md, please copy them to the `docs_python_sphinx/_static` folder and change your file paths to be relative to the docs folder (i.e.  `./_static/<your_image_name>`)

The documentation has now been generated. To view, run `google-chrome _build/html/index.html`

For more details regarding how to use the Poetry dependency manger, see https://python-poetry.org/docs/

## Documentation Guide

### Where to various comments show up in the documentation?

These images are taken from the documentation generated from within `spectacles``.

Your repository's README.md file will show up on the homepage.

<p align="center">
  <img width="1000" height="300" src="example_images/Screenshot from 2023-09-29 18-35-22.png">
</p>

Docstrings that you add to your \_\_init\_\_.py file of yoru package will end up at the top of this page:

<p align="center">
  <img width="1000" height="300" src="example_images/Screenshot from 2023-09-29 18-38-00.png">
</p>

Docstrings at the very top of module files will end up in the table description.

Those same docstrings will also show up at the top of the page that appears when you click on the modules listed in the table. Note that your function and class docstrings will be placed under their respective headings.

<p align="center">
  <img width="1000" height="300" src="example_images/Screenshot from 2023-09-29 18-40-23.png">
</p>

<p align="center">
  <img width="1000" height="300" src="example_images/Screenshot from 2023-09-29 18-40-36.png">
</p>

## Troubleshooting
 

 If you would like to show links to multiple versions of your code, here are some resources:

 https://docs.readthedocs.io/en/latest/index.html
 https://sphinxcontrib-versioning.readthedocs.io/en/latest/
 https://holzhaus.github.io/sphinx-multiversion/master/index.html

