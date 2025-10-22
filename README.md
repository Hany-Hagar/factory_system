# 📱 Factory System App 
تطبيق Flutter حديث يدعم:
- **Hive** للتخزين المحلي.
- **Localization** لتعدد اللغات.
- **Light/Dark Theme** لتغيير المظهر.
- إدارة الحالة باستخدام **Bloc**.
- توليد أيقونات التطبيق باستخدام **flutter_launcher_icons**.
- تغيير اسم التطبيق والـ Bundle ID باستخدام **rename**.

---

## 🚀 المميزات
- تخزين البيانات محليًا باستخدام https://docs.hivedb.dev/#/.
- دعم تعدد اللغات (Localization) باستخدام [intl](https://pub.dev/packages/intlضع الليلي والنهاري (Light/Dark Theme).
- إدارة الحالة باستخدام https://bloclibrary.dev/#/.
- توليد أيقونات التطبيق لجميع المنصات.
- تغيير اسم التطبيق بسهولة.

---

## 📦 الحزم المستخدمة
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  bloc: ^9.0.0
  rename: ^3.1.0
  dartz: ^0.10.1
  lottie: ^3.3.1
  glass: ^2.0.0+2
  flutter_bloc: ^9.0.0
  hive_flutter: ^1.1.0
  dotted_border: ^3.1.0
  cupertino_icons: ^1.0.8
  flutter_screenutil: ^5.9.3
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.1.0
  flutter_launcher_icons: ^0.14.1
  hive_generator: ^1.1.0
