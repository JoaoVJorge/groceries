import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        getPages: AppRoutes.getPages,
        initialRoute: AppRoutes.more,
        debugShowCheckedModeBanner: false,
      );
}
