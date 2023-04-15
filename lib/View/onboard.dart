import 'package:flutter/material.dart';
import 'package:newapp/View/Auth/login.dart';
import 'package:newapp/View/style.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> with Ui {
  int pageNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (val) {
                    setState(() {
                      pageNo = val;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/onboardnew.png'),
                        Padding(
                          padding: pSymmetric(20, 0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Color(0xff121212),
                                  fontFamily: 'Moderat',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'Get the Latest and Updated',
                                ),
                                TextSpan(
                                    text: ' Articles ',
                                    style: TextStyle(color: blue)),
                                const TextSpan(
                                  text: 'Easily with Us',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 300,
                            child: inputCenter(
                              black83,
                              14,
                              "Come on, get the latest articles and updates every day and add insight, your trusted knowledge with us",
                              w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Container(
                          width: 8,
                          height: 8,
                          margin: pSymmetric(0, 3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == pageNo ? blue : grey),
                        )),
              ),
              Padding(
                padding: pSymmetric(15, 0),
                child: GestureDetector(
                  onTap: () {
                    nav(
                        context,
                        const ConditionAuth(
                          widget: LoginScreen(),
                        ));
                  },
                  child: SizedBox(
                      width: 200,
                      child: button(commonText('Get Started', white), blue)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
