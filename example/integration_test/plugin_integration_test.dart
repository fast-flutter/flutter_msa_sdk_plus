import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_msa_sdk_plus');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final textFinder = find.text('OAID Support: ');
    expect(textFinder, findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: const Center(child: Text('OAID Support: ')),
      ),
    );
  }
}
