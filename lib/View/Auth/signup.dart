import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/View/Auth/commonwidget.dart';
import 'package:newapp/View/formwidget.dart';
import 'package:newapp/View/style.dart';

import '../../Provider/authprovider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with Ui, CommonAuthWidget {
  FormWidget? email;
  FormWidget? name;
  bool isChecked = false;

  String password = '';
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    email = FormWidget(inputText: '', text: "Email Address", context: context);

    name = FormWidget(inputText: '', text: "Name", context: context);
    name!.hint = 'Adeboye Adeyemi';
    email!.hint = 'goradeveloper@gmail.com';
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
          header('Sign Up'),
          oAuthButton(context, 'Sign up with Google'),
          Divider(
            color: numb,
          ),
          name!.textField(),
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
                        hintText: 'At least 8 character',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  4,
                  (index) => Container(
                        width: (width(context) - 70) / 4,
                        height: 2,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: numb, borderRadius: borderR(5)),
                      ))),
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
                text: const TextSpan(
                  style: TextStyle(
                      color: Color(0xff121212),
                      fontFamily: 'Firma',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'I agree to the ',
                    ),
                    TextSpan(
                        text: 'Terms and Privacy ',
                        style: TextStyle(color: Color(0xff5474FF))),
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
                    UserCredential userCredential =
                        await authj.createUserWithEmailAndPassword(
                            email: 'yemtech0612@gmail.com',
                            password: 'password');
                    print(userCredential.user!.email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      errorAlert('User not found', context);
                    }
                    if (e.code == 'invalid-email') {
                      errorAlert('Invalid Email', context);
                    } else if (e.code == 'wrong-password') {
                      errorAlert('Wrong password', context);
                    } else {
                      errorAlert(
                          'Error: Enter Input/Check your Connection', context);
                    }
                  }
                },
                child: button(commonText('Sign up', white), blue));
          }),
          hspacer(15),
          Center(
            child: InkWell(
              onTap: () {
                popBack(context);
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
                      text: 'Already have an account? ',
                    ),
                    TextSpan(text: 'Login', style: TextStyle(color: blue)),
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
