import 'package:flutter/material.dart';
import 'package:my_app/provider.dart';
import 'package:my_app/tab_content.dart';
import 'package:provider/provider.dart';

class TabViews extends StatelessWidget {
  const TabViews({Key? key, required this.statusBarHeight}) : super(key: key);

  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = context.watch<HeaderProvider>().headerHeight;

    return Container(
      color: Colors.white.withOpacity(1),
      height: size.height - statusBarHeight - headerHeight - 50,
      width: size.width,
      child: TabBarView(
        children: List.generate(
          3,
          (index) => TabContent(
            index: index,
          ),
        ),
      ),
    );
  }
}
