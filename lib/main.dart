import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/components/app_bar/app_bar.dart';
import 'package:kakubo/core/datasources/models/items.dart';
import 'package:kakubo/screens/purchase_list.dart';
import 'package:kakubo/screens/regret_list.dart';
import 'package:kakubo/screens/unrated_list.dart';
import 'package:path_provider/path_provider.dart';

late Box box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDir.path);

  // 先にItemsAdapterを登録しなあかんみたい
  Hive.registerAdapter(ItemsAdapter());
  box = await Hive.openBox<Items>('itemsBox');

  // openBoxが完了した時にログを出力
  try {
    await Hive.openBox<Items>('itemsBox');
    print('Hive box opened successfully!');
  } catch (e) {
    print('Error opening Hive box: $e');
  }

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
      home: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return const Scaffold(
              appBar: AppBarComponent(title: 'KAKUBO'),
              body: TabBarView(
                children: <Widget>[
                  PurchaseList(),
                  UnratedList(),
                  RegretList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
