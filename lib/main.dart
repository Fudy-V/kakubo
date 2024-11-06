import 'package:flutter/material.dart';
// import 'package:kakubo/core/components/app_bar/app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/datasources/models/items.dart';
import 'package:kakubo/screens/purchase_list.dart';
import 'package:path_provider/path_provider.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDir.path);
  box = await Hive.openBox('box');

  Hive.registerAdapter(ItemsAdapter());
  runApp(const MyApp());
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
        home: DefaultTabController(length: 3, child: PurchaseList()));
  }
}
