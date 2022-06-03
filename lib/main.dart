import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test/routes/app_route.dart';
import 'package:test/services/connectivity.dart';
import 'package:test/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSharedPreferences.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final localStorage = Get.put(LocalSharedPreferences());
  final connection = Get.put(ConnectivityService());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: appRouter.getpages,
        title: 'SmartPay',
        initialRoute: '/splash',
      ),
    );
  }
}
