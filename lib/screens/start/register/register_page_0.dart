import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_peach/screens/start/start_screen.dart';
import 'package:project_peach/widgets/custom_login_button.dart';
import 'package:project_peach/widgets/custom_progress_indicator.dart';
import 'package:project_peach/widgets/palette.dart';

class EnterVerificationCodePage extends StatelessWidget {
  final String email;

  EnterVerificationCodePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: CustomProgressIndicator(
              index: 40,
              total: 100,
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            left: 10,
            child: Container(
              padding: const EdgeInsets.only(top: 90,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '처음이시군요!',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize:40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize:40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.peachColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.peachColor),
                      ),
                    ),
                    onChanged: (value) {
                      // 입력한 값에 따라 밑줄 색 변경 또는 추가 로직 구현
                      // ...
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    '본인 인증을 위한 코드를 보내드렸어요.',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize:15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      text:'혹시 메일이 오지 않았나요?',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize:15,
                        color: Palette.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.red,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
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
                print('next button clicked!');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>StartPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}