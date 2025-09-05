/*
| Modifier                     | Instantiate?                 | Extend inside lib                                | Implement inside lib                           | Extend outside lib                             | Implement outside lib      | Mix in?                  | Notes                                                                                                                                  |
| ---------------------------- | ---------------------------- | ------------------------------------------------ | --------------------                           | ---------------------------------------------- | -------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| **class (no modifier)**      | Yes                          | Yes                                              | Yes                                            | Yes                                            | Yes                        | Yes                      | Fully open; default Dart behavior.                                                                                                     |
| **abstract class**           | No                           | Yes                                              | Yes                                            | Yes                                            | Yes                        | Yes                      | Cannot be instantiated. ([Dart][1])                                                                                                    |
| **base class**               | Yes                          | Yes (must mark subclass `base`/`final`/`sealed`) | Yes (must mark subclass `base`/`final`/`sealed`)| Yes (subclass must be `base`/`final`/`sealed`) | No                         | Yes                      | Ensures implementation reuse and safety. ([Dart][1])                                                                                   |
| **interface class**          | Yes (unless also `abstract`) | Yes (inside lib only)                            | Yes                                            | No (cannot be extended outside)                | Yes                        | Yes                      | Forces usage through `implements`, not inheritance. ([Dart][3])                                                                        |
| **abstract interface class** | No                           | Yes (inside lib only)                            | Yes                                            | No                                             | Yes                        | Yes                      | Pure interface: non-instantiable; only `implements` allowed. ([Dart][3])                                                               |
| **final class**              | Yes                          | Yes (must mark subclass `base`/`final`/`sealed`) | Yes (must mark subclass `base`/`final`/`sealed`)| No (cannot be extended)                        | No (cannot be implemented) | Yes                      | Seals the type hierarchy outside the library; inside, subclasses can exist if marked `base`/`final`/`sealed`. ([Dart][1])              |
| **sealed class**             | No (implicitly abstract)     | Yes (inside lib only)                            | Yes                                            | No                                             | No                         | Yes                      | Defines closed hierarchies for exhaustive `switch`; cannot be instantiated. ([Dart][1])                                                |
| **mixin**                    | No                           | No                                               | Yes                                            | No                                             | Yes                        | Yes (primary purpose)    | Cannot be instantiated or extended; only mixed in. Often used to share code across classes. ([Dart][1])                                |
| **mixin class**              | Yes (unless `abstract`)      | Yes                                              | Yes                                            | Yes                                            | Yes                        | Yes                      | Behaves like a normal class **and** a mixin: can be instantiated, extended, implemented, and mixed in. ([Dart][1])                      |
*/


mixin class ParentMixinClass2 {

}







mixin ParentMixinClass {
  void parentMixinMethod() {
    print("This is parent mixin method");
  }
}


class PureChildMixin with ParentMixinClass {
  void pureChildMixinMethod() {
    print("This is pure child mixin method");
  }
}

class ChildMixinClass implements ParentMixinClass , PureChildMixin {
  void childMixinMethod() {
    print("This is child mixin method");
  }
  @override
  void parentMixinMethod() {
    print("This is parent mixin method");
  }

  @override
  void pureChildMixinMethod() {
    print("This is pure child mixin method");
  }

}











sealed class ParentSealedClass {
  void parentSealedMethod() {
    print("This is parent sealed method");
  }
}

class ChildSealedClass extends ParentSealedClass {
  void childSealedMethod() {
    print("This is child sealed method");
  }
}

class ChildSealedClass2 implements ParentSealedClass {
  void childSealedMethod2() {
    print("This is child sealed method2");
  }

  @override
  void parentSealedMethod() {
    print("This is parent sealed method");
  }
}













final class ParentFinalClass {
  void parentFinalMethod() {
    print("This is parent final method");
  }
}


base class ChildFinalClass extends ParentFinalClass {
  void childFinalMethod() {
    print("This is child final method");
  }
}

base class ChildFinalClass2 implements ParentFinalClass {
  void childFinalMethod2() {
    print("This is child final method2");
  }
  @override
  void parentFinalMethod() {
    print("This is parent final method");
  }
}












abstract interface class ParentAbstractInterface {
  void abstractMethod();

  void normalMethod() {
    print("This is normal method");
  }
}

class ChildAbstractInterface extends ParentAbstractInterface {
  @override
  void abstractMethod() {
    print("This is abstract method");
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












interface class ParentInterfaceClass {
  void parentInterfaceMethod() {
    print("This is parent Interface method");
  }
}

class ChildInterfaceClass extends ParentInterfaceClass {
  void ChildInterfaceMethod() {
    print("This is parent Interface method");
  }
}

class ChildInterfaceClass2 implements ParentInterfaceClass {
  void ChildInterfaceMethod2() {
    print("This is parent Interface method2");
  }

  void parentInterfaceMethod() {
    print("This is parent Interface method");
  }
}

base class ParentBaseClass {
  void parentBaseMethod() {
    print("This is parent base method");
  }
}

base class ChildBaseClass extends ParentBaseClass {
  void childBaseMethod() {
    print("This is child base method");
  }
}

sealed class ChildBaseClass2 implements ParentBaseClass {
  void childBaseMethod2() {
    print("This is child base method2");
  }

  @override
  void parentBaseMethod() {
    print("This is parent base method");
  }
}

abstract class ParentAbstractClass {
  void abstractMethod();
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
    print("this is simple abstract child");
  }
}

class SimpleParentClass {
  SimpleClass() {
    print("this is simple parent class");
  }
}

class SimpleChildClass extends SimpleParentClass {
  SimpleChildClass() {
    print("this is simple child class");
  }
}

class SimpleChildClass2 implements SimpleParentClass {
  SimpleChildClass2() {
    print("this is simple child class");
  }

  SimpleClass() {
    print("this is simple parent class");
  }
}
