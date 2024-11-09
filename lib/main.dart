import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/components/app_bar/app_bar.dart';
import 'package:kakubo/core/datasources/models/items.dart';
import 'package:kakubo/screens/purchase_list.dart';
import 'package:kakubo/screens/regret_list.dart';
import 'package:kakubo/screens/unrated_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kakubo/features/input/entries/input.dart';

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
      home: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return const InputItems();
                    },
                  );
                },
                child: Icon(Icons.add),
              ),
              appBar: const AppBarComponent(title: 'KAKUBO'),
              body: const TabBarView(
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
