import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/page1/pageview1.dart';
import 'package:flutter_application_2/page/page3/pageview3.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPageNameProvider = StateProvider<String>((ref) {
  return availablePages.keys.first;
});

final availablePages = <String, WidgetBuilder>{
  'First Page': (_) => FirstPage(),
  'First Page two': (_) => FirstPagetwo(),
  'FirstPage3': (_) => FirstPage3(),
  'FirstPage4': (_) => FirstPage4(),
  'FirstPage5': (_) => FirstPage5(),
  'FirstPage6': (_) => FirstPage6(),
};

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(selectedPageNameProvider.state).state != pageName) {
    ref.read(selectedPageNameProvider.state).state = pageName;
  }
}

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  return availablePages[selectedPageKey]!;
});

class AppMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff64AE25),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset('assets/images/Image_mobile_phone.png'),
            ),
          ),
          for (var pageName in availablePages.keys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
        ],
      ),
    );
  }
}
