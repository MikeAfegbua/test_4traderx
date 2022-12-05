import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_4traderx/app/navigation/navigator.dart';
import 'package:test_4traderx/app/utils/local_storage.dart';
import 'package:test_4traderx/views/pages/mail_login.dart';
import 'package:test_4traderx/views/pages/nav_bar.dart';

import 'app/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init();
  await GlobalConfiguration().loadFromAsset('.config');
  runApp(const MyApp()); //Allinitialization
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926), //screensize setup
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, builder) => MaterialApp(
        title: '4traderx',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
          primaryColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AppCache.getToken() != null // Persist
            ? const NavBar()
            : const MailLogin(),
        navigatorKey: AppNavigator.navKey,
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
