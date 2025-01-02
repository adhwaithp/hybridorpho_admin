import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/homescreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ddnvpeypauuynmbgyxad.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkbnZwZXlwYXV1eW5tYmd5eGFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4NTcxMTcsImV4cCI6MjA0ODQzMzExN30.JtyFPf412nCDE0_oO2l4ToqBF1FjyJ1Dg3GNekQ6hCg',
  );

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homescreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Row(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/login_img.jpg',
                  fit: BoxFit.cover,
                ),
                const Center(
                  child: Text(
                    "welcome back",
                    style: TextStyle(
                        color: Color.fromARGB(255, 244, 242, 242),
                        fontSize: 54,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 240, 240, 240),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "user name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'user name'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "password",
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              border: OutlineInputBorder(),
                              labelText: 'password '),
                          obscureText: !passwordVisible,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const InkWell(
                                child: const Text(
                              "forgot password?",
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                            child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
