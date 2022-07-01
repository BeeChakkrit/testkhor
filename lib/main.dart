import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/drawer/view/Drawerview.dart';
import 'package:flutter_application_2/page/page2/pageview2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
