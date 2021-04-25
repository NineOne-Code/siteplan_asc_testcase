import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siteplan_asc_testcase/core/viewmodels/siteplan_model.dart';
import 'package:siteplan_asc_testcase/view/screens/siteplan_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SitePlanModel>(
          create: (context) => SitePlanModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SitePlanScreen(),
      ),
    );
  }
}
