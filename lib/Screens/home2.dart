import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: () {}, icon:Icon(Icons.notifications),)
        ],
        title: Row(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
            ))
          ],
        ),
      ),
    );
  }
}
