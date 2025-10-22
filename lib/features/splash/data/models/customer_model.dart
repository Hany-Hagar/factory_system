import 'package:hive/hive.dart';

part 'customer_model.g.dart'; // ضروري لتوليد adapter بعدين

@HiveType(typeId: 2)
class Customer extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int quantity;

  @HiveField(3)
  final int state;

  @HiveField(4)
  final int machineId;

  Customer({
    required this.id,
    required this.title,
    required this.quantity,
    required this.state,
    required this.machineId,
  });

  /// ✅ دالة النسخ (copyWith)
  Customer copyWith({
    int? id,
    String? title,
    int? quantity,
    int? state,
    int? machineId,
  }) {
    return Customer(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      state: state ?? this.state,
      machineId: machineId ?? this.machineId,
    );
  }
}
