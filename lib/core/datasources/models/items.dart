import 'package:hive/hive.dart';

part 'items.g.dart';

@HiveType(typeId: 1)
class Items {
  @HiveField(0)
  final String item;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final bool isRated;

  Items({
    required this.item,
    required this.price,
    this.isRated = false,
  });
}
