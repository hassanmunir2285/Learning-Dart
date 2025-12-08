/**
 * SEALED CLASSES - REAL USE CASES
 * 
 * PRACTICAL APPLICATIONS OF SEALED CLASSES
 * 
 * This file demonstrates real-world use cases where sealed classes
 * provide significant benefits over traditional approaches.
 * 
 * USE CASES COVERED:
 * 
 * 1. STATE MANAGEMENT:
 *    - UI state machines
 *    - Application state
 *    - Component state
 * 
 * 2. API RESPONSES:
 *    - Network request results
 *    - Success/Error handling
 *    - Loading states
 * 
 * 3. VALIDATION RESULTS:
 *    - Form validation
 *    - Input validation
 *    - Business rule validation
 * 
 * 4. EVENT HANDLING:
 *    - User events
 *    - System events
 *    - Custom events
 * 
 * 5. CONFIGURATION:
 *    - Environment configs
 *    - Feature flags
 *    - Settings
 */

void main() {
  print('=== SEALED CLASSES - REAL USE CASES ===\n');
  
  // 1. STATE MANAGEMENT
  print('--- State Management ---');
  demonstrateStateManagement();
  
  // 2. API RESPONSES
  print('\n--- API Responses ---');
  demonstrateAPIResponses();
  
  // 3. VALIDATION RESULTS
  print('\n--- Validation Results ---');
  demonstrateValidationResults();
  
  // 4. EVENT HANDLING
  print('\n--- Event Handling ---');
  demonstrateEventHandling();
  
  // 5. CONFIGURATION
  print('\n--- Configuration ---');
  demonstrateConfiguration();
}

/**
 * State Management Use Case
 */
void demonstrateStateManagement() {
  // UI State Machine
  UIState state = InitialState();
  print(renderUI(state));
  
  state = LoadingState();
  print(renderUI(state));
  
  state = SuccessState(['Item 1', 'Item 2', 'Item 3']);
  print(renderUI(state));
  
  state = ErrorState('Failed to load data');
  print(renderUI(state));
}

// Sealed class for UI state
sealed class UIState {}

class InitialState extends UIState {}
class LoadingState extends UIState {}
class SuccessState extends UIState {
  final List<String> items;
  SuccessState(this.items);
}
class ErrorState extends UIState {
  final String message;
  ErrorState(this.message);
}

String renderUI(UIState state) => switch (state) {
  InitialState() => 'Initializing...',
  LoadingState() => 'Loading...',
  SuccessState(items: var items) => 'Loaded ${items.length} items: ${items.join(", ")}',
  ErrorState(message: var msg) => 'Error: $msg',
};

/**
 * API Responses Use Case
 */
void demonstrateAPIResponses() {
  // Network response handling
  APIResponse response1 = APISuccess({'id': 1, 'name': 'John'});
  APIResponse response2 = APIError(404, 'Not Found');
  APIResponse response3 = APILoading();
  
  handleAPIResponse(response1);
  handleAPIResponse(response2);
  handleAPIResponse(response3);
}

// Sealed class for API response
sealed class APIResponse {}

class APISuccess extends APIResponse {
  final Map<String, dynamic> data;
  APISuccess(this.data);
}

class APIError extends APIResponse {
  final int statusCode;
  final String message;
  APIError(this.statusCode, this.message);
}

class APILoading extends APIResponse {}

void handleAPIResponse(APIResponse response) {
  switch (response) {
    case APISuccess(data: var data):
      print('Success: $data');
    case APIError(statusCode: var code, message: var msg):
      print('Error $code: $msg');
    case APILoading():
      print('Loading...');
  }
}

/**
 * Validation Results Use Case
 */
void demonstrateValidationResults() {
  // Form validation
  ValidationResult result1 = ValidationSuccess();
  ValidationResult result2 = ValidationError('Email is required');
  ValidationResult result3 = ValidationWarning('Password is weak');
  
  processValidation(result1);
  processValidation(result2);
  processValidation(result3);
}

// Sealed class for validation
sealed class ValidationResult {}

class ValidationSuccess extends ValidationResult {}
class ValidationError extends ValidationResult {
  final String message;
  ValidationError(this.message);
}
class ValidationWarning extends ValidationResult {
  final String message;
  ValidationWarning(this.message);
}

void processValidation(ValidationResult result) {
  switch (result) {
    case ValidationSuccess():
      print('✓ Validation passed');
    case ValidationError(message: var msg):
      print('✗ Error: $msg');
    case ValidationWarning(message: var msg):
      print('⚠ Warning: $msg');
  }
}

/**
 * Event Handling Use Case
 */
void demonstrateEventHandling() {
  // User events
  UserEvent event1 = ClickEvent('button1');
  UserEvent event2 = InputEvent('username', 'john');
  UserEvent event3 = NavigationEvent('/home');
  
  handleUserEvent(event1);
  handleUserEvent(event2);
  handleUserEvent(event3);
}

// Sealed class for events
sealed class UserEvent {}

class ClickEvent extends UserEvent {
  final String elementId;
  ClickEvent(this.elementId);
}

class InputEvent extends UserEvent {
  final String field;
  final String value;
  InputEvent(this.field, this.value);
}

class NavigationEvent extends UserEvent {
  final String route;
  NavigationEvent(this.route);
}

void handleUserEvent(UserEvent event) {
  switch (event) {
    case ClickEvent(elementId: var id):
      print('Clicked: $id');
    case InputEvent(field: var field, value: var value):
      print('Input: $field = $value');
    case NavigationEvent(route: var route):
      print('Navigating to: $route');
  }
}

/**
 * Configuration Use Case
 */
void demonstrateConfiguration() {
  // Environment configuration
  EnvironmentConfig config1 = DevelopmentConfig();
  EnvironmentConfig config2 = StagingConfig('staging-api.example.com');
  EnvironmentConfig config3 = ProductionConfig();
  
  print(getConfigInfo(config1));
  print(getConfigInfo(config2));
  print(getConfigInfo(config3));
}

// Sealed class for configuration
sealed class EnvironmentConfig {}

class DevelopmentConfig extends EnvironmentConfig {}
class StagingConfig extends EnvironmentConfig {
  final String apiUrl;
  StagingConfig(this.apiUrl);
}
class ProductionConfig extends EnvironmentConfig {}

String getConfigInfo(EnvironmentConfig config) => switch (config) {
  DevelopmentConfig() => 'Development: http://localhost:3000',
  StagingConfig(apiUrl: var url) => 'Staging: $url',
  ProductionConfig() => 'Production: https://api.example.com',
};

/**
 * ADDITIONAL REAL-WORLD EXAMPLES
 */

// Authentication State
sealed class AuthState2 {}
class SignedOut extends AuthState2 {}
class SignedIn extends AuthState2 {
  final String userId;
  final String email;
  SignedIn(this.userId, this.email);
}
class AuthExpired extends AuthState2 {}

// Payment Status
sealed class PaymentStatus {}
class PaymentPending extends PaymentStatus {}
class PaymentProcessing extends PaymentStatus {}
class PaymentCompleted extends PaymentStatus {
  final String transactionId;
  PaymentCompleted(this.transactionId);
}
class PaymentFailed extends PaymentStatus {
  final String reason;
  PaymentFailed(this.reason);
}

// File Operation Result
sealed class FileOperation {}
class FileReadSuccess extends FileOperation {
  final String content;
  FileReadSuccess(this.content);
}
class FileWriteSuccess extends FileOperation {}
class FileNotFound extends FileOperation {
  final String path;
  FileNotFound(this.path);
}
class FilePermissionDenied extends FileOperation {}

