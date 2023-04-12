import 'package:simple_domain/simple_domain.dart' as simple_domain;

void main(List<String> arguments) {
  print('Hello world: ${simple_domain.calculate()}!');
  var sedan = Sedan('Toyota', 'Camry', 2021);
  var suv = SUV('Ford', 'Explorer', 2022);

  print(sedan.toString());
  print(suv.toString());

  sedan.start();
  suv.start();

}
  


abstract class Car {
  String make;
  String model;
  int year;
  int numDoors;

  Car(this.make, this.model, this.year, this.numDoors);

  void start() {
    print('The $make $model starts.');
  }

  @override
  String toString() {
    return '$year $make $model with $numDoors doors';
  }
}

class Sedan extends Car {
  Sedan(String make, String model, int year)
      : super(make, model, year, 4);

  @override
  String toString() {
    return '${super.toString()} (Sedan)';
  }
}

class SUV extends Car {
  SUV(String make, String model, int year)
      : super(make, model, year, 5);

  @override
  String toString() {
    return '${super.toString()} (SUV)';
  }
}

