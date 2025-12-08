/**
 * WORKING WITH APIs (HTTP REQUESTS) IN DART
 * 
 * WHAT IS AN API?
 * API (Application Programming Interface) is a way for applications
 * to communicate with each other over HTTP.
 * 
 * KEY CONCEPTS:
 * 
 * 1. HTTP METHODS:
 *    - GET: Retrieve data
 *    - POST: Create new resource
 *    - PUT: Update entire resource
 *    - PATCH: Partial update
 *    - DELETE: Delete resource
 * 
 * 2. HTTP PACKAGE:
 *    - Official Dart package for HTTP requests
 *    - Add to pubspec.yaml: http: ^1.1.0
 *    - Import: import 'package:http/http.dart' as http;
 * 
 * 3. HTTP REQUESTS:
 *    - http.get(): GET request
 *    - http.post(): POST request
 *    - http.put(): PUT request
 *    - http.delete(): DELETE request
 *    - All return Future<Response>
 * 
 * 4. RESPONSE HANDLING:
 *    - statusCode: HTTP status code (200, 404, 500, etc.)
 *    - body: Response body (usually JSON string)
 *    - headers: Response headers
 * 
 * 5. JSON PARSING:
 *    - Use dart:convert for JSON
 *    - jsonDecode(): Parse JSON string to Map
 *    - jsonEncode(): Convert Map to JSON string
 * 
 * NOTE: This example uses dart:io HttpClient for demonstration.
 * In real projects, use the 'http' package from pub.dev
 */

import 'dart:io';
import 'dart:convert';

void main() async {
  print('=== WORKING WITH APIs (HTTP REQUESTS) ===\n');
  
  // Note: These examples use dart:io HttpClient
  // For production, use 'http' package: import 'package:http/http.dart' as http;
  
  print('--- HTTP Request Concepts ---');
  demonstrateHttpConcepts();
  
  print('\n--- Making HTTP Requests ---');
  await demonstrateHttpRequests();
  
  print('\n--- JSON Parsing ---');
  demonstrateJsonParsing();
  
  print('\n--- Error Handling ---');
  await demonstrateErrorHandling();
}

/**
 * Demonstrate HTTP concepts
 */
void demonstrateHttpConcepts() {
  print('''
HTTP Methods:
- GET: Retrieve data (read-only)
- POST: Create new resource
- PUT: Update entire resource
- DELETE: Remove resource
- PATCH: Partial update

HTTP Status Codes:
- 200: OK (success)
- 201: Created
- 400: Bad Request
- 401: Unauthorized
- 404: Not Found
- 500: Internal Server Error
''');
}

/**
 * Demonstrate HTTP requests using dart:io
 * Note: In production, use 'http' package
 */
Future<void> demonstrateHttpRequests() async {
  try {
    // Example: GET request
    print('--- GET Request ---');
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.getUrl(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1')
    );
    HttpClientResponse response = await request.close();
    
    if (response.statusCode == HttpStatus.ok) {
      String responseBody = await response.transform(utf8.decoder).join();
      print('Status Code: ${response.statusCode}');
      print('Response: $responseBody');
      
      // Parse JSON
      Map<String, dynamic> json = jsonDecode(responseBody);
      print('Parsed JSON - Title: ${json['title']}');
    } else {
      print('Error: Status code ${response.statusCode}');
    }
    
    client.close();
  } catch (e) {
    print('Error making request: $e');
  }
}

/**
 * Demonstrate JSON parsing
 */
void demonstrateJsonParsing() {
  String jsonString = '{"id": 1, "name": "John", "email": "john@example.com"}';
  
  // Parse JSON to Map
  Map<String, dynamic> user = jsonDecode(jsonString);
  print('Parsed: ${user['name']}, ${user['email']}');
  
  // Convert Map to JSON
  String encoded = jsonEncode(user);
  print('Encoded: $encoded');
}

/**
 * Demonstrate error handling in HTTP requests
 */
Future<void> demonstrateErrorHandling() async {
  try {
    HttpClient client = HttpClient();
    
    // Example with error handling
    try {
      HttpClientRequest request = await client.getUrl(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/999')
      );
      HttpClientResponse response = await request.close();
      
      if (response.statusCode == HttpStatus.ok) {
        String body = await response.transform(utf8.decoder).join();
        print('Success: $body');
      } else {
        print('Error: HTTP ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('Network error: $e');
    } on HttpException catch (e) {
      print('HTTP error: $e');
    } catch (e) {
      print('Unexpected error: $e');
    } finally {
      client.close();
    }
  } catch (e) {
    print('Error: $e');
  }
}

/**
 * NOTE: For production, use 'http' package from pub.dev
 * Add to pubspec.yaml: http: ^1.1.0
 * Then: import 'package:http/http.dart' as http;
 * 
 * Example:
 * final response = await http.get(Uri.parse('https://api.example.com/data'));
 * if (response.statusCode == 200) {
 *   Map<String, dynamic> data = jsonDecode(response.body);
 * }
 */

/**
 * API CLIENT CLASS EXAMPLE
 * Simple wrapper class for HTTP requests
 */
class ApiClient {
  final String baseUrl;
  ApiClient(this.baseUrl);
  
  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse('$baseUrl$endpoint'));
      HttpClientResponse response = await request.close();
      
      if (response.statusCode == HttpStatus.ok) {
        String body = await response.transform(utf8.decoder).join();
        return jsonDecode(body);
      } else {
        throw HttpException('HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      rethrow;
    }
  }
}

/**
 * JSON MODEL EXAMPLE
 */
class User {
  final int id;
  final String name;
  final String email;
  
  User({required this.id, required this.name, required this.email});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
  
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}

/**
 * BEST PRACTICES
 */
void demonstrateBestPractices() {
  print('''
Best practices for working with APIs:

1. Use async/await for HTTP requests
2. Always handle errors (try-catch)
3. Check status codes
4. Parse JSON safely
5. Use models/classes for JSON data
6. Handle network timeouts
7. Cache responses when appropriate
8. Use proper HTTP headers
9. Validate API responses
10. Use environment variables for API keys
''');
}

