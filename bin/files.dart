import 'dart:convert';
import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:xml/xml.dart';

class JsonDatabase {
  List<Map<String, dynamic>> articles = [
    {
      "title": "JSON1:API paints my bikeshed!",
      "body": "The shortest article. Ever.",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    },
    {
      "title": "JSON2:API paints my bikeshed!",
      "body": "The shortest article. Ever.",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    },
    {
      "title": "JSON3:API paints my bikeshed!",
      "body": "The shortest article. Ever.",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ];

  void writeToJsonFile(String filename) {
    // Convert the list to JSON
    String jsonData = jsonEncode({"articles": articles});

    // Write the JSON data to a file
    File(filename).writeAsStringSync(jsonData);
  }

  List<Map<String, dynamic>> readFromJsonFile(String filename) {
    // Read the JSON data from the file
    String fileData = File(filename).readAsStringSync();

    // Parse the JSON data back into a list
    List<dynamic> parsedData = jsonDecode(fileData)['articles'];

    // Initialize a list with the parsed data
    List<Map<String, dynamic>> parsedList =
        parsedData.map((article) => Map<String, dynamic>.from(article)).toList();

    // Return the parsed list
    return parsedList;
  }
}


class file{
  void writeCSV() {
    final file = File('example.csv');
    file.writeAsStringSync('Name, Age\n');
    file.writeAsStringSync('peter Him, 50\n', mode: FileMode.append);
    file.writeAsStringSync('Jane Floor, 30\n', mode: FileMode.append);
  }

  void writeYAML() {
    final data = {'name': 'John Doe', 'age': 25};
    final yamlString = json.encode(data);
    final yamlMap = loadYaml(yamlString);
    final file = File('example.yaml');
    file.writeAsStringSync(json.encode(yamlMap));
  }

  void writeXmlFile() {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('person', nest: () {
      builder.element('name', nest: 'Hi Him');
      builder.element('age', nest: '75');
    });
    final xmlString = builder.buildDocument().toXmlString(pretty: true);
    final file = File('example.xml');
    file.writeAsStringSync(xmlString);
  }
}


//}

void main() {
  JsonDatabase newfile = JsonDatabase();

  // Write the articles to a JSON file
  newfile.writeToJsonFile('data.json');

  // Read the articles from the JSON file
  List<Map<String, dynamic>> articlesFromJsonFile =
      newfile.readFromJsonFile('data.json');

  // Print the articles to verify that they were read correctly
  print(articlesFromJsonFile);


  final fileOps = file();
  fileOps.writeCSV();
  fileOps.writeYAML();
  fileOps.writeXmlFile();
}
