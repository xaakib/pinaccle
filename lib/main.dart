import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/Provider/download.dart';
import 'package:hoichoi_clone_app/Provider/paymentsetting.dart';
import 'package:hoichoi_clone_app/Provider/userplan.dart';
import 'package:hoichoi_clone_app/Splash/splash.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(debug: true);

  await Hive.initFlutter();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.openBox("data");
  await Hive.openBox("download");
  Hive.init(dir.path);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => UserplanProvider())),
    ChangeNotifierProvider(create: ((context) => PaymentSettingProvider())),
    ChangeNotifierProvider(create: ((context) => Appdetailsprovidr())),
    ChangeNotifierProvider(create: ((context) => AllpageProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    var box = Hive.box('data');
    return Shortcuts(

      shortcuts: <LogicalKeySet, Intent>{

        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Pinnacle',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
          textTheme: Typography(platform: TargetPlatform.iOS).white,
          unselectedWidgetColor: color,
          primarySwatch: const MaterialColor(
            0xFF000000,
            <int, Color>{
              50: Color.fromARGB(255, 0, 0, 0),
              100: Color(0xFFBBDEFB),
              200: Color(0xFF90CAF9),
              300: Color(0xFF64B5F6),
              400: Color(0xFF42A5F5),
              500: Color(0xFF42A5F5),
              600: Color(0xFF1E88E5),
              700: Color(0xFF1976D2),
              800: Color(0xFF1565C0),
              900: Color(0xFF0D47A1),
            },
          ),
        ),
        initialRoute: "/Splash",
        routes: {"/Splash": (context) => SplashScreenPage()},
      ),
    );
  }
}
