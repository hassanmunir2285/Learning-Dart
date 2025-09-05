void tuesday4Practice() {
  records1();
  records2();
  records3();
  records4();
  reutnFunction();
  records();
  positionalRecords();
  namedRecords();
  mixedRecords();
  destructuringRecords();

}

//  ******* Records in Dart 3 **********

// 9) Destructuring Records with field names in functions
(  String , { int age}) getUsers() {
  return ('ali khan', age: 234568);
}


void destructuringRecords() {
  var (name, :age) = getUsers(); // destructuring with field names
  print(name); // Hassan
  print(age); // 28
  print(getUsers());

}

// 8) Mixed Records (positional + named)
void mixedRecords() {
  (String, {int age, bool isMarried}) record = (
    'Hassan',
    age: 28,
    isMarried: false,
  );

  print(record.$1); // Hassan
  print(record.age); // 28
  print(record.isMarried); // false
  print(record);
}

// 7) Named Records
void namedRecords() {
  ({String name, int age, bool isMarried}) user = (
    name: 'Hassan Munir',
    age: 28,
    isMarried: true,
  );

  print(user.name); // hassan munir
  print(user.age); // hassan munir
  print(user.isMarried); // hassan munir
  print(user);
}

// 6) Positional Records
void positionalRecords() {
  (String, int, bool) user = ('Hassan', 25, true);

  print(user.$1); // Hassan
  print(user.$2); // 25
  print(user.$3); // true
  print(user);
}

// 5) Simple Records
void records() {
  var record = ('Hassan', 25, true, 3, "ali", false);
  print(record.$1); // Hassan
  print(record.$2); // 25
  print(record.$3);
  print(record);
}

// 4) Destructuring Records
void records4() {
  var (name, age, isMarried) = ("Ali", 22, false); // unpack values
  print(name); // Ali
  print(age); // 22
  print(isMarried);
}

// 3) Mixed (positional + named)
(String, {int age}) getData() {
  return ("Munir", age: 64);
}

void records3() {
  var data = getData();
  print(data.$1); // Munir
  print(data.age); // 64
  print(data);   // ("Munir", age: 64)
  print(getData());  // ("Munir", age: 64)
}

// 2) Named fields in Records
({String name, int age}) getUserDetails() {
  return (name: "Alexa", age: 50);
}

void records2() {
  var user = getUserDetails();
  print(user.name); // Hassan
  print(user.age); // 25
  print(user);
}

// 1) Function returning multiple values (positional records)
(String, int, bool) getUser() {
  return ("Hassan", 28, true);
}

// When return type is List, Set, Map
List<dynamic> getUser1() {
  List<dynamic> hamzaData = ["Hassan", 25, true];
  return hamzaData ;
}

Set<dynamic> getUser2() {
  return {"Maryam", 26, true, 26};
}

Map<dynamic, dynamic> getUser3() {
  return {5.11: "height", "age": 25, "isMarried": true, "age": 25};
}

// When return type is int, String, void
int User4() {
  return 20;
}

String User5() {
  String name1 = "Ali";
  print(name1);
  int number = 5;
  return name1;
}

bool User6() {
  return true;
}

// When return type is class
class Person extends Object { // by default extends Object class
  String name;
  int age;
  bool isMarried;

  Person(this.name, this.age, this.isMarried);

  @override
  String toString() {
    return 'Person(name: $name, age: $age, isMarried: $isMarried)';
  }
}

Person funName() {
  // Function whose return type is class
  return Person('kashif', 21, true);
}

void reutnFunction() {
  var person1 = funName();
  Person obj = funName();
  print(obj);
  print(obj.hashCode);
  print(person1.name); // kashif
  print(person1.age); // 21
  print(person1.isMarried); // true
  print(funName());
}

void records1() {
  var user = getUser();
  print(user.$1); // Hassan (first value)
  print(user.$2); // 25     (second value)
  print(user.$3);
  print(getUser());

  List user1 = getUser1();
  print(user1[0]);
  print(user1[1]);
  print(user1[2]);
  print(getUser1());
  print(user1);

  Set user2 = getUser2();
  user2.forEach((item) => print('Items of set are: $item'));
  print(getUser2());

  Map user3 = getUser3();
  print(user3[5.11]);
  print(user3["age"]);
  print(user3["isMarried"]);
  print(user3["age"]);

  print(getUser3());
  print(User4());
  print(User5());
}
