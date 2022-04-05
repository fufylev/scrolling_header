import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      color: Colors.blue.withOpacity(0.2),
      width: size.width,
      child: const TabBar(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            child: Text('First'),
          ),
          Tab(
            child: Text('Second'),
          ),
          Tab(
            child: Text('Third'),
          )
        ],
      ),
    );
  }
}
