import re
import sys

# Get input string from command line arguments
input_str = ' '.join(sys.argv[1:])

# Perform regex search and replace
output_str = re.sub(r'\b[w]\b', '(work)', input_str)

# Return output string to batch script
print(output_str)
