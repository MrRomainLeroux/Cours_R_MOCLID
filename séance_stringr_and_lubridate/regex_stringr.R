# Load necessary libraries
library(stringr)

# ==================================================================================================================================
# Introduction to Regular Expressions (Regex)
# ==================================================================================================================================

# Regular expressions (or "regex") are sequences of characters that allow you to search and manipulate text in a very flexible way.

# They are useful for common tasks such as:

# - Validating formats (emails, phone numbers)
# - Extracting specific data (dates, codes, etc.)
# - Transforming or cleaning data (replacing text, splitting)

# Tips for Getting Started
# Test your regex online: Use regex101.com to see how it works live.
# Start with str_detect() before using str_extract() or str_replace().
# If you're searching for . or *, use \\. and \\*.

# ==================================================================================================================================

# Example of Search with str_detect()
# str_detect() checks if a pattern exists in a string
# Example search: "a.c" means "a" followed by any character then "c"
# Syntax Explanation:
# "a.c" will match "a" followed by any character (except newline) and then "c".
print(str_detect("ahbg.ggbc", "a.......c"))  # TRUE because "a" followed by any character then "c"
print(str_detect("abc", "a.b"))  # TRUE because "a" followed by "b" then "c"

# Example of Extraction with str_extract()
# str_extract() extracts the first matching pattern from a string
# Example: extract the first digit found in a string
# Syntax Explanation: "\\d" is a shorthand for any digit (0-9).
print(str_extract("R2D2", "\\d"))  # "2", extracts the first digit

# Example of Replacement with str_replace()
# str_replace() replaces the first matching pattern in a string
# Example: replace digits with "XX" in a sentence
# Syntax Explanation: "\\d+" matches one or more digits.
print(str_replace("The price is 99€", "\\d+", "XX"))  # "The price is XX€"

# Example of Splitting with str_split()
# str_split() splits a string based on a pattern
# Example: split the sentence by spaces ("\\s+")
# Syntax Explanation: "\\s+" matches one or more spaces or whitespace characters.
print(str_split("Hello world", "\\s+"))  # List: ["Hello", "world"]

# Basic Symbols in Regex
# . : Matches any character except a newline
# ^ : Start of the string
# $ : End of the string
# * : 0 or more repetitions of the pattern
# + : 1 or more repetitions of the pattern
# ? : 0 or 1 repetition of the pattern
# [] : Matches any character within the brackets
# | : OR logic, to test multiple patterns

# Examples of search using basic symbols
# Syntax Explanation: Each of the following patterns uses a basic regex symbol.
print(str_detect("abc", "a.c"))  # TRUE, "a" followed by any character then "c"
print(str_detect("hello", "^h"))  # TRUE, "^h" means the string starts with "h"
print(str_detect("hello", "o$"))  # TRUE, "o$" means the string ends with "o"
print(str_detect("baaaa", "ba*"))  # TRUE, "ba*" means "ba" followed by zero or more "a"s
print(str_detect("baaaa", "ba+"))  # TRUE, "ba+" means "ba" followed by one or more "a"s
print(str_detect("color", "colou?r"))  # TRUE, "color" or "colour" (with or without "u")
print(str_detect("chat", "[ch]at"))  # TRUE, "chat" or "hat" (either "c" or "h" at the start)
print(str_detect("dog", "cat|dog"))  # TRUE, either "cat" or "dog"

# Character Classes in Regex
# \d : A digit (0-9)
# \D : Anything except a digit
# \w : A letter, digit, or "_"
# \W : Anything except a letter, digit, or "_"
# \s : Space, tab, newline
# \S : Anything except a space

# Examples of extraction with character classes
# Syntax Explanation: Each example uses a character class to match specific character types.
print(str_extract("R2D2", "\\d"))  # "2", extracts the first digit (\d means digit)
print(str_extract("R2D2", "\\D"))  # "R", extracts the first non-digit (\D means not a digit)
print(str_extract("user_123", "\\w+"))  # "user_123", extracts word characters (letters, digits, or "_")
print(str_extract("a@b", "\\W"))  # "@", extracts the first non-word character (\W means not a letter, digit, or "_")
print(str_detect("a b", "a\\sb"))  # TRUE, "\\s" means space between "a" and "b"
print(str_extract("a b", "\\S"))  # "a", extracts the first non-space character (\S means not a space)

# Quantifiers in Regex
# {n} : Exactly n times
# {n,} : n or more times
# {n,m} : Between n and m times

# Examples with quantifiers
# Syntax Explanation: Quantifiers define how many times a pattern should repeat.
print(str_detect("aaa", "a{3}"))  # TRUE, exactly 3 "a"s
print(str_detect("aaaa", "a{3,}"))  # TRUE, 3 or more "a"s
print(str_detect("aaa", "a{2,4}"))  # TRUE, between 2 and 4 "a"s

# Groups and Captures in Regex
# ( ) : Capturing group to extract multiple parts of a string
# Syntax Explanation: (\\d{4}) captures a group of four digits (year), and (\\d{2}) captures two digits (month).
print(str_match("2023-04-15", "(\\d{4})-(\\d{2})"))  # ["2023", "04"], captures year and month

# Practical Examples with stringr
# Extract emails
emails = c("test@example.com", "contact@domain.org", "invalid")
# Syntax Explanation: "\\w+@\\w+\\.\\w+" matches a basic email pattern.
print(str_extract(emails, "\\w+@\\w+\\.\\w+"))
# Result: "test@example.com" "contact@domain.org" NA (for invalid case)

# Find phone numbers
phones = c("+33 6 12 34 56 78", "01 23 45 67 89", "invalid")
# Syntax Explanation: "\\+?\\d[\\d ]+" matches an optional "+" followed by a digit, and then one or more digits or spaces.
print(str_extract(phones, "\\+?\\d[\\d ]+"))
# Result: "+33 6 12 34 56 78" "01 23 45 67 89" NA

# Replace digits
# Syntax Explanation: "\\d+" matches one or more digits, replacing them with "XX".
print(str_replace_all("The price is 99€", "\\d+", "XX"))
# Result: "The price is XX€"

# Split a sentence into words
# Syntax Explanation: "\\s+" splits the string by spaces or whitespace.
print(str_split("Hello world", "\\s+"))
# Result: List: ["Hello", "world"]

# Tips for Getting Started
# Test your regex online: Use regex101.com to see how it works live.
# Start simple with str_detect() before using str_extract() or str_replace().
# If you're looking for . or *, use \\. and \\*.

# Optimizations
# Use fixed() for simple patterns to make them faster (no complex regex)
# Syntax Explanation: fixed() tells R to search for the literal pattern without interpreting regex symbols.
print(str_detect("abc", fixed("a.c")))  # FALSE, faster than using regex

# Exercise: Extract French postal codes
addresses = c("75001 Paris", "2 rue de Lyon 69002", "Invalid")
# Syntax Explanation: "\\b\\d{5}\\b" matches exactly 5 digits as a whole word (\\b represents word boundaries).
postal_codes = str_extract(addresses, "\\b\\d{5}\\b")
print(postal_codes)  # Result: "75001" "69002" NA

# Lookaheads allow you to search for a pattern followed by another without including the second pattern in the match
# Example: Find a digit followed by "kg" without including "kg" in the match
# Syntax Explanation: "(?=kg)" is a lookahead assertion that checks for "kg" after the digit, without including it.
print(str_extract("3kg", "\\d(?=kg)"))  # "3"
