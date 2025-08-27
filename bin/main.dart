
// import 'week2/fridayPractice.dart';
// import 'week2/tuesday .practice.dart';
// import 'week2/wednesdayPractice.dart';
// import 'week2/thursdayPractice.dart';
// import 'week2/saturdayPractice.dart';
// import 'week2/sundayPractice.dart';
import 'week3/tuesdayPractice.dart';
import 'week3/wednesday3Practice.dart';

void diamondPattern(int n) {
  // top pyramid
  for (int i = 1; i <= n; i++) {
    String row = "";
    for (int j = 1; j <= n - i; j++) {
      row += " ";
    }
    for (int k = 1; k <= (2 * i - 1); k++) {
      row += "*";
    }
    print(row);
  }
  // bottom inverted pyramid
  for (int i = n - 1; i >= 1; i--) {
    String row = "";
    for (int j = 1; j <= n - i; j++) {
      row += " ";
    }
    for (int k = 1; k <= (2 * i - 1); k++) {
      row += "*";
    }
    print(row);
  }
}
void main (){
   wednesday3Practice();
  // tuesdayPractice();
// fridayPractice();
// sundayPractice();
// saturdayPractice();
// diamondPattern(5);

// week2Saturday();
  // thursdayPractice();
  // wednesdayPractice();
//  tuesdayPractice();
// MondayPractice();
//
//   /*my first project is to write down my family members name
//   in acsanding order */
//    print('Family members name are ');
//    print('1 _ Munir Ahmad');
//    print('2 _ Naheed Parveen');
//    print('3 _ Hassan Munir');
//    print('4 _ Maryam Munir');
//    print('5 _ Hamza Munir');
//
//    // my second project is to make a square by using *.
//   print('square shape');
//
//   print('*  *  *  *  *  *');
//   print('*              *');
//   print('*              *');
//   print('*              *');
//   print('*              *');
//   print('*              *');
//   print('*  *  *  *  *  *');
//
//   /* now my third project is to make a
//   pyramid shape diagram using * .*/
//
//   print('Pyramid shape');
//
//   print('    *    ');
//   print('   ***   ');
//   print('  *****   ');
//   print(' *******  ');
//   print('********* ');
//
//   /* Now i will practice how to use integrals numbers*/
//
//
//   int numberOne = 20;
//   int numberTwo = 10;
//
//   int sum;
//   int subtract;
//   int multiply;
//   double devide;
//
//   sum = numberOne  + numberTwo;
//   subtract = numberOne - numberTwo;
//   multiply = numberOne * numberTwo;
//   devide = numberOne / numberTwo;
//
//   print(numberOne);
//   print(numberTwo);
//
//   print(sum);
//   print(subtract);
//   print(multiply);
//   print(devide);
//
//   print('doneeeeee');
//
//   // SWAPING VARIABLES .
//
//   int x = 10;
//   int y = 20;
//  print (20 + 30);
//  String name = "Hamza Munir";
//
//
//   print('before swaping');
//
//   print('value of x: $x');
//   print('value of y : $y');
//
//   x = x+y; // 10+20= 30
//   y = x-y; // 30 -20= 10
//   x = x-y; // 30 - 10 = 20
//   print('after swaping');
//
//   print('value of x : $x');
//   print('value of y : $y');
//
// // let practice again ..
//
// int a = 4;
// int b = 5;
//
// print('before swaping');
//
// print('value of a : $a');
// print('value of b = $b');
//
//
//
// print('after swiping');
//
// a = a+b;  // a = 4+5 = 9
// b = a-b;  // b = 9 - 5=4
// a = a-b;   // 9-4 = 5
//
// print('value of a = $a');
// print('value of b : $b');
//
// // now i will practice conversion of feet into meters.
//
//
// double feet = 3;
// double meter = 2;
//
// meter= feet / meter;
// print('number of feets = $meter');
//
//  // swapping of two numbers by using 3rd variable
//   int a1 = 4;
//   int b1 = 5;
// int c1;
//
//
//   c1 = a1;  // value of c is 4
//   a1 = b1;  // value of a chasnges from 4 to 5
//   b1 = c1;  // value of b changes from 5 to 4
// print("value of a1  $a1");
// print("value of b1  $b1");
//
//
//  sundaypractice();
//

}


