import 'dart:io';

abstract class Shape {
  void draw();

}
class Circle extends Shape{
  double radius;
  

  Circle(this.radius);

  factory Circle.diameter(double diameter) {
    return Circle(diameter / 2);
  }

  @override
  void draw() {
    double diameter = radius * 2;
    double centerX = radius;
    double centerY = radius;

    for (int y = 0; y <= diameter; y++) {
      for (int x = 0; x <= diameter; x++) {
        double distanceFromCenter = ((x - centerX) * (x - centerX)) + ((y - centerY) * (y - centerY));

        if (distanceFromCenter <= radius * radius + radius * 0.8) {
          stdout.write('*');
        } else {
          stdout.write(' ');
        }
      }
      stdout.write('\n');
    }
  }



  }
  class Rectangle extends Shape{
  double width;
  double height;

  Rectangle(this.width, this.height);

   factory Rectangle.square(double size) {
    return Rectangle(size, size);
  }

  @override
  void draw() {
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        if (i == 0 || i == height - 1 || j == 0 || j == width - 1) {
          stdout.write('*');
        } else {
          stdout.write(' ');
        }
      }
      stdout.write('\n');
    }
  }
}


void main(List<String> args) {

  Circle first = Circle(10);
  first.draw();
  
  Rectangle rectangle = Rectangle(5, 6);
  rectangle.draw();
}