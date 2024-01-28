import 'package:flutter/material.dart';
import 'package:shiwake_app_v2/api_test.dart';
import 'package:shiwake_app_v2/utils/file/file_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  testApi();
  runApp(const MyApp());
}

Future<void> testApi() async {
  var api = ApiTest();
  // await api.testTTransactionDefInsert();
  // await api.testTTransactionDefDelete();
  // await api.testUpdateTTransactionDefSortOrder();
  // await api.testTTransactionDef();
  await api.testTJounalItemInsert();
  await api.testTJounalItemRedJournalUpsert();
  await api.testDeleteTJournalItem();
  await api.testInsertCarryOver();
  await api.testTJournalItem();
  await api.testTJournalTotal();
  // api.testMAccountItem();
  await FileUtils.getFileSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
