void main(List<String> args) {
  var rec = new rectangle(3, 4);
  print(rec.area());
  var tri = new triangle(10, 20);
  print(tri.area());
}

class Shape {
  int height;
  int width;
  Shape(this.height, this.width);
}

class rectangle extends Shape {
  rectangle(int hight, int width) : super(hight, width);
  area() => height * width;
}

class triangle extends Shape {
  triangle(int hight, int width) : super(hight, width);
  area() => 0.5 * height * width;
}
