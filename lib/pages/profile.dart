import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({@required this.contactIndex});
  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBar(),
          imageGrid(),
          socialList(),
        ],
      ),
    );
  }

  Widget appBar() {
    return SliverAppBar(
      title: Text("Contact $contactIndex"),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/avatar.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget imageGrid() {
    return SliverPadding(
      padding: EdgeInsets.all(12),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => image(),
          childCount: 30,
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/avatar.jpg",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget socialList() {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            socialButton(
              title: "Instagram",
              color: Colors.deepPurple,
            ),
            socialButton(
              title: "Facebook",
              color: Color.fromRGBO(45, 136, 255, 1),
            ),
            socialButton(
              title: "Reddit",
              color: Color.fromRGBO(255, 69, 0, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialButton({@required String title, @required Color color}) {
    return MaterialButton(
      onPressed: () {},
      child: Text(title),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
