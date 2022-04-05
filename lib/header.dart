import 'package:flutter/material.dart';
import 'package:my_app/provider.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = context.watch<HeaderProvider>().headerHeight;

    return Container(
      height: headerHeight,
      width: size.width,
      color: Colors.black12,
      child: Column(
        children: const [
          Text('Грёбаная шапка'),
        ],
      ),
    );
  }
}
