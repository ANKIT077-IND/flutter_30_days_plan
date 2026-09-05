void main() {
  // initial the variable here //

  var name = "Ankit";
  String title = "Hello";
  dynamic user = "Hii";
  Object title1 = "Hello Onject";

  // null safety //
  String name1 = "Arav";
  String? nickName;
  print(nickName?.toUpperCase());
  print(nickName ?? "No name");
  int version = 3;
  bool isLogin = false;
  double weight = 3.5;
  String newName = name.toUpperCase();
  String newName1 = name.toLowerCase();
  String newName2 = name.length.toString();

  print(newName);
  print(newName1);
  print(newName2);

  // for list //
  List<String> fruit = ["Apple", "Mango", "Banana", "grapes"];

  // add item in list //
  fruit.add("Orange");
  print(fruit);
  // remove item in list //
  fruit.remove("Mango");
  print(fruit);
  // remove based on the index //
  fruit.removeAt(2);
  print(fruit);
  // print reverse
  print(fruit.reversed);
  // get the length //
  print(fruit.length);

  List<String> fruitName = fruit.where((value) => value == "Baana").toList();
  print(fruitName.toString());

  //  for map //
  Map<String, dynamic> map = {'name': "Ankit", 'age': "20", 'country': "India"};
  // print the map value//
  print(map);
  // get the value using key //
  print(map["age"].toString());

  // remove item using key //
  print(map.remove("name"));
  print(map.toString());

  // for set //
  Set<String> city = {"agra", "kaushambi", "delhi"};
  city.add("gurugram");
  print("city:" + city.toString());

  //
  List<int> list = [1, 2, 3, 4, 5, 6, 7];
  print(reverseList(list));
  print(largestNumber(list));
  print(checkPrime(11));
  print(fibonacciSeries(8));
  print(factorial(5));
}

// reverse the list<int> without using .reverse //
reverseList(List<int> list) {
  List<int> reverse = [];
  for (int i = list.length - 1; i >= 0; i--) {
    reverse.add(list[i]);
  }
  return reverse;
}

// find the largest number in the array //
largestNumber(List<int> list) {
  int number = list[0];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > number) {
      number = list[i];
    }
  }
  return number;
}

// check number if prime of not //
checkPrime(int number) {
  if (number <= 2) return false;
  for (int i = 2; i < number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

//
fibonacciSeries(int number) {
  int a = 0;
  int b = 1;
  for (int i = 1; i < number; i++) {
    print(a);
    int c = a + b;
    a = b;
    b = c;
  }
}

// factorial //
factorial(int number) {
  int fact = 1;
  for (int i = 2; i <= number; i++) {
    fact *= i;
  }
  print(fact);
}
