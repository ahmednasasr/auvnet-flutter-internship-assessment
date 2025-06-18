import 'package:auvnet_flutter_internship_assessment/splash/presentation/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'core/services/get_it.dart';
import 'core/services/hive.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_color.dart';
import 'features/auth/presentation/manger/cubits/login_cubit/login_bloc.dart';
import 'features/auth/presentation/manger/cubits/sign_up_cubit/signin_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.Init();
  await Hive.initFlutter();
  await HiveService().init();

  setUpGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(getIt())),
        BlocProvider(create: (_) => SignupBloc(getIt())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        onGenerateRoute: OnGenerateRoute,
        initialRoute: SplashView.routename,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          fontFamily: "Cairo",
        ),
      ),
    );
  }
}
