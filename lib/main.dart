import 'package:dashbord/screens/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'binding/home_binding.dart';
import 'controllers/controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
        designSize: const Size(411, 843),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child)
      {
      return GetMaterialApp(
        title: 'Responsive Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Controller(),)
          ],
          child: const DashBoardScreen(),

        ),
        initialBinding: HomeBinding(),
      );}
    );
  }
}

