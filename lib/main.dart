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
      body: CustomScrollView(
        slivers: [
          appBar(),
          contactList(context),
        ],
      ),
    );
  }

  Widget appBar() {
    return SliverAppBar(
      title: Text("Sliver"),
      centerTitle: true,

      /// Se [floating] è "true" ci permette di far comparire
      /// la [SliverAppBar] senza tornare completamente in alto.
      floating: true,

      /// Se [snap] è "true" ci permette di far comparire
      /// la [SliverAppBar] appena scrolliamo.
      snap: true,
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => contactCard(index),
        childCount: 50,
      ),
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
