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
    String fileData = File(filename).readAsStringSync();

    // Parse the JSON data back into a list
    List<dynamic> data = jsonDecode(fileData)['articles'];

    // Initialize a list with the parsed data
    List<Map<String, dynamic>> output =
        data.map((article) => Map<String, dynamic>.from(article)).toList();

    // Return the parsed list
    return output;
  }
}


class file{
  void writeCSV(String filename, String data) {
    final file = File(filename);
    file.writeAsStringSync(data);
  }

  void writeYAML(String filename, Map<String, dynamic> data) {
    final yamlString = json.encode(data);
    final yamlMap = loadYaml(yamlString);
    final file = File(filename);
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

  print('');

  // Write the articles to a JSON file
  newfile.writeToJsonFile('data.json');

  List<Map<String, dynamic>> articlesFromJsonFile =
      newfile.readFromJsonFile('data.json');

  print(articlesFromJsonFile);


  final fileOps = file();
  fileOps.writeCSV('example.csv', 'Name, Age\npeter Him, 50\nJane Floor, 30\n');
  fileOps.writeYAML('example.yaml', {'name': 'John Doe', 'age': 25});
  fileOps.writeXmlFile();

}
