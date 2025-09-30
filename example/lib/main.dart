import 'package:flutter/material.dart';

import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _oaid = 'Unknown';
  bool _isSupport = false;
  final _flutterMsaSdkPlusPlugin = FlutterMsaSdkPlus();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isSupport;
    String oaid;

    try {
      isSupport = await _flutterMsaSdkPlusPlugin.isSupport();
      oaid = await _flutterMsaSdkPlusPlugin.getOAID();
    } catch (e) {
      isSupport = false;
      oaid = 'Error: $e';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isSupport = isSupport;
      _oaid = oaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('OAID Support: $_isSupport'),
              const SizedBox(height: 20),
              Text('OAID: $_oaid'),
            ],
          ),
        ),
      ),
    );
  }
}
