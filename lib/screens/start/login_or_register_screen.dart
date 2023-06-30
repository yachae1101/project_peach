import 'package:flutter/material.dart';
import 'package:project_peach/screens/start/start_screen.dart';
import 'package:project_peach/widgets/palette.dart';
import 'package:project_peach/widgets/custom_login_button.dart';
import 'package:project_peach/widgets/custom_progress_indicator.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key?key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister>{

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
              padding: const EdgeInsets.only(top: 90,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '이메일 주소를',
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
                    '입력해주세요',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize:40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty || value!.contains('@')){
                              return 'please enter a valid email address.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Palette.peachColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                BorderSide(color: Palette.peachColor),
                            ),
                            hintText:'MMS',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Palette.textColor,
                            ),
                            contentPadding: EdgeInsets.all(10)
                          ),
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
            child: CustomLoginButton(
              text: '다음',
              backgroundColor: Palette.peachColor,
              onPressed: (){
                print('next button clicked!');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>StartPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}