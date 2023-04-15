import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/Provider/authprovider.dart';
import 'package:newapp/View/TabComponent/bottomnav.dart';
import 'package:newapp/View/onboard.dart';
import 'package:newapp/View/style.dart';
import 'package:newapp/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Moderat',
        primarySwatch: Colors.blue,
      ),
      home: authStateAsync.when(
        data: (user) =>
            user != null ? const BottomNav() : const OnboardScreen(),
        loading: () => Ui().loadingCircular(),
        error: (err, stack) => Text('Error: $err'),
      ),
    );
  }
}
