void friday4Practice(){

simpleGenricClass();
simpleGenricFunction();
multipleTypeParameters();
genericInheritance();
genericMethodInClass();
genericCollection();
grnericVsDynamic();
genericWithCovarient();
genericExamples();

}


class Box<P> {
  P value;
  Box(this.value);

  void show() {
    print("Value: $value, Type: ${value.runtimeType}");
  }
}

void simpleGenricClass() {
  var intBox = Box<int>(10);
  intBox.show(); // Value: 10, Type: int

  var stringBox = Box<String>("Hello");
  stringBox.show(); // Value: Hello, Type: String
}

T identity<T>(T value) {
  return value;
}

void simpleGenricFunction() {
  print(identity(100));    // 100
  print(identity<String>("Hi")); // Hi
  print(identity<bool>(true));
  print(identity<double>(3.14)); // inferred as double

}

class Pair<K, V> {  // here K and V are two different type parameters of class
  K key;
  V value;

  Pair(this.key, this.value);
}

void multipleTypeParameters() {
  var pair = Pair<int, String>(1, "One");
  print("${pair.key} → ${pair.value}"); // 1 → One

  var obj = Pair<bool,double>(false, 3.14);
  print("${obj.key} and ${obj.value}"); // false → 3.14
}

class Animal {
  void sound() => print("Some sound");
}

class Dog extends Animal {
  void sound() => print("Bark");
}

class Cat extends Animal {
  void sound() => print("Meow");
}

class AnimalBox<T extends Animal> {
  T voice;
  AnimalBox(this.voice);

  void makeSound() {
    voice.sound();
  }
}

void genericInheritance() {
  var dogBox = AnimalBox<Dog>(Dog()); // same thing
  AnimalBox<Dog> dogBox1 = AnimalBox<Dog>(Dog());
  var dogBox2 = AnimalBox(Dog());
  // Dart sees: you're passing Dog()
  // So it decides: T = Dog
  // dogBox is of type AnimalBox<Dog>

  dogBox.makeSound(); // Bark

  var catBox = AnimalBox<Cat>(Cat());
  // Here, T = Cat
  catBox.makeSound(); // Meow

  var animalBox = AnimalBox(Animal());
  // Here, T = Animal
  animalBox.makeSound(); // Some sound

  // var box = AnimalBox<int>(10); ❌ ERROR: int doesn’t extend Animal
}


class Printer {
  void printItem<T>(T item) {
    print("Item: $item, Type: ${item.runtimeType}");
  }
}

void genericMethodInClass() {
  var printerObj = Printer();
  printerObj.printItem<int>(42);
  printerObj.printItem<String>("Hello");
}


void genericCollection() {
  List<int> numbers = [1, 2, 3];
  Map<String, double> prices = {"Apple": 2.5, "Banana": 1.2};
  Set<num> flags = {1, 2.5, 3};

  numbers.add(4);
  prices["Orange"] = 1.8;
  flags.add(4.6);

  print(numbers);
  print(prices);
  print(flags);

}

void grnericVsDynamic () {
  T echo<T>(T value) => value;

  dynamic echoDynamic(dynamic value) => value;

    print(echo<int>(10));         // Strongly typed
    print(echoDynamic("Hello"));  // Not type-safe
  print(echoDynamic(20));
}

class Animals {
  void sound(String name) => print('Some sound');
}

class Dogs extends Animals {
  @override
  void sound(String name1) => print('Bark');
}

// Generic Shelter
class Shelter<T extends Animals> {
  void add(covariant T animal) {
    print('Animal of type ${animal.runtimeType} added');
  }
}

// DogShelter specialized for Dogs
class DogShelter extends Shelter<Dogs> {
  @override
  void add(Dogs dog) {
    print('Dog added');
  }
}

void genericWithCovarient() {
  var animalShelter = Shelter<Animals>();
  animalShelter.add(Animals()); // ✅ Animal of type Animals added

  var dogShelter = DogShelter();
  dogShelter.add(Dogs()); // ✅ Dog added
}


class Repository<T> {
  List<T> _items = [];

  void add(T item) => _items.add(item);
  List<T> getAll() => _items;
}

class ApiResponse<T> extends Object {
  final T data;       // nullable: success will carry data, error won't
  final String? error; // nullable: error will carry a message, success won't

  // Named constructor for success
  ApiResponse.success(this.data) : error = null ;
// the expression after the colon is initializer list
  // Named constructor for error
  ApiResponse.error(this.error) : data = null as T;

  bool get isSuccess => error == null;
  bool get isError => error != null;

  @override
  String toString() => isSuccess
      ? 'ApiResponse.success(data: $data)'
      : 'ApiResponse.error(error: $error)';
}

void genericExamples(){
  var userRepo = Repository<String>();
  userRepo.add("Alice");
  userRepo.add("Bob");
  print(userRepo.getAll()); // [Alice, Bob]


  final ok = ApiResponse<int>.success(42);
  final fail = ApiResponse<int>.error('Not found');

  print(ok);   // ApiResponse.success(data: 42)
  print(fail); // ApiResponse.error(error: Not found)

  if (ok.isSuccess) {
    // data is nullable, but we know it's non-null in success case:
    print('Data: ${ok.data}'); // use ! or additional null-check
  }
}























