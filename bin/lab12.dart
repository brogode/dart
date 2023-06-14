void main() {
  List<String> items = ['apple', 'banana', 'cherry', 'date', 'elderberry'];

  List<int> itemLengths = items.map((item) {
    String uppercaseItem = item.toUpperCase();
    return uppercaseItem.length;
  }).toList();

  print(itemLengths); 
}
