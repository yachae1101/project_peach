import 'package:flutter/material.dart';
import 'package:project_peach/screens/start/login_or_register_screen.dart';
import 'package:project_peach/widgets/palette.dart';
import 'package:project_peach/widgets/custom_login_button.dart';

class StartPage extends StatefulWidget{
  const StartPage({Key? key}) : super(key:key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isRegiScreen = true; // 초기 계정 없을 때 화면

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_peach.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 0.0,left:5.0),
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '당신만을 위한 문화생활,',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize:20,
                        color: Palette.peachColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Peach',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize:40,
                      color: Palette.peachColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 700,
            right: 0,
            left: 0,
            child: CustomLoginButton(
              text: '시작하기',
              backgroundColor: Palette.peachColor,
              onPressed: (){
                print('Login button clicked!');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>LoginOrRegister()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}