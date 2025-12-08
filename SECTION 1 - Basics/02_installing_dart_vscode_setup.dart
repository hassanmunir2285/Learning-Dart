/**
 * INSTALLING DART & VS CODE SETUP
 * 
 * Step 1: Installing Dart SDK
 * 
 * For Windows:
 * 1. Download Dart SDK from: https://dart.dev/get-dart
 * 2. Extract the ZIP file to a location (e.g., C:\dart-sdk)
 * 3. Add Dart bin directory to PATH environment variable
 *    - Add: C:\dart-sdk\bin to your PATH
 * 4. Verify installation: Open Command Prompt and run:
 *    - dart --version
 * 
 * For macOS:
 * 1. Using Homebrew: brew install dart
 * 2. Or download from official website
 * 
 * For Linux:
 * 1. Using apt: sudo apt-get install dart
 * 2. Or download from official website
 * 
 * Step 2: Installing VS Code
 * 1. Download from: https://code.visualstudio.com/
 * 2. Install VS Code
 * 
 * Step 3: Installing Dart Extension in VS Code
 * 1. Open VS Code
 * 2. Go to Extensions (Ctrl+Shift+X or Cmd+Shift+X)
 * 3. Search for "Dart" by Dart Code
 * 4. Click Install
 * 5. Also install "Flutter" extension if you plan to use Flutter
 * 
 * Step 4: Verifying Setup
 * 1. Open VS Code
 * 2. Create a new file: hello.dart
 * 3. Write: void main() { print('Hello Dart!'); }
 * 4. Run: Press F5 or use terminal: dart hello.dart
 * 
 * Useful VS Code Shortcuts:
 * - Ctrl+Shift+P (Cmd+Shift+P on Mac): Command Palette
 * - F5: Run and Debug
 * - Ctrl+` (Cmd+` on Mac): Toggle Terminal
 * - Ctrl+Shift+` (Cmd+Shift+` on Mac): New Terminal
 */

void main() {
  print('=== Dart Installation Guide ===\n');
  
  print('1. Install Dart SDK');
  print('   - Download from: https://dart.dev/get-dart');
  print('   - Add to PATH environment variable\n');
  
  print('2. Install VS Code');
  print('   - Download from: https://code.visualstudio.com/\n');
  
  print('3. Install Dart Extension');
  print('   - Open VS Code Extensions (Ctrl+Shift+X)');
  print('   - Search for "Dart"');
  print('   - Click Install\n');
  
  print('4. Verify Installation');
  print('   - Run: dart --version');
  print('   - Should display Dart SDK version\n');
  
  print('=== Testing Your Setup ===');
  
  // Test basic Dart functionality
  String message = 'Dart is installed and working!';
  print('\n$message');
  
  // Check if we can use Dart features
  int version = 3; // Dart 3.x
  double sdkVersion = 3.0;
  bool isInstalled = true;
  
  print('\nDart Version: $version');
  print('SDK Version: $sdkVersion');
  print('Installation Status: $isInstalled');
  
  print('\n✅ Setup Complete! You are ready to learn Dart!');
}

