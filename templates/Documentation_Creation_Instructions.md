# Main:
Hello I am a PhD bioinformatics researcher working for a soy and corn gene editing company.
My name is Scott Teresi, and I am based in the United States.
I work on a team called Target Discovery.
My core knowledge base is in Python, and transposable elements.
I have experience working with gene networks, differential expression, and computing clusters.
I prefer to write code in Python or bash, less so in R.
I typically write code in terminal via Vim, and I use Git for version control.
Below are some instructions for how to create documentation for my code and projects.
Please note the different contexts in which I will be using these instructions, such as in-script documentation blocks and project README files.


# Instructions for Generating Portland Form Documentation

## I. Core Structure: The Portland Form

The documentation should be structured using the "Portland Form," consisting of the following sections in this specific order:

1.  `Purpose:`
2.  `Problem:`
3.  `Context:`
4.  `Solution:`
5.  `Resulting Context:`
6.  `Usage:`
7.  `Future Work and Considerations:`

## II. Content Style and Formatting

* **Tone:** Maintain a direct and to-the-point tone. Minimize using second-person pronouns (e.g., "you," "your") and avoid first-person references (e.g., "I will..."). The focus should be on the script or project itself.
* **Sentence Structure:** Each sentence within the content of the Portland Form sections must be on its own line. Ideally these sentences should be in list format.
* **Output Format:** The entire Portland Form documentation block must be provided in Markdown.
    * Headings for each section should be clear (e.g., using `# Purpose:` or similar).
    * Code examples, commands, or argument descriptions within the "Usage" section should be formatted appropriately using Markdown code blocks or inline code styling.

## III. Placement

* For individual scripts, this Portland Form documentation block should be placed at the top of the script file, typically after the shebang and any author/date information.

## IV. Focus and Detail

* **Primary Focus:** The main emphasis is on creating clear, non-code documentation that explains the script or project.
* **Code Edits:** Suggestions for code modifications should only be made if they address something "highly important" (e.g., critical errors or significant deviations from stated intent).
* **Comments in Code:** Suggestions for adding comments directly within the code are acceptable.
* **"Solution" Section Detail:** For in-script documentation, this section should provide a high-level overview of the script's actions rather than a detailed step-by-step breakdown of its internal logic.
* **"Usage" Section Detail:** This section is important. It should clearly:
    * Explain how to execute the script.
    * Detail all command-line arguments, their order, and their meaning.
    * For pipeline scenarios (like in a project README), describe the order in which scripts should be run.
    * Crucially, indicate which input files (especially TSV or configuration files) need to be created or modified by the user (e.g., when adding new samples or changing parameters).
* **"Future Work and Considerations" Section Detail:** This section should be kept concise, especially if future plans are still evolving.

## V. Contextual Application

* **In-Script Documentation:** The one-sentence-per-line rule and direct tone are primary for the Portland Form block embedded within scripts.
* **README Files:** While still maintaining a direct tone, a project README can be more verbose and may use more traditional paragraph structures for better readability, even if it incorporates elements or a similar structure to the Portland Form. The strict one-sentence-per-line rule for content primarily applies to the in-script documentation blocks.

## VI. Iterative Refinement

* I should be prepared to adjust the level of verbosity and detail based on your feedback for specific scripts or READMEs.
* Do not use the first-person perspective (e.g., "I will...") in the documentation unless explicitly requested. Instead, focus on the script's purpose and usage without referring to the author or creator.


## Other:
- If paths for directories or other files must be hard-coded, their definitions should be placed at the top of the script, ideally in a section labeled `# Paths:` or similar.
- If it is a shell/bash script, this can easily be close to the top of the script, but if it is a Python script, it should be placed after the argument parsing section.

## Example:

Here is an excerpt of how the Portland Form documentation should look in a script, it was generated for a shell script that compared two BED files:

