"""
Your description here
"""

__author__ = "John Doe"

import argparse
import os
import logging
import coloredlogs


def my_function(argument_1, argument_2):
    """
    Description of the function

    Args:
        argument_1 (type): Description of Argument_1
        argument_2 (type): Description of Argument_2

    Returns:
        my_value (type): Description of my_value
    """
    raise NotImplementedError("Function not implemented yet")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="TODO")
    parser.add_argument("input_file", type=str, help="path to input data file")
    parser.add_argument("output_file", type=str, help="path to output data file")
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="set debugging level to DEBUG"
    )

    args = parser.parse_args()
    args.input_file = os.path.abspath(args.input_file)
    args.output_file = os.path.abspath(args.output_file)

    log_level = logging.DEBUG if args.verbose else logging.INFO
    logger = logging.getLogger(__name__)
    coloredlogs.install(level=log_level)
    # ------------------------------------------------------------------

    # Start your code here
    # Checkout the logging module for debugging and general information
    # statements
    # logger.info(f"My input file is {args.input_file}")
