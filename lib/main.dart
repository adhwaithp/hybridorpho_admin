import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ddnvpeypauuynmbgyxad.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkbnZwZXlwYXV1eW5tYmd5eGFkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMjg1NzExNywiZXhwIjoyMDQ4NDMzMTE3fQ.XwfnRGDlW9aeqBKG8m6-biI7EHZx_TAeMjjOreKOd50',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