```bash
#!/bin/bash
# Author: Scott Teresi (steresi@thetraitscompany.com)
# Date: June 12, 2025

# --- Portland Form Documentation ---
#
# Purpose:
# This script performs a direct positional overlap comparison between two BED files.
# It is designed to be flexible, allowing for comparisons between two different SV callers (e.g., Delly vs. Manta) or a caller against a gold standard.
# It iterates through different reciprocal overlap thresholds and summarizes the results in a Markdown file.
#
# Problem:
# A standardized method is needed to compare any two sets of genomic intervals in BED format.
# Previous versions of this script were specialized for either tool-vs-gold-standard or tool-vs-tool directory comparisons.
# A single, flexible script that operates on specific files is more efficient and easier to maintain.
#
# Context:
# This script is a general utility for evaluating SV call sets.
# It takes two BED files and their respective names as input, allowing for clear and well-documented comparisons.
#
# Solution:
# The script accepts five command-line arguments: two input BED files, a name for each file, and an output directory.
# It performs a `bedtools intersect` comparison (`-wo -f <threshold> -r`) between the two files.
# An `awk` command filters these overlaps to identify those where the SVTYPE (column 6) matches.
# Counts for various thresholds are written to a dedicated Markdown summary file, named based on the inputs.
#
# Resulting Context:
# A single Markdown summary file is created (e.g., `Summary_Manta_vs_Delly.md`).
# This file details total variant counts for each input file and provides a table of overlap statistics.
# This allows for a direct, file-to-file assessment of concordance.
#
# Usage:
# This script is executed directly using bash.
# It requires five command-line arguments.
#
# Command:
#   bash <script_name.sh> <file1.bed> <name1> <file2.bed> <name2> <output_directory>
#
# Example (Tool vs. Tool):
#   bash compare_BED.sh results/Manta_BED/TRB01A.bed Manta results/TRB_BED/TRB01A.bed Delly results/comparisons
#
# Example (Tool vs. Gold Standard):
#   bash compare_BED.sh results/Manta_BED/TRB01A.bed Manta results/GS_BED/GS_TRB_All.bed GoldStandard results/comparisons
#
# Arguments:
#   <file1.bed>:        Full path to the first BED file (file A).
#   <name1>:            A short name for the first file (e.g., "Manta").
#   <file2.bed>:        Full path to the second BED file (file B).
#   <name2>:            A short name for the second file (e.g., "Delly").
#   <output_directory>: Full path to the directory where comparison results will be saved.
#
# Future Work and Considerations:
# - Enhancement: Add an option to generate a combined summary report when running multiple comparisons.
# - Enhancement: Add support for different filtering logic based on input names (e.g., if a file is named "GoldStandard").
#
# --- End Portland Form Documentation ---

```
---

# Instructions Regarding Python Code:
This document outlines the preferred style for writing Python docstrings for functions, modules, and classes.
The goal is to create clear, informative, and consistent documentation that integrates well with type hints.

## General Principles:
- **Enclosure:** All docstrings should be enclosed in triple double quotes ("""Docstring content goes here""").
- **First Line Summary**: The first line of a docstring should be a concise summary of the object's purpose. This line should be able to stand alone. It should be followed by a blank line if more details are provided.
- **Imperative Mood**: Write the summary line (and often other parts of the docstring) in the imperative mood (e.g., "Calculate a value..." rather than "Calculates a value..." or "This function calculates...").
- **Blank Lines**: Use blank lines to separate logical sections within the docstring (e.g., between the summary, extended description, and argument/return sections).
- Unless explicitly asked for, 

### Guidelines for AI Code Sketching/Diagramming:

When providing initial code structures or "sketches" for functions:

* **Focused Solutions:** Limit the proposed solution strictly to the specific problem or function currently being discussed.
* **Incremental Steps:** Avoid proactively implementing subsequent logical steps or helper functions that have not yet been explicitly requested.
* **Confirmation for Next Steps:** If outlining or suggesting further steps seems necessary or beneficial for context, please ask for confirmation before proceeding to detail those steps.
* **Function Sketches:** When sketching a new function, provide:
    * The function signature with clear argument names and type hints.
    * The return type hint.
    * A concise, one-line summary docstring. A more detailed docstring (with `Args:`, `Returns:`, etc.) can be elaborated upon request or in a later refinement step.
    * The body of the sketched function should consist solely pseudocode comments and end with a `raise NotImplementedError("Function not yet implemented.")` or a simple `pass` statement.

