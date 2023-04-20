class Error_rate{

  String printerError(String s) {
  int errorCount = 0;
  int totalCount = s.length;
  
  for (int i = 0; i < s.length; i++) {
    if (s.codeUnitAt(i) > 'm'.codeUnitAt(0)) {
      errorCount++;
    }
  }
  
  return '$errorCount/$totalCount';
}

}

void main(List<String> args) {
    var error = Error_rate();
  String s1 = "aaabbbbhaijjjm";
  String s2 = "aaaxbbbbyyhwawiwjjjwwm";
  
  print(error.printerError(s1)); // Output: 0/14
  print(error.printerError(s2)); // Output: 8/22

}