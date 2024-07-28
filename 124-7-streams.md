## Streams 
Linux streams, which are essential for handling input and output operations in Unix-like systems. Here’s a detailed look at the concepts and how to use them:
Types of Streams

### Standard Input (stdin)
File Descriptor: 0
Purpose: Used to read input. By default, stdin is connected to the keyboard.

```
Example Usage: cat < inputfile.txt reads from inputfile.txt.
```

---

### Standard Output (stdout)
File Descriptor: 1
Purpose: Used to write output. By default, stdout is connected to the terminal screen.

Example Usage:

```
echo "Hello, World!" > output.txt writes to output.txt.
```
---


### Standard Error (stderr)
File Descriptor: 2
Purpose: Used to write error messages. By default, stderr is also connected to the terminal screen.
Example Usage: 

```
ls non_existent_file 2> error.log writes the error message to error.log.
```
---

### Redirection

Redirection allows you to change the default input/output sources for commands. Common redirection operators include:

```
> Redirect stdout to a file.
Example: echo "Hello, World!" > hello.txt writes to hello.txt.
```

---

```
>> Append stdout to a file.
Example: echo "Another line" >> hello.txt appends to hello.txt.
```

---


```
    < Redirect a file to stdin.
        Example: sort < unsorted.txt reads from unsorted.txt.
```
---

```
    2> Redirect stderr to a file.
        Example: command_that_fails 2> error.log writes errors to error.log.
```    
---

```    
    2>> Append stderr to a file.
        Example: command_that_fails 2>> error.log appends errors to error.log.
```

---

### viewing commands 

---

bzcat is used to decompress files that have been compressed using the bzip2 compression algorithm.

Usage:

```
bzcat file.bz2
```

Example:

```
bzcat example.bz2
```

Details:

bzcat outputs the decompressed content to standard output (stdout).
It is equivalent to running bzip2 -dc file.bz2.

---

xzcat is used to decompress files that have been compressed using the xz compression algorithm.

Usage:

```
xzcat file.xz
```

Example:

```
xzcat example.xz
```

Details:

xzcat outputs the decompressed content to standard output (stdout).
It is equivalent to running xz -dc file.xz.



---

gzcat is a command found on some Unix-like systems (particularly macOS) and serves the same purpose as zcat.

Usage:

```
gzcat file.gz
```

Example:

```
gzcat example.gz
```

Details:

Similar to zcat, it decompresses gzip files and outputs the contents to stdout.

---

### split
The split command in Linux is used to split large files into smaller chunks. This can be particularly useful for managing large data files, transferring large files over networks, or processing files in smaller, more manageable pieces. Here’s a detailed overview of how to use the split command:
Basic Usage

```
split [OPTION] [INPUT [PREFIX]]
```

---

```
    INPUT: The input file you want to split. If omitted, split reads from standard input.
    PREFIX: The prefix for the output files. If omitted, the default prefix is x.
```

---

#### Common Options

---

Split by Size
Option: -b SIZE
Description: Split the file into pieces of a specified size.
This command splits largefile.txt into files of 1 MB each with the prefix smallfile_ (e.g., smallfile_aa, smallfile_ab, ...).


Example:

```
    split -b 1M largefile.txt smallfile_
```
---

#### Split by Number of Lines

Option: -l NUMBER
Description: Split the file into pieces with a specified number of lines.
This command splits largefile.txt into files containing 1000 lines each.

Example:

```
split -l 1000 largefile.txt smallfile_
```

---

#### Split by Number of Files

Option: -n CHUNKS
Description: Split the file into a specified number of smaller files.
This command splits largefile.txt into 5 equal-sized files.

Example:

```
split -a 3 -b 1M largefile.txt smallfile_
```

This command splits largefile.txt into 1 MB files with 3-character suffixes (e.g., smallfile_aaa, 

---

```
split -b 50M largefile.zip part_
```

This splits largefile.zip into 50 MB chunks named part_aa, part_ab, etc.

---

Splitting a File by Lines

```
split -l 5000 log.txt log_part_
```

This splits log.txt into files each containing 5000 lines named log_part_aa, log_part_ab, etc.

---


### Cut
The cut command in Linux is used for extracting sections from each line of a file or from standard input. It’s a useful tool for processing text data, such as extracting specific fields or columns from a file.

---

Description: Select specific bytes.
Example:

```
echo "Hello, World!" | cut -b 1-5
```

---


Description: Select specific characters.
Example:

```
echo "Hello, World!" | cut -c 1-5
```

---

Description: Select specific fields, typically used with a delimiter.
Example:

```
echo "apple,banana,grape" | cut -d ',' -f 2
```

---

Description: Specify the field delimiter (used with -f).
Example:
 
```
echo "apple,banana,grape" | cut -d ',' -f 2
```

---


### Sort
The sort command in Linux is used to sort lines of text files. It can sort data in a variety of ways based on numerical or lexicographical order, and it supports a wide range of options to customize the sorting behavior.


Sorts lines based on numerical value.
Example:

```
echo -e "10\n2\n33\n4" | sort -n
```

---
Sorts lines in reverse order.
Example:

```
echo -e "a\nc\nb" | sort -r
```

#### uniq
The uniq command in Linux is used to filter out repeated lines in a text file, effectively removing duplicates. It is often used in combination with sort to ensure that adjacent duplicate lines are correctly identified and removed.



---

-d: Only print duplicate lines.

```
uniq -d filename.txt
```

---

Only print unique lines.

```
uniq -u filename.txt
```

---

Ignore case when comparing lines.

```
uniq -i filename.txt
```

---

Counting Occurrences

To count the occurrences of each line

```
sort data.txt | uniq -c
```

---
