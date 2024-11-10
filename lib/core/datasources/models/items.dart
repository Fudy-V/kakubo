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
  @HiveField(6)
  final double rate;

  Items({
    required this.item,
    required this.price,
    this.isRated = false,
    this.isDelated = false,
    this.isPurchased = false,
    this.rate = 0.0,
    DateTime? date,
  }) : date = date ??
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day);

  // isPurchasedを変更するためのメソッド
  Items setPurchasedStatus(bool status) {
    return Items(
      item: item,
      price: price,
      isRated: isRated,
      isDelated: isDelated,
      isPurchased: status, // 新しいステータスをセット
      rate: rate,
      date: date,
    );
  }

  // rateを変更するためのメソッド（copyWith）
  Items copyWith({
    bool? isRated,
    bool? isDelated,
    bool? isPurchased,
    double? rate,
    DateTime? date,
  }) {
    return Items(
      item: item,
      price: price,
      isRated: isRated ?? this.isRated,
      isDelated: isDelated ?? this.isDelated,
      isPurchased: isPurchased ?? this.isPurchased,
      rate: rate ?? this.rate, // rateを変更する
      date: date ?? this.date,
    );
  }
}
