import os

'''
    In `directory` recursively replace in .k format files
    in strings start with `str_starts_with` 1 occurance 
    of `str_from` to `str_to`
'''
def find_and_replace_in_directory_recursively(directory, str_starts_with, str_from, str_to):
    # Recursively traverse all files in the specified directory
    for root, dirs, files in os.walk(directory):
        for file in files:
            # Check if the file is a text file
            if file.endswith(('.k')):  # Add extensions that interest you
                file_path = os.path.join(root, file)
                try:
                    # Read the file and save lines to a list
                    with open(file_path, 'r', encoding='utf-8') as f:
                        lines = f.readlines()

                    # Open the file for writing to replace lines
                    with open(file_path, 'w', encoding='utf-8') as f:
                        for line_number, line in enumerate(lines, 1):
                            # If the line starts with "require", replace it with "requires"
                            if line.strip().startswith(str_starts_with):
                                new_line = line.replace(str_from, str_to, 1)  # Replace only the first occurrence
                                print(f"Replacement in file: {file_path}, Line {line_number}: {line.strip()} -> {new_line.strip()}")
                                f.write(new_line)
                            else:
                                f.write(line)

                except (UnicodeDecodeError, PermissionError) as e:
                    # Skip files with encoding issues or permission errors
                    print(f"Failed to read or write file {file_path}: {e}")

if __name__ == "__main__":
    import sys
    
    # Check if an argument is provided
    if len(sys.argv) < 2:
        print("Usage: python find_require.py <directory_path>")
    else:
        directory_path = sys.argv[1]  # Get the directory path from the command line argument
        find_and_replace_in_directory_recursively(directory_path, 'require ', 'require', 'requires')
        find_and_replace_in_directory_recursively(directory_path, 'import ', 'import', 'imports')
