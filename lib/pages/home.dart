import 'package:flutter/material.dart';

import 'package:flutter_advanced_sliver_app/pages/profile.dart';

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
        (context, index) => contactCard(context, index),
        childCount: 50,
      ),
    );
  }

  Widget contactCard(BuildContext context, int index) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              contactIndex: index,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage("assets/images/avatar.jpg"),
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
