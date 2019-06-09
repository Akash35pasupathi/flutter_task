import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_read_write_file/FileUtils.dart';
import 'second_task.dart';


class firsttask extends StatefulWidget {
  firsttask({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<firsttask> {
  String fileContents = "No Record Found";
  final myController = TextEditingController();

  static const String _channel = 'test_activity';
  static const platform = const MethodChannel(_channel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: myController,
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              FileUtils.saveToFile(myController.text);



            },
          ),
          RaisedButton(
            child: Text("Read"),
            onPressed: () {
              FileUtils.readFromFile().then((contents) {
                setState(() {
                  fileContents = contents;
                });
              });
            },
          ),

      RaisedButton(
        child: Text("Second task Android activity navigation"),
        onPressed: () {
         getNewActivity();
        },
      ),

          Text(fileContents),
        ],
      ),
    );
  }

  getNewActivity() async {
    try {
      await platform.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}