/**
 * FILE HANDLING: READ, WRITE IN DART
 * 
 * WHAT IS FILE HANDLING?
 * File handling allows programs to read from and write to files
 * on the file system.
 * 
 * KEY CONCEPTS:
 * 
 * 1. FILE CLASS:
 *    - Represents a file on the file system
 *    - Located in dart:io library
 *    - Can read, write, and manipulate files
 * 
 * 2. READING FILES:
 *    - readAsString(): Read entire file as string
 *    - readAsLines(): Read file as list of lines
 *    - readAsBytes(): Read file as bytes
 *    - openRead(): Stream-based reading
 * 
 * 3. WRITING FILES:
 *    - writeAsString(): Write string to file
 *    - writeAsBytes(): Write bytes to file
 *    - openWrite(): Stream-based writing
 * 
 * 4. FILE OPERATIONS:
 *    - exists(): Check if file exists
 *    - delete(): Delete a file
 *    - rename(): Rename a file
 *    - copy(): Copy a file
 *    - length: Get file size
 * 
 * IMPORTANT:
 * - File operations are asynchronous (use async/await)
 * - Always handle exceptions (file might not exist)
 * - Use try-catch for error handling
 * - Close file streams when done
 */

import 'dart:io';

void main() async {
  print('=== FILE HANDLING IN DART ===\n');
  
  // 1. WRITING TO FILE
  print('--- Writing to File ---');
  await writeToFile();
  
  // 2. READING FROM FILE
  print('\n--- Reading from File ---');
  await readFromFile();
  
  // 3. APPENDING TO FILE
  print('\n--- Appending to File ---');
  await appendToFile();
  
  // 4. READING FILE AS LINES
  print('\n--- Reading File as Lines ---');
  await readFileAsLines();
  
  // 5. FILE OPERATIONS
  print('\n--- File Operations ---');
  await fileOperations();
  
  // 6. STREAM-BASED READING
  print('\n--- Stream-based Reading ---');
  await streamBasedReading();
  
  // 7. STREAM-BASED WRITING
  print('\n--- Stream-based Writing ---');
  await streamBasedWriting();
  
  // 8. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  await practicalExamples();
}

/**
 * Write string to file
 */
Future<void> writeToFile() async {
  try {
    File file = File('example.txt');
    await file.writeAsString('Hello, Dart!\nThis is a test file.');
    print('File written successfully: example.txt');
  } catch (e) {
    print('Error writing file: $e');
  }
}

/**
 * Read string from file
 */
Future<void> readFromFile() async {
  try {
    File file = File('example.txt');
    
    if (await file.exists()) {
      String contents = await file.readAsString();
      print('File contents:');
      print(contents);
    } else {
      print('File does not exist');
    }
  } catch (e) {
    print('Error reading file: $e');
  }
}

/**
 * Append to file
 */
Future<void> appendToFile() async {
  try {
    File file = File('example.txt');
    
    // Open file in append mode
    IOSink sink = file.openWrite(mode: FileMode.append);
    sink.write('\nThis line is appended.');
    sink.write('\nAnother appended line.');
    await sink.close();
    
    print('Content appended successfully');
    
    // Read to verify
    String contents = await file.readAsString();
    print('Updated file contents:');
    print(contents);
  } catch (e) {
    print('Error appending to file: $e');
  }
}

/**
 * Read file as lines
 */
Future<void> readFileAsLines() async {
  try {
    File file = File('example.txt');
    
    if (await file.exists()) {
      List<String> lines = await file.readAsLines();
      print('File has ${lines.length} lines:');
      for (int i = 0; i < lines.length; i++) {
        print('Line ${i + 1}: ${lines[i]}');
      }
    }
  } catch (e) {
    print('Error reading file as lines: $e');
  }
}

/**
 * File operations (exists, delete, rename, copy)
 */
Future<void> fileOperations() async {
  try {
    File file = File('example.txt');
    
    // Check if file exists
    bool exists = await file.exists();
    print('File exists: $exists');
    
    if (exists) {
      // Get file information
      int size = await file.length();
      print('File size: $size bytes');
      
      // Get file path
      print('File path: ${file.path}');
      print('File absolute path: ${file.absolute.path}');
      
      // Copy file
      File copiedFile = await file.copy('example_copy.txt');
      print('File copied to: ${copiedFile.path}');
      
      // Rename file
      File renamedFile = await copiedFile.rename('example_renamed.txt');
      print('File renamed to: ${renamedFile.path}');
      
      // Delete copied file
      await renamedFile.delete();
      print('Copied file deleted');
    }
  } catch (e) {
    print('Error in file operations: $e');
  }
}