## Function Docstrings:
Function docstrings should describe what the function does, its parameters, what it returns, and any exceptions it might raise.
```
def example_function(param1: str, param2: int = 0) -> Optional[List[str]]:
    """
    Concise summary of what the function does.

    More detailed explanation of the function's behavior, algorithms,
    or any important side effects can go here, after a blank line
    from the summary.

    Args:
        param1 (str): Description of the first parameter. Explain its role
                      and any expected format or constraints.
        param2 (int, optional): Description of the second parameter.
                                Defaults to 0. Indicate if it's optional
                                and its default value.

    Returns:
        Optional[List[str]]: Description of the value returned by the function.
                             If `None` can be returned, reflect this in the type
                             hint and description. For example, "A list of strings
                             if successful, None otherwise."
                             If the function does not explicitly return a value
                             (i.e., implicitly returns `None`), it can be stated as:
                             `None: This function does not return a value.`

    Raises:
        ValueError: If `param1` has an invalid format.
        TypeError: If `param2` is not an integer.
    """
    # Function implementation
    pass
```
### Components:
1. **Summary Line**: As described above.
2. **Extended Description (Optional)**: Provides more context if the summary line is insufficient.
3. `Args:` **Section**:
    - Starts with the label `Args:`
    - Each parameter is listed on a new line, indented.
    - The format for each parameter is: `parameter_name (type, optional): Description.`
        * `parameter_name`: The name of the parameter.
        * `(type)`: The type hint for the parameter, matching the function signature.
        * `(optional)`: Add this if the parameter has a default value and is optional.
        * `Description`: A clear explanation of what the parameter represents and how it's used.

Documenting Pandas DataFrame Arguments:
When a parameter is a `pandas.DataFrame`, provide details about its expected structure, including the Index and Columns. Use further indentation to list these details. Example:
```
Args:
    my_dataframe (pd.DataFrame): Description of the DataFrame's role.
        Index:
            Name: index_name (e.g., 'Gene_ID'), dtype (e.g., str), Description of the index.
        Columns:
            'Column_Name_1' (dtype, e.g., str): Description of this column.
            'Column_Name_2' (dtype, e.g., int): Description of this column.
            'Another_Column' (dtype, e.g., float64): Description.
```
- Clearly state the expected name (if any) and dtype of the Index.
- For Columns, list each expected column name as a string, followed by its dtype in parentheses, and a extremely brief description of its content or purpose.


4. `Returns:` **Section**:
    - Starts with the label `Returns:`.
    - Describes the return value.
    - The format is: `return_type: Description.`
        * `return_type:` The type hint for the return value, matching the function signature.
        * `Description:` A clear explanation of what the returned value represents.
        * If a function can return multiple types (e.g., using `Union`), or `None` explicitly, this should be reflected.
        * If the function has no `return` statement or only `return None`, use `None:` and state that the function does not return a value or returns `None`.
5. `Raises:` **Section (Optional but Recommended)**:
    - Starts with the label ``Raises:``.
    - Lists any exceptions that the function is designed to raise explicitly.
    - The format for each exception is: `ExceptionType: Condition under which it's raised.`

## Module Docstrings:
A docstring at the beginning of a Python file (`.py`) serves as the module docstring."""

```
Module-level docstring: A brief overview of the module's purpose.

This can be followed by a more detailed description of the module's
contents, overall architecture, or usage examples.
"""

# Module imports and code follow
```

- It should provide a clear overview of what the module contains and its general purpose.

## Class Docstrings:
Classes and their methods should also have docstrings.

```
class ExampleClass:
    """
    Summary of the class's purpose.

    More detailed explanation of the class, its attributes, and
    how it's intended to be used.

    Attributes:
        attr1 (str): Description of attr1.
        attr2 (int): Description of attr2.
    """

    def __init__(self, initial_value: int):
        """
        Initialize an ExampleClass instance.

        Args:
            initial_value (int): The initial value for an attribute.
        """
        self.attr2 = initial_value
        self.attr1 = "default"

    def example_method(self, data: str) -> bool:
        """
        Summary of what this method does.

        Args:
            data (str): Input data for the method.

        Returns:
            bool: True if the operation was successful, False otherwise.
        """
        # Method implementation
        return True
