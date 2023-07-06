import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_peach/providers/global_key.dart';
import 'package:project_peach/screens/main/main_page.dart';
import 'package:project_peach/utils/check_validate.dart';
import 'package:project_peach/widgets/custom_login_button.dart';
import 'package:project_peach/widgets/custom_progress_indicator.dart';
import 'package:project_peach/widgets/palette.dart';
import 'package:provider/provider.dart';

class MakePassword extends StatefulWidget {
  final String email;

  const MakePassword({super.key, required this.email});

  @override
  // ignore: library_private_types_in_public_api
  _MakePasswordState createState() => _MakePasswordState();
}

class _MakePasswordState extends State<MakePassword> {
  final _formKey = GlobalKey<FormState>();
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
      print('이메일 인증 이메일이 전송되었습니다.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: CustomProgressIndicator(
              index: 20,
              total: 100,
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            left: 10,
            child: Container(
              padding: const EdgeInsets.only(top: 90, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '비밀번호를',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    '입력해 주세요',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            return CheckValidate().validatePassword(value);
                          },
                          onSaved: (value) {
                            userPassword = value!;
                          },
                          onChanged: (value) {
                            userPassword = value!;
                          },
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.peachColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.peachColor),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Palette.textColor,
                              ),
                              contentPadding: EdgeInsets.all(10)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400,
            right: 0,
            left: 0,
            child: CustomLoginButton(
              text: '다음',
              backgroundColor: Palette.peachColor,
              onPressed: () async {
                _tryValidation();
                try {
                  final newUser =
                      await Provider.of<GlobalKeyOf>(context, listen: false)
                          .authentication
                          .createUserWithEmailAndPassword(
                            email: widget.email,
                            password: userPassword,
                          );
                  await sendEmailVerification();
                  if (newUser.user != null) {
                    print(FirebaseAuth.instance.currentUser!.emailVerified);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MainPage();
                      }),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
