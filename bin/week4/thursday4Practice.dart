
void thursday4Practice(){

//   var num  ;   // data types changes to dynamic
//   print(num);
//
//   num =1;
//   print(num.runtimeType);
//
//   num = true;
// print(num);
//
// dynamic a = "Hassan";
//   print(a.runtimeType);
//   print(a.toUpperCase());
//
//   Object b = "Munir";
//   print(b.runtimeType);
  // print(b.toUpperCase());

    Object x = 'Dart';
    print(x.toString());     // ✅ Always safe (non-null)

    Object? y = 'Lang';
     print(y.toString());  // ❌ Not allowed: y could be null
    print(y.toString());    // ✅ Null-aware call → String?
    print(y.hashCode);      // ✅ Null-aware access → int?

    y = null;
    print(y?.toString() ?? 'was null'); // ✅ "was null"

      Object a = 'Hi';   // String
      a = 42;            // int
       // a = null;       // ❌ Error: Object is non-nullable
    print(a);

      Object? b = 'Hello';
      b = null;          // ✅ OK
  print(b);

    Object? z = null;
    print(z == 5);  // ✅ false, no crash
  print(z == null);

  z=5;
  print(z);


    Object obj = "123456";

    var str = obj as String; // cast to String
    print(str.toUpperCase());

  // var num = obj as int; // ❌ Runtime error: not an int
  print(num);
    Object? value = 'HELLO';

    if (value is String) {
      // Smart-cast: inside this block value is a String (non-null)
      print(value.toLowerCase());
    }

    value = 3.14537878;
    // print(value.toStringAsFixed(1)); // ❌ Not allowed: static type is Object?
    print((value as double).toStringAsFixed(3)); // ✅ Cast, then call

}


class Person {
   String? name; // declared but not initialized now


  void setName(String newName) {
    name = newName; // initialized later
  }

  void greet() {
    print("Hello, my name is $name");
  }
}