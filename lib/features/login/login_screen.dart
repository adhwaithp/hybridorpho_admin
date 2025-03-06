import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybridorpho_admin/features/home/homescreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widget/custom_alert_dialog.dart';
import '../../common_widget/custom_button.dart';
import '../../common_widget/custom_text_formfield.dart';
import '../../util/value_validator.dart';
import 'login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null && currentUser.appMetadata['role'] == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Homescreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Homescreen()),
              (route) => false,
            );
          } else if (state is LoginFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                description: state.message,
                primaryButton: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
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
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 400,
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Email",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormField(
                                  isLoading: state is LoginLoadingState,
                                  controller: _emailController,
                                  labelText: 'Email',
                                  validator: emailValidator,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  "Password",
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                    controller: _passwordController,
                                    obscureText: isObscure,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            isObscure = !isObscure;
                                            setState(() {});
                                          },
                                          icon: Icon(isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      border: const OutlineInputBorder(),
                                      labelText: 'Password',
                                      prefixIcon: const Icon(Icons.lock),
                                    )),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const InkWell(
                                      child: const Text(
                                        "forgot password?",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomButton(
                                  inverse: true,
                                  isLoading: state is LoginLoadingState,
                                  label: 'Login',
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginEvent(
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim(),
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
