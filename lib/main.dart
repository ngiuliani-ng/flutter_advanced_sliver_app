import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: contactList(context),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Sliver"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.dehaze,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget contactList(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) => contactCard(index),
    );
  }

  Widget contactCard(int index) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey.shade600,
      ),
      title: Text("Contact $index"),
      subtitle: Text("Hello!"),
      trailing: Text(
        "Now",
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
