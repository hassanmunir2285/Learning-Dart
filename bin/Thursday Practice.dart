void thurdayPractice() {
  int x = 2;
  print(x);

  if (true) {
    print(x);
    int y = 3;
    print(y);
  }
  // print(y) ;

  // condition ? exp1 : exp 2

  int a = 4;
  int b = 5;

  if (a > b) {
    print('greater value is $a');
  } else {
    print('smaller value is $b');
  }

  // now in conditional we write it as below

  a > b ? print('greater value is $a') : print('smaller value is $b');

  String name = 'Tom';

  String nameToPrint = name ?? 'Guest user';
  print('nameToPrint $name');

  // For loop ( find even number between 1 to 10.

  // for (int i = 1; i <= 10; i++) {
  //   if (i % 2 == 0) {}
  // }

  void main2() {
    int outerVar = 5;

    void innerFunction() {
      print(outerVar); // ✅ can access outerVar
    }

    innerFunction();
  }

  main2();
}


void main() {
  List<int> numbers = [2, 4, 3, 7, 5, -1, 0, 2, 4];
  int target = 6;

  findPairsWithSum(numbers, target);
}

void findPairsWithSum(List<int> nums, int target) {
  Set<int> seen = {};
  Set<String> uniquePairs = {};

  for (int num in nums) {
    int complement = target - num;

    if (seen.contains(complement)) {
      // Sort the pair so [2,4] and [4,2] are treated the same
      List<int> pair = [num, complement]..sort();
      String pairKey = pair.join(',');

      uniquePairs.add(pairKey);
    }

    seen.add(num);
  }

  print("Pairs with sum $target:");
  for (String pairStr in uniquePairs) {
    print("[${pairStr.replaceAll(',', ', ')}]");
  }
}

