import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart'
    show BuildContextExtension;
import 'package:portfolio/ui/ui.dart'
    show AppColors, AppTextTypeEnum, AppTheme, TextWidget;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(appColors: AppColors());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light,
      darkTheme: theme.dark,
      debugShowCheckedModeBanner: kDebugMode,
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
        title: TextWidget(
          widget.title,
          style: context.appTextTheme.headlineSmall
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextWidget(
              'You have pushed the button this many times:',
            ),
            TextWidget(
              '$_counter',
              textType: AppTextTypeEnum.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        label: const TextWidget("Increment"),
      ),
    );
  }
}
