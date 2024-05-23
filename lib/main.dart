import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/config/theme/app_theme.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/src/presentation/screen/form_page.dart';
import 'package:test_app/src/presentation/viewmodel/form_page_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.titleApp,
        theme: AppTheme(selectedColor: 1).theme(),
        home: ChangeNotifierProvider(
            create: (context) => FormPageViewModel(), child: const FormPage()));
  }
}
