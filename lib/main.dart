import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/drawer/view/Drawerview.dart';
import 'package:flutter_application_2/page/page2/pageview2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// main.dart
Future<void> main() async {
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB3KbO8s_chzi9sADo-FQvS9eEFs46nSSw",
        authDomain: "testproject-9e62f.firebaseapp.com",
        projectId: "testproject-9e62f",
        storageBucket: "testproject-9e62f.appspot.com",
        messagingSenderId: "854973497344",
        appId: "1:854973497344:web:e00f94453cff791af618e5",
        measurementId: "G-N5H0H3GK10",
        databaseURL:
            "https://testproject-9e62f-default-rtdb.asia-southeast1.firebasedatabase.app",
      ),
    );
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
    final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
    return availablePages[selectedPageKey]!;
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplitView(
          menu: AppMenu(),
          content: selectedPageBuilder(context),
        ));
  }
}
