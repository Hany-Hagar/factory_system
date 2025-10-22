import 'customer_model.dart';
import 'package:hive/hive.dart';

part 'machine_model.g.dart'; // لازم بعدين تشغّل build_runner

@HiveType(typeId: 1)
class Machine extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  List<Customer> customers;

  Machine({required this.id, required this.title, required this.customers});

  Machine copyWith({int? id, String? title, List<Customer>? customers}) {
    return Machine(
      id: id ?? this.id,
      title: title ?? this.title,
      customers: customers ?? this.customers,
    );
  }

  /// Convert Machine -> Map (من غير customers)
  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  /// Convert Map -> Machine (من غير customers)
  factory Machine.fromMap(Map<String, dynamic> map) {
    return Machine(id: map['id'], title: map['title'] ?? '', customers: []);
  }

  /// ✅ New Factory (بإنشاء آلة جديدة افتراضيًا)
  factory Machine.newMachine({required int id, required String title}) {
    return Machine(id: id, title: title, customers: []);
  }

  /// ✅ Add Customer to Machine (بإضافة زبون جديد للآلة)
  Machine AddCustomer({
    required String title,
    required int quantity,
    required int state,
  }) {
    var newId = customers.isEmpty ? 0 : customers.last.id + 1;
    customers.add(
      Customer(
        id: newId,
        machineId: id,
        title: title,
        quantity: quantity,
        state: state,
      ),
    );
    return Machine(id: id, title: this.title, customers: customers);
  }

  Machine deleteCustomer({required Customer customer}) {
    customers.removeWhere((m) => m.id == customer.id);
    return Machine(id: id, title: this.title, customers: customers);
  }
}
