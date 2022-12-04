import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _systemVersion = '初始值';
  String _batteryLevel = '初始值';

  @override
  void initState() {
    initSysVersion();
    super.initState();
  }

  initSysVersion() async {
    String version = await DeviceInfo.systemVersion;
    String battery = await DeviceInfo.batteryLevel;
    print('version:$version,battery:$battery');
    setState(() {
      _systemVersion = version;
      _batteryLevel = battery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
             '系统版本： $_systemVersion',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '手机电量：$_batteryLevel',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
