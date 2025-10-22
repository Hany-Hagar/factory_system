import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/hive_services.dart';
import 'package:manage_system/theme.dart';
import 'core/utils/my_bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/data/models/data_model.dart';
import 'features/splash/data/models/machine_model.dart';
import 'features/splash/data/models/customer_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/layout/presentation/manager/app_cubit.dart';
import 'features/layout/presentation/manager/app_states.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/splash/presentation/views/pages/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  Hive.registerAdapter(MachineAdapter());
  Hive.registerAdapter(CustomerAdapter());

  final openResult = await HiveService.openBox();
  openResult.fold(
    (failure) {
      print('❌ Hive openBox failed: ${failure.errMessage}');
    },
    (success) {
      print('✅ Hive openBox success');
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => AppCubit())],
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
              );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: AppCubit.get(context).theme,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale(AppCubit.get(context).userData.lang),
                home: SplashView(),
              );
            },
          ),
        );
      },
    );
  }
}
