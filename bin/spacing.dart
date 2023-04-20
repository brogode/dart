class Spacing {
  static bool isValid(String str) {
    if (str.startsWith(' ') || str.endsWith(' ')) {
      // Leading or trailing space
      return false;
    }
    final words = str.trim().split(' ');
    for (final word in words) {
      if (word.isEmpty) {
        // Empty word (two spaces in a row)
        return false;
      }
    }
    return true;
  }
}


void main() {
  print(Spacing.isValid('Hello world'));    // true
  print(Spacing.isValid(' Hello world'));   // false
  print(Spacing.isValid('Hello world  '));  // false
  print(Spacing.isValid('Hello  world'));   // false
  print(Spacing.isValid('Hello'));          // true
  print(Spacing.isValid('Helloworld'));     // true
  print(Spacing.isValid('Helloworld '));    // false
  print(Spacing.isValid(' '));              // false
  print(Spacing.isValid(''));               // true
}
