import 'package:simple_domain/simple_domain.dart' as simple_domain;

void main(List<String> arguments) {
  print('Hello world: ${simple_domain.calculate()}!');
  var nokia = Nokia('red', 'Nokia XR20', 2021);
  var iphone = Iphone('white', 'iPhone 14', 2022);

  print(nokia.toString());
  print(iphone.toString());

  nokia.ison();
  iphone.ison();

}
  


abstract class Phone {
  String color;
  String model;
  int year;
  

  Phone(this.color, this.model, this.year);

  void ison() {
    print('The $color $model switchs on.');
  }

  @override
  String toString() {
    return '$year $model with $color color';
  }
}

class  Nokia extends Phone {
  Nokia(String color, String model, int year)
      : super(color, model, year);

  @override
  String toString() {
    return '${super.toString()} (Nokia)';
  }
}

class Iphone extends Phone {
  Iphone(String color, String model, int year)
      : super(color, model, year);

  @override
  String toString() {
    return '${super.toString()} (Iphone)';
  }
}

