void fridayPractice() {
  int y1 = 20;
  print(y1);
  print(10.runtimeType); // int
  print("Hello".runtimeType); // String

  Object x = "Hello"; // Works
  Object y = 123; // Works
  print(x);
  print(x.runtimeType);
  print(y);
  print(y.runtimeType);

  BankAccount account1 = BankAccount("Ali", 1000);
  BankAccount account2 = BankAccount("Sara", 500);

  // Using the methods
  account1.checkBalance();
  account1.deposit(200);
  account1.withdraw(1500);
  account1.withdraw(300);

  print(""); // line break

  account2.checkBalance();
  account2.deposit(100);
  account2.withdraw(50);
}




// A simple Bank Account system in Dart

class BankAccount {
  String owner;
  double balance;

  // Constructor
  BankAccount(this.owner, this.balance);

  // Deposit money
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("$owner deposited \$${amount}. New balance: \$${balance}");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("$owner withdrew \$${amount}. Remaining balance: \$${balance}");
    } else if (amount > balance) {
      print("Insufficient funds. Current balance: \$${balance}");
    } else {
      print("Withdrawal amount must be positive.");
    }
  }

  // Check balance
  void checkBalance() {
    print("Account Holder: $owner, Balance: \$${balance}");
  }
}