/**
 * Stream-based reading (for large files)
 */
Future<void> streamBasedReading() async {
  try {
    File file = File('example.txt');
    
    if (await file.exists()) {
      print('Reading file using stream:');
      Stream<List<int>> inputStream = file.openRead();
      
      await for (var data in inputStream) {
        String text = String.fromCharCodes(data);
        print(text);
      }
    }
  } catch (e) {
    print('Error in stream reading: $e');
  }
}

/**
 * Stream-based writing
 */
Future<void> streamBasedWriting() async {
  try {
    File file = File('stream_example.txt');
    IOSink sink = file.openWrite();
    
    sink.write('Line 1\n');
    sink.write('Line 2\n');
    sink.writeln('Line 3'); // writeln adds newline
    sink.writeAll(['Line 4\n', 'Line 5\n']);
    
    await sink.flush(); // Ensure data is written
    await sink.close();
    
    print('File written using stream');
  } catch (e) {
    print('Error in stream writing: $e');
  }
}

/**
 * Practical examples
 */
Future<void> practicalExamples() async {
  // Example 1: Write user data to file
  await writeUserData();
  
  // Example 2: Read and process CSV-like data
  await processCSVData();
  
  // Example 3: File logger
  await fileLogger();
}

/**
 * Example 1: Write user data
 */
Future<void> writeUserData() async {
  try {
    File file = File('users.txt');
    List<Map<String, dynamic>> users = [
      {'name': 'Alice', 'age': 25, 'email': 'alice@example.com'},
      {'name': 'Bob', 'age': 30, 'email': 'bob@example.com'},
      {'name': 'Charlie', 'age': 35, 'email': 'charlie@example.com'},
    ];
    
    StringBuffer buffer = StringBuffer();
    for (var user in users) {
      buffer.writeln('${user['name']},${user['age']},${user['email']}');
    }
    
    await file.writeAsString(buffer.toString());
    print('User data written to file');
  } catch (e) {
    print('Error writing user data: $e');
  }
}

/**
 * Example 2: Process CSV-like data
 */
Future<void> processCSVData() async {
  try {
    File file = File('users.txt');
    
    if (await file.exists()) {
      List<String> lines = await file.readAsLines();
      print('Processing ${lines.length} users:');
      
      for (String line in lines) {
        List<String> parts = line.split(',');
        if (parts.length == 3) {
          String name = parts[0];
          int age = int.parse(parts[1]);
          String email = parts[2];
          
          print('User: $name, Age: $age, Email: $email');
        }
      }
    }
  } catch (e) {
    print('Error processing CSV data: $e');
  }
}

/**
 * Example 3: File logger
 */
Future<void> fileLogger() async {
  try {
    File logFile = File('app.log');
    DateTime now = DateTime.now();
    
    String logEntry = '[${now.toString()}] INFO: Application started\n';
    
    if (await logFile.exists()) {
      // Append to existing log
      IOSink sink = logFile.openWrite(mode: FileMode.append);
      sink.write(logEntry);
      await sink.close();
    } else {
      // Create new log file
      await logFile.writeAsString(logEntry);
    }
    
    print('Log entry written');
  } catch (e) {
    print('Error writing log: $e');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Read file as bytes
Future<void> readFileAsBytes() async {
  try {
    File file = File('example.txt');
    List<int> bytes = await file.readAsBytes();
    print('File size in bytes: ${bytes.length}');
  } catch (e) {
    print('Error: $e');
  }
}

// Write file as bytes
Future<void> writeFileAsBytes() async {
  try {
    File file = File('binary.bin');
    List<int> bytes = [72, 101, 108, 108, 111]; // "Hello" in ASCII
    await file.writeAsBytes(bytes);
    print('Binary file written');
  } catch (e) {
    print('Error: $e');
  }
}

// Check file permissions
Future<void> checkFilePermissions() async {
  try {
    File file = File('example.txt');
    
    if (await file.exists()) {
      // Get file stat
      FileStat stat = await file.stat();
      print('File type: ${stat.type}');
      print('File size: ${stat.size} bytes');
      print('Modified: ${stat.modified}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// Directory operations
Future<void> directoryOperations() async {
  try {
    Directory dir = Directory('test_dir');
    
    // Create directory
    if (!await dir.exists()) {
      await dir.create();
      print('Directory created: ${dir.path}');
    }
    
    // List directory contents
    List<FileSystemEntity> entities = dir.listSync();
    print('Directory contains ${entities.length} items');
    
    // Delete directory
    // await dir.delete(recursive: true);
    // print('Directory deleted');
  } catch (e) {
    print('Error: $e');
  }
}

