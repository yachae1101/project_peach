import 'package:flutter/material.dart';
import 'package:project_peach/screens/start/login/login_page_0.dart';
import 'package:project_peach/screens/start/register/register_page_1.dart';
import 'package:project_peach/utils/check_validate.dart';
import 'package:project_peach/widgets/palette.dart';
import 'package:project_peach/widgets/custom_login_button.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  final _formKey = GlobalKey<FormState>();
  bool isSignUpScreen = true;
  String signUpText = '계정이 없으신가요?';
  String infoText = '로그인하실 이메일 주소를';
  String userEmail = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if(isSignUpScreen){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EnterPassword(email: userEmail)),
        );
      }
      if(!isSignUpScreen){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MakePassword(email: userEmail)),
          );
        }
      }
    }

  @override
  void initState(){
    super.initState();
    isSignUpScreen = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
                    text: TextSpan(
                      text: isSignUpScreen ? '로그인할 이메일 주소를' : '가입하실 이메일 주소를',
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    '입력해주세요',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            return CheckValidate().validateEmail(value!);
                          },
                          onSaved: (value) {
                            userEmail = value!;
                          },
                          onChanged: (value) {
                            userEmail = value!;
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
                              hintText: 'MMS',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Palette.textColor,
                              ),
                              contentPadding: EdgeInsets.all(10)),
                        )
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
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print('xasdsd');
                    setState(() {
                      isSignUpScreen = !isSignUpScreen;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: isSignUpScreen ? '계정이 없으신가요?' : '로그인 화면으로 이동하시겠습니까?',
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 15,
                        color: Palette.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.red,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ),
                CustomLoginButton(
                  text: '다음',
                  backgroundColor: Palette.peachColor,
                  onPressed: () {
                    _tryValidation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
