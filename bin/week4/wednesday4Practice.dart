void wednesday4Practice() {
  variablePattern();
  constantPattern();
  recordPattern();
  ListPattern();
  Restpattern();
  namedRecordsPattern();
  Mappattern();
  objectPattern();
  relationalPattern();
  wildcardPattern();
  ifElseWithCase();
  switchWithCase();
}
/*
🔹 Types of Patterns in Dart

* Dart supports several kinds of patterns:
* Variable pattern
* Constant pattern
* Record pattern
* List / Map pattern
* Object pattern
* Relational & Logical pattern
* Wildcard pattern (_)

 */

// 1) Variable Pattern

void variablePattern() {
  (String name, int age) user = ('Hassan', 28);   // record making

  var (n, a) = user; // variable pattern
  print(n); // Hassan
  print(a); // 28
  print(user);
}

// 2) Constant Pattern
void constantPattern() {
  var number = 30;

  switch (number) {
    case 10:
      print("Matched TEN!");
    case 20:
      print("Matched TWENTY!");
  }
}

// 3) Record Pattern

void recordPattern() {
  (String, int) getUser() => ('Muhammad Hassan', 28);   // positional record
  var (name, age) = getUser(); // convert into pattern
  print(name); // Hassan
  print(age); // 28
  print(getUser());
}

// 4) Named Records Pattern
void namedRecordsPattern() {
  ({String name, int age}) getUser() => (name: 'Hassan', age: 28);
  var (:name, :age) = getUser(); // record pattern with names
  print(name); // Hassan
  print(age); // 28

  // we can also write like this
  var (name: userName, age: userAge) = getUser();
  print(userName);
  print(userAge);

  final (name: String userNames, age: int userAges) = getUser();
  print(userNames);
  print(userAges);
}

// 5) List Pattern

void ListPattern() {
  var list = [1, 2, 3];
  print(list[0]);
  print(list[1]);
  print(list[2]);
  print(list);

  var [a, b, c] = list; // list pattern
  print(a); // 1
  print(b); // 2
  print(c); // 3
  print('\n');
}
// 5.a) Rest pattern

void Restpattern() {
  var list = [1, 2, 3, 4, 5, 6, 7];

  var [first, second, ...rest] = list; // list pattern applies here
  print(first); // 1
  print(second); // 2
  print(rest); // [3, 4, 5,6,7]

  var [start, ..., last] =
      list; // when you want to ignore all the middle values
  print(start); // 1
  print(last); // 7
}

/*
1 dot (.) → field access, method calls, normal usage.
2 dots (..) → cascade operator (call multiple methods on same object).
3 dots (...) → spread/rest operator (works in lists and patterns).
👉 In patterns, we only use ...  (never 2 dots).
 */

// 6) MAP PATTERN

void Mappattern() {
  var map = {"name": "Hassan", "age": 28};
  print(map["name"]); // Hassan)
  print(map["age"]); // 28
  print(map);
  print('\n');

  var {"name": n, "age": a} = map;
  print(n); // Hassan
  print(a); // 28
}

//7) Object Pattern
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}

String describe(Person p) {
  return switch (p) {
    Person(name: var n, age: > 30) => "Older person: $n",
    Person(name: "Ali", age: var a) => "This is Ali, Age: $a",
    Person(name: var n, age: <= 20) => "Younger person: $n",
    _ => "Unknown type",
  };
}

void objectPattern() {
  print(describe(Person('Hassan', 28)));
  print(describe(Person('Ali', 35)));
  print(describe(Person("Sara", 20)));
  print(describe(Person("Ali", 25)));
}

//  8) Rational / Logical Pattern
void relationalPattern() {
  int x = 5;

  switch (x) {
    case > 7 || (> 7 && < 18):
      print("Teenager"); // relational + logical pattern
    case >= 18 && <= 30: // relational + logical pattern
      print("Young Adult");
      break;
    case > 30:
      print("Adult");
    default:
      print("Child");
  }
}

// 9) Wild card pattern

void wildcardPattern() {
  (String, int, bool) user = ('Hassan', 28, true);

  var (name, _, _) = user; // ignore age & married
  print(name); // Hassan
  var (_, id, _) = user;
  print(id);
  print(user);
}

// 10) if-else with case (pattern matching)
void ifElseWithCase() {
  // var user = ('Ali', 40);
  var user = ('Hassan', 40);     // record

  if (user case ('Hassan', var age)) {      // pattern after keyword case.
    print("Hassan, Age: $age");
  } else if (user case (var name, > 30)) {
    print("Older user: $name");
  } else {
    print("Other user");
  }
}

// 11) switch with case (pattern matching)
void switchWithCase() {
  String describe(dynamic value) {
    return switch (value) {
      (String name, int age) => "Record → Name: $name, Age: $age",
      [var a, var b, ...] => "List → First: $a, Second: $b",
      {"name": var n} => "Map → Name: $n",
      _ => "Unknown type",
    };
  }

  print(describe(('Hassan', 28)));
  print(describe([1, 2, 3]));
  print(describe({"name": "Ali"}));
}
