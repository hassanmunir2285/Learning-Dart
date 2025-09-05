void monday4Practice(){

  print(describe(Unauthenticated()));         // 👉 Please sign in
  print(describe(Loading()));                 // 👉 Loading…
  print(describe(Authenticated( username: 'Hassan')));   // 👉 Welcome, Hassan!
  print(describe(AuthError("Invalid token"))); // 👉 Error: Invalid token

  print(describe2(Unauthenticated()));                 // 👉 Please sign in
  print(describe2(Loading()));                         // 👉 Loading…
  print(describe2(Authenticated(username: 'admin')));  // 👉 doAdminThing()
  print(describe2(Authenticated(username: 'Hassan'))); // 👉 doUserThing()
  print(describe2(AuthError("Invalid token")));        // 👉 Error: Invalid token




  int? ali ;
  int? asif;
  asif =5;
  ali = asif;
  print(ali);
}

/*
| Modifier                     | Instantiate?                 | Extend inside lib                                | Implement inside lib | Extend outside lib                             | Implement outside lib      | Notes                                                                                                                                  |
| ---------------------------- | ---------------------------- | ------------------------------------------------ | -------------------- | ---------------------------------------------- | -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| **class (no modifier)**      | Yes                          | Yes                                              | Yes                  | Yes                                            | Yes                        | Fully open; default Dart behavior.                                                                                                     |
| **abstract class**           | No                           | Yes                                              | Yes                  | Yes                                            | Yes                        | Cannot be instantiated. ([Dart][1])                                                                                                    |
| **base class**               | Yes                          | Yes (must mark subclass `base`/`final`/`sealed`) | Yes                  | Yes (subclass must be `base`/`final`/`sealed`) | No                         | Ensures implementation reuse and safety. ([Dart][1])                                                                                   |
| **interface class**          | Yes (unless also `abstract`) | Yes (inside lib only)                            | Yes                  | No (cannot be extended outside)                | Yes                        | Forces usage through `implements`, not inheritance. ([Stack Overflow][2], [Dart][3], [Medium][4])                                      |
| **abstract interface class** | No                           | Yes (inside lib only)                            | Yes                  | No                                             | Yes                        | Pure interface: non-instantiable; only `implements` allowed. ([Stack Overflow][2])                                                     |
| **final class**              | Yes                          | Yes (inside lib only)                            | Yes                  | No (cannot be extended)                        | No (cannot be implemented) | Seals the type hierarchy outside the library; inside, subclasses can exist if marked `base`/`final`/`sealed`. ([Dart][1], [Medium][5]) |
| **sealed class**             | No (implicitly abstract)     | Yes (inside lib only)                            | Yes                  | No                                             | No                         | Defines closed hierarchies for exhaustive `switch`; cannot be instantiated. ([Dart][1], [Stack Overflow][6])                           |

 */

// dart >= 3.0
sealed class AuthState {}

class Unauthenticated extends AuthState {}
class Loading extends AuthState {}
class Authenticated extends AuthState {
  final String username;
  Authenticated({required this.username});
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// Use a switch expression that destructures object fields.
String describe(AuthState s) {
  return switch (s) {
    Unauthenticated() => 'Please sign in',
    Loading() => 'Loading…',
    Authenticated(username: var username) => 'Welcome, $username!',
    AuthError(message: var message) => 'Error: $message',
  };
}

String describe1(AuthState s) {
  switch (s) {
    case Unauthenticated():
      return 'Please sign in';
    case Loading():
      return 'Loading…';
    case Authenticated(username: var username):
      return 'Welcome, $username!';
    case AuthError(message: var message):
      return 'Error: $message';
  }
}

String describe2(AuthState s) => switch (s) {
  Authenticated(username: var username) when username == 'admin' => 'doAdminThing()',
  Authenticated(username: var username) => 'user is authenticated as $username',
  Unauthenticated() => 'Please sign in',
  Loading() => 'Loading…',
  AuthError(message: var message) => 'Error: $message',
};

