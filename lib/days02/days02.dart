void main() {
  print(getInfo("Hello", "Hello@gmail.com"));
  print(getSquare(5));

  var book = Book(
    bookIssueDate: "20/07/2026",
    bookPrice: "320",
    bookTitle: "Better health",
  );
  print(book.bookTitle);
  print(book.bookPrice);
  print(book.bookIssueDate);

  var auther = Auther(
    bookIssueDate: "20/07/2025",
    bookPrice: "220",
    bookTitle: "am good",
  );

  print(auther.bookTitle);

  final library = Library("Hindi");
  print(library.item);
  print(library.calculateFees());
  print(library.describe());

  var stus = status.Error;

  switch (stus) {
    case status.Loading:
      print("Loading");
    case status.Success:
      print("Success");
    case status.Error:
      print("Error");
  }

  // for extension
  print('ankit'.capatilize);
}

// function named and optional parameter
String getInfo(String name, String email) {
  return 'Your name is ${name} and your email is ${email}';
}

// arrow function
int getSquare(int number) => number * number;

// creating a class
class Book {
  String bookTitle;
  String bookPrice;
  String bookIssueDate;
  Book({
    required this.bookIssueDate,
    required this.bookPrice,
    required this.bookTitle,
  });
}

// inheritance
class Auther extends Book {
  Auther({
    required super.bookIssueDate,
    required super.bookPrice,
    required super.bookTitle,
  });

  @override
  String describe() => '📀 $bookIssueDate — $bookPrice -- $bookTitle';
}

// abstract class //
abstract class LibraryItem {
  final String item;
  LibraryItem(this.item);
  String shortTitle() => item.substring(0, 3);
  String describe();
}

class Payable {
  double calculateFees() => 0.0;
}

class Library extends LibraryItem implements Payable {
  Library(String item) : super(item);
  @override
  double calculateFees() => 2.5;

  @override
  String describe() => '$item';
}

// mixin

mixin formValidation {
  String? validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return "Value is empty";
    } else if (value.length < 4 || value.length > 20) {
      return "value must be 4 to 20 character";
    }
    return null;
  }
}

// class Ankit extends StatelessWidget with formValidation {
//   const Ankit({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(validator: validateValue);
//   }
// }

// Enum

enum status { Loading, Success, Error }

//  extension function
extension StringFunction on String {
  String get capatilize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

//