```
### Components:
1. **Class Docstring:**
- Summarizes the class's role.
- Can include an `Attributes:` section (similar to `Args:`) to describe public attributes, especially if they are not clearly set or documented in `__init__`.
2. **Method Docstrings (including `__init__`):**
- Follow the same format as function docstrings (`Args:`, `Returns:`, `Raises:`).
- For `__init__`, the `Returns:` section is typically omitted or states `None`.

## Type Hinting:
- Python type hints (from the `typing` module where necessary, e.g., `List`, `Dict`, `Optional`, `Tuple`, `NamedTuple`, `Set`, `Any`) should be used for all function/method parameters and return values.
- The types specified in the docstring's `Args:` and `Returns:` sections must match the type hints in the function/method signature.

By following these guidelines, the docstrings will be informative, consistent, and easy for both humans and documentation generation tools to understand.

# Regular Markdown Documents and Planning Files:
When constructing Markdown Documents for the user they should use the following heading:
```
---
colorlinks: true
output:
    pdf_document:
        pandoc_args: ["--from", "markdown+backtick_code_blocks"
        ]
---
\begin{flushright}
\textbf{Title} \\
\textbf{Author: Scott Teresi} \\
\textbf{Date: TODO} \\
\end{flushright}
```

Regular Markdown documents should roughly follow the Portland Form.
Additional sections may be added to the Portland Form. Some sections may be removed. But the core sections of "Purpose", "Problem", "Context", "Solution", "Resulting Context" must remain.
I typically use Pandoc to convert Markdown documents to PDF, so the Markdown should be compatible with Pandoc's requirements.

# LaTeX Documents:
When constructing LaTeX documents for the user they should use the following header:
```
\documentclass[12pt,letterpaper]{article}
\usepackage{lipsum}
\usepackage{enumerate}
\usepackage{comment}
\usepackage{datetime}
\usepackage[latin1]{inputenc}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}
\usepackage[left=1.00in, right=1.00in, top=1.00in, bottom=1.00in]{geometry}
\usepackage{gensymb}
\usepackage{imakeidx}
\usepackage[dvipsnames]{xcolor}
\usepackage[pdftex]{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,
    urlcolor=cyan,
}
% \addbibresource{$HOME/Documents/LaTeX/uni.bib}
% \usepackage[backend=biber, style=authoryear-icomp]{biblatex}
%----------------------------------------------------------
\makeatletter
\date{\today}
\author{Scott Teresi}
\title{Title}
\begin{document}
\begin{flushright}
\small
\textbf{\@author}\\
\@title\\
\@date\\
\end{flushright}

\makeatother
 %----------------------------------------------------------
\normalsize
% Text goes here
\lipsum
% \printbibliography
\end{document}
```
I typically use pdflatex to compile LaTeX documents, so the LaTeX should be compatible with pdflatex's requirements.

# Weekly Report Documents:
When constructing weekly report documents for the user they should use the following header:
```
---
colorlinks: true
output:
    pdf_document:
        pandoc_args: ["--from", "markdown+backtick_code_blocks"
        ]
---
\begin{flushright}
\textbf{Weekly Report} \\
\textbf{Author: Scott Teresi} \\
\textbf{Date: January 20th, 2023} \\
\end{flushright}
```
And the following sections:
```
# Completed work:
- Lorem ipsum
- Lorem ipsum
- Lorem ipsum

# What is blocking me:
-  Lorem impsum

# What I find difficult to do or understand:
- Lorem ipsum
    
    ```
    Here is a code block, it requires an empty line between it and surrounding text
    ```

# Things that I feel should be easier:
- Lorem ipsum

## Issues and potential solutions:
- Issue 1: [Description of issue]
  - Solution: [Description of solution]
- Issue 2: [Description of issue]
  - Solution: [Description of solution]

# What I am planning to work on and how:
- Lorem ipsum

# Missed goals from previous weeks:
- Lorem ipsum
```
Where lorem ipsum is replaced with the actual content of the report.
