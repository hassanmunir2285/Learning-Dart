import 'class_practice.dart';

class SimpleChildClass extends SimpleParentClass {
  SimpleChildClass(){
    print("this is simple child class1");
  }
}

class SimpleChildClass2 implements SimpleParentClass {
  SimpleChildClass2(){
    print("this is simple child class2");
  }
  SimpleClass() {
    print("this is simple parent class1");
  }
}

class SimpleAbstractChild extends ParentAbstractClass {
  @override
  void abstractMethod() {
    print("this is simple abstract child");
  }
}

class SimpleAbstractChild2 implements ParentAbstractClass {
  @override
  void abstractMethod() {
    print("this is simple abstract child2");
  }
}

base class ChildBaseClass extends ParentBaseClass {
  void childBaseMethod() {
    print("This is child base method");
  }
}



class ChildInterfaceClass2 implements ParentInterfaceClass {
  void ChildInterfaceMethod2() {
    print("This is child Interface method2");
  }
  void parentInterfaceMethod() {
    print("This is parent Interface method");
  }
}


class ChildAbstractInterface2 implements ParentAbstractInterface {
  @override
  void abstractMethod() {
    print("This is abstract method");
  }

  @override
  void normalMethod() {
    print("This is normal method");
  }
}



void main () {
  ChildSealedClass2 obj = ChildSealedClass2();
  obj.childSealedMethod2();
  obj.parentSealedMethod();


  // ChildFinalClass2 obj = ChildFinalClass2();
  // obj.childFinalMethod2();
  // obj.parentFinalMethod();


// ChildAbstractInterface2 obj = ChildAbstractInterface2();
// obj.abstractMethod();
// obj.normalMethod();


  // ChildInterfaceClass2 obj = ChildInterfaceClass2();
  // obj.parentInterfaceMethod();
  // obj.ChildInterfaceMethod2();

// ChildBaseClass obj = ChildBaseClass();
// obj.childBaseMethod();
// obj.parentBaseMethod();
  // SimpleAbstractChild obj3 = SimpleAbstractChild();
  // SimpleAbstractChild2 obj4 = SimpleAbstractChild2();
  //
  // obj3.abstractMethod();
  // obj4.abstractMethod();
  //
  //
  // SimpleParentClass obj = SimpleParentClass();
  // SimpleChildClass obj1 = SimpleChildClass();
  // SimpleChildClass2 obj2 = SimpleChildClass2();
}