class CustomerStatesModel {
  final int id;
  final String title;
  final int color;

  CustomerStatesModel({
    required this.id,
    required this.title,
    required this.color,
  });

  /// Convert MachineStatesModel -> Map (for Supabase insert/update)
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'color': color};
  }

  /// Convert Map -> MachineStatesModel (when reading from Supabase)
  factory CustomerStatesModel.fromMap(Map<String, dynamic> map) {
    return CustomerStatesModel(
      id: map['id'],
      title: map['title'],
      color: map['color'],
    );
  }
}



// // ألوان الحالات
// 0xFF2196F3  // مطبوع - أزرق
// 0xFF4CAF50  // شغال - أخضر
// 0xFFF44336  // خلص - أحمر
// 0xFF9E9E9E  // غير محدد - رمادي
