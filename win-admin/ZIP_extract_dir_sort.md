## How to extract ZIP files from Windows CMD without 3rd party software:

The **tar** command used on Windows 10 or later.

* Extract to current folder: ``` tar \-xf filename.zip```

* Extract to specific dir: ```tar \-xf filename.zip \-C C:\\path\\to\\destination```

### For PowerShell:

* Extract to specific dir:
```powershell \-command "Expand-Archive \-Path 'C:\\path\\to\\file.zip' \-DestinationPath 'C:\\path\\to\\extract'"```

### With 7-zip (third-party):

* Extract with full paths: ```7z x filename.zip```
* Extract to specific dir: ```7z x filename.zip \-oC:\\output\_folder```

### Tips:

* **Run as Admin** for protected folders such as C:\\Program Files to ensure the CMD is running with administrative privileges  
* Use double-quotes around file paths containing spaces (e.g. “C:\\My Files\\archive.zip”)  
* **List contents** before extracting with ```tar \-tf filename.zip```

## How to extract multiple zip files simultaneously with Windows CMD:

Use **tar** inside a **FOR** loop to extract every ZIP file in the current directory.

* Command: ```for %i in (\*.zip) do tar \-xf “%i”```  
* Explanation: Loops through every file ending in .zip and runs the extraction command for each

### For PowerShell:

Use the cmdlet **Expand-Archive** for various folder structures.  
This can be run as one line directly from a standard CMD window.

* Extract each to its own folder:   
```powershell \-command "Get-ChildItem \*.zip | ForEach-Object { Expand-Archive \-Path $\_.FullName \-DestinationPath ($\_.BaseName) }"```
* Extract all to current folder:   
```powershell \-command "Get-ChildItem \*.zip | ForEach-Object { Expand-Archive \-Path $\_.FullName \-DestinationPath . \-Force }"```


### With 7-zip:

Usually the fastest and most flexible method.

* Extract each to its own folder: ```for %f in (\*.zip) do 7z x “%f” \-o”%\~nf”```
* Extract all to current folder: ```7z x “\*.zip”```

### Tips:

* For batch (.bat) or CMD (.cmd) files, use double percent signs (e.g. %%i instead %i)  
* To include ZIP files in subdirectories, add the /r option to the loop (for /r %i in (\*.zip) do…)  
* Keep quotes around file variables such as “%%i”

## How to move entire directories and their contents in the Windows terminal:

Use the **move** command to transfer the entire directory tree, including all subdirectories and embedded files.

* Syntax: ```move “source\_folder” “destination\_folder”```
* Key Behavior:  
  * If the destination folder already exists, the source folder will be moved inside of it; otherwise the source folder is simply renamed to the new name  
  * To move a directory across drives (e.g. C: to D:), the robocopy command is more efficient (e.g. robocopy “source” “destination” /move /e)

### For PowerShell:

Use the **Move-Item** cmdlet (flexible for complex file structures).

* Syntax: ```Move-Item \-Path "source\_folder" \-Destination "destination\_folder"```

### For Unix-based systems (macOS, Linux, etc.):

Use the **mv** command.

* Syntax: ```mv source\_folder destination\_folder```
* The mv command is capable of recursive moving, meaning that a directories’ contents are moved by default without needing extra options

### Tips:

* To avoid overwriting files in the destination with the same name, use the /y option (suppress confirmation prompts) or /-y to prompt to user first.

## How to find a specific file name within a directory tree:

As a replacement for ```findstr```, which searches for text inside of a FILE, you can use ```dir``` or ```where```.

The **dir** command is the standard way to search for file names. Using specific flags makes it act like a search engine for your folders.  
Search for a partial name:

* ```dir /s /b \*keyword\*```
* /s: Searches the current directory and all subdirectories.  
* /b: "Bare" format; shows only the file paths without extra info like size or date.  
* \*keyword\*: Use asterisks as wildcards to find anything containing that text.

The **where** command is similar to the Linux which or find command. It is very fast and specifically designed to locate files in the system path or a specific directory.  
Search recursively from a specific path:

* ```where /r C:\\Path\\To\\Search filename.exe```
* Search with wildcards:  
* where /r . \*data\*  
  * The . represents your current folder.

### For PowerShell (Best for advanced filtering):

Use **Get-ChildItem** (aliased as **gci** or **dir**).

* Command: ```Get-ChildItem \-Recurse \-Filter "\*filename\*"```  
* Shorthand: ```gci \-r \-fi "\*keyword\*"```

### Tips:

* To use findstr logic on the list of filenames themselves, **pipe** the output of dir into findstr; this is helpful for using regular expressions to find a filename pattern  
  * Command: ```dir /s /b | findstr /i “pattern”```  
  * Explanation: This generates a list of all files and then uses findstr to filter the list for your specific pattern

## How to move files based on creation date:

### For PowerShell (Most Accurate):

Allows modification of the **CreationTime** property.

* Move files older than X days: This moves all files created more than 30 days ago to a destination folder:
```powershell \-command "Get-ChildItem \-File | Where-Object { $\_.CreationTime \-lt (Get-Date).AddDays(-30) } | Move-Item \-Destination 'C:\\Archived'"```
* Organize files into folders by year and month: This script automatically creates folders (e.g., 2025-01) based on each file's creation date and moves the file into its respective folder:
```powershell \-command "Get-ChildItem \-File | ForEach-Object { $dir \= $\_.CreationTime.ToString('yyyy-MM'); if (\!(Test-Path $dir)) { New-Item \-ItemType Directory \-Name $dir }; Move-Item $\_.FullName \-Destination $dir }```


### For CMD:

Use **forfiles**. Best for use within the standard CMD line.

* Move files created/modified more than 10 days ago:
```forfiles /p "C:\\Source" /d \-10 /c "cmd /c move @file C:\\Destination"```
* Explanation: /p specifies the search path; /d-10 selects files with a last modified date equal to or older than 10 days ago.

### Using **ROBOCOPY** (Best for moving larger numbers of files):

* Move files older than 7 days: robocopy ```"C:\\Source" "C:\\Destination" /move /minage:7```
  * /move: Deletes files from source after successfully copying to destination.  
  * /minage:\n:\ Excludes files newer than n days (effectively selects older files).  
* Move files created before a specific date (YYYYMMDD): robocopy ```"C:\\Source" "C:\\Destination" /move /minage:20241231```  
* Note that Robocopy's date filters (/MAXAGE and /MINAGE) typically reference the Last Modified date, but it is often used as a proxy for file age.

## How to make ‘FOR’ loops with several conditions:

### Logical "AND" (Nested IFs)

To execute a command only if multiple conditions are true, nest your IF statements. 

* Example: Only echo a filename if it contains "data" and is a .txt file:
```FOR %i IN (\*) DO (IF NOT "%i"=="%i:data=%" IF "%\~xi"==".txt" echo %i)```

### Logical "OR" (Sequential IFs or Flagging)

CMD evaluates each line sequentially, so to check if either condition is true, you can use separate IF statements that lead to the same action. 

* Example: Echo a filename if it is either a .zip or a .rar file:
```FOR %i IN (\*) DO (IF "%\~xi"==".zip" echo %i & IF "%\~xi"==".rar" echo %i)```

### Comparison Operators

When building these conditions, use these standard CMD comparison operators: 

* **EQU** \- Equal to  
* **NEQ** \- Not equal to  
* **LSS** \- Less than  
* **LEQ** \- Less than or equal to  
* **GTR** \- Greater than  
* **GEQ** \- Greater than or equal to

### Advanced Logic: Conditional Execution Symbols

You can also use symbols to chain commands based on success or failure: 

* **&& (AND)**: Runs the second command only if the first succeeded.  
* **|| (OR)**: Runs the second command only if the first failed

### Tip:

* If your logic is very complex, it is often better to use a Batch script (.bat or .cmd) where you can use labels and GOTO statements to handle branching logic more clearly.
