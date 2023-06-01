void main() {
 var list = f();
  print(list);
}

f(){
  List<int> lst =  List.empty(growable: true);
  var number1 = 1;
  var number2 = 1;
  while(number2 < 50){
    //print(number2);
    lst.add(number2);
    number2 += number1;
    number1 = number2 - number1;
  }
  var oneToThree = lst.takeWhile((x) => x <= 3).toList();

  //var task2 = list.map((number) => int.parse(number.toString().substring(numbe

  var is_5_true = lst.contains(5);

  var element3 = lst[2];

  var clone = List.from(lst);
  return clone;
}
