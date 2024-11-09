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
  @HiveField(3)
  final bool isDelated;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final bool isPurchased;

  Items({
    required this.item,
    required this.price,
    this.isRated = false,
    this.isDelated = false,
    this.isPurchased = false,
    DateTime? date,
  }) : date = date ??
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
