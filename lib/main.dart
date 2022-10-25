import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String secretData = 'This is the secret data!';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) {
        return Data();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Container(
            child: Level1(),
          ),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MyTextField(), Level3()],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data,
      style: const TextStyle(
        fontSize: 33.0,
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        Provider.of<Data>(context, listen: false).changeString(newValue);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
