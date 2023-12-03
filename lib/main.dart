import 'package:flutter/material.dart';
import 'package:interview_test/di/locator.dart';
import 'package:interview_test/domain/use%20case/auth_use_case.dart';
import 'package:interview_test/domain/use%20case/recent_event_use_case.dart';
import 'package:interview_test/presentation/pages/bottom_nav_current.dart';
import 'package:interview_test/presentation/pages/introduction_screen.dart';
import 'package:interview_test/presentation/provider/auth_provider.dart';
import 'package:interview_test/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(
            locator<RecentEventUseCase>(),
          ),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            locator<AuthUseCase>(),
          ),
        )
      ],
      builder: (context, child) => Consumer<AuthProvider>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FutureBuilder(
              future: auth.autoLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // Jika ada error auto-login atau user null, arahkan ke halaman introduction
                    return IntroductionScreen();
                  } else {
                    // Jika user sudah login, arahkan ke halaman home
                    return const BottomNavigationCurrent();
                  }
                } else {
                  // Tampilkan indikator loading selama auto-login berlangsung
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
