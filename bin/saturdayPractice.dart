import 'dart:io';

void saturdayPractice() {
  findPerimeter();
  findPerameter(4, 3);
  print('');
  printCities('Lahore', 'Shahaniya', 'Doha');
  print('');
  printCountries('Pakistan');
  print(findVolume(10 ,5 ,height:  20));

  // Now all values MUST be passed

print( " chose condion 1 or you can chose option 2");
  int choice = int .parse(stdin.readLineSync()!);

  if ( choice == 1){
    print( ' choose condition 1,  or choose condition 2 , choose condion 3');
    int choice1 = int . parse(stdin.readLineSync()!);

    if ( choice1== 1){
      
    }

  }

}




// ---------------- Functions ----------------






void findPerimeter() {
  int length = 4;
  int breadth = 3;

  int perimeter = 2 * (length + breadth);
  print('perimeter is : $perimeter');

  print('\n');
}

void findPerameter(int length, int breadth) =>
    print('the perameter is ${2 * (length + breadth)}');

// Required parameters
// Optional positional parameters

//   *********** Required parameters*********

void printCities(String name1, String name2, String name3) {
  print('name 1 is $name1');
  print('name 2 is $name2');
  print('name 3 is $name3');
} // in required parameters , we write all perameters given ,like in this exp there are
// 3 perameters like string name1 , string name 2, string name 3.

//  ******* Optional perameters**********

void printCountries( String name1 , [String? name2 , String? name3]){
  print('name 1 is $name1');
  print('name 2 is $name2');
  print('name 3 is $name3');
} // in optional perameters  , we use jiss perameter ko null karna ho us ke sath square brackets lagaty
  // hen or sath me ? bi lagaty hen.

/* parameters ki two types hen
 1 ... required
 2.... optional
 option perameters ke 3 more types hen
 2(a) ...positional
 2(b) .... named
 2(c) ..... default
 */

// ********** optional named parameters***********

 int  findVolume(int length , int breadth , {required int height}){

  print(" Length is$length");
  print("Breadth is $breadth");
  print("height is $height");

  print(" Volume is ${length * breadth * height}");
  int result = length * breadth * height;
  return result;

  print(" Length is$length");
  print("Breadth is $breadth");
  print("height is $height");

  print(" Volume is ${length * breadth * height}");
}


