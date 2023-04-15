import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/Provider/authprovider.dart';
import 'package:newapp/View/Auth/commonwidget.dart';
import 'package:newapp/View/Auth/signup.dart';
import 'package:newapp/View/TabComponent/bottomnav.dart';
import 'package:newapp/View/formwidget.dart';
import 'package:newapp/View/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class ConditionAuth extends ConsumerWidget {
  final Widget widget;
  const ConditionAuth({super.key, required this.widget});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);

    return authStateAsync.when(
      data: (user) {
        if (user != null) {
          ref.read(authName.notifier).state = user.displayName ?? 'User';
          return const BottomNav();
        } else {
          return widget;
        }
      },
      loading: () => Ui().loadingCircular(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> with Ui, CommonAuthWidget {
  FormWidget? email;

  bool isChecked = false;

  String password = '';
  bool showPassword = false;

  // bool uploaddone = tru

  @override
  void initState() {
    super.initState();
    email = FormWidget(inputText: '', text: "Email Address", context: context);

    email!.hint = 'goradeveloper@gamil.com';
  }

  Color getColor(Set<MaterialState> states) {
    return blue;
  }

  @override
  Widget build(BuildContext context) {
    return innnerLayout(SizedBox(
      height: height(context) - 80,
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          header('Login'),
          oAuthButton(context, 'Login with Google'),
          Divider(
            color: numb,
          ),
          email!.textField(),
          hspacer(10),
          input('Password', black, w500, 14),
          Container(
              width: width(context),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              height: 51,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  border: Border.all(color: numb, width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(context) * 0.5,
                    child: TextFormField(
                      initialValue: '',
                      obscureText: !showPassword,
                      onChanged: (passwordinput) {
                        setState(() {
                          password = passwordinput.trim();
                        });
                      },
                      decoration: const InputDecoration.collapsed(
                        // labelText: 'Email address',
                        border: InputBorder.none,

                        // errorText: validmail(email),
                        hintText: ' ',
                      ),
                    ),
                  ),
                  !showPassword
                      ? IconButton(
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() => {
                                  showPassword = !showPassword,
                                });
                          })
                      : IconButton(
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() => {
                                  showPassword = !showPassword,
                                });
                          })
                ],
              )),
          hspacer(15),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Color(0xff121212),
                      fontFamily: 'Firma',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'I agree to the ',
                    ),
                    TextSpan(
                        text: 'Terms and Privacy ',
                        style: TextStyle(color: blue)),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Consumer(builder: (_, WidgetRef ref, __) {
            return GestureDetector(
                onTap: () async {
                  final authj = ref.watch(firebaseAuthProvider);
                  try {
                    final result = await authj.signInWithEmailAndPassword(
                        email: email!.inputText!, password: password);
                    ref.read(authName.notifier).state =
                        result.user!.displayName ?? 'User';
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'wrong-password') {
                      errorAlert('Wrong Password', context);
                    } else {
                      errorAlert('Something went wrong', context);
                    }
                  }
                },
                child: button(commonText('Login', white), blue));
          }),
          hspacer(10),
          Center(
            child: InkWell(
              onTap: () {
                nav(
                    context,
                    const ConditionAuth(
                      widget: SignupScreen(),
                    ));
              },
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: blue,
                      fontSize: 12,
                      fontFamily: 'Moderat',
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Don't have an account?",
                    ),
                    TextSpan(text: ' Sign up', style: TextStyle(color: blue)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
