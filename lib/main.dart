import 'package:flutter/material.dart';
import 'package:my_app/header.dart';
import 'package:my_app/provider.dart';
import 'package:my_app/tab_views.dart';
import 'package:my_app/tabs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HeaderProvider()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

final tabsList = List.generate(3, (index) => index);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Header(),
            DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Tabs(),
                  TabViews(
                    statusBarHeight: statusBarHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
