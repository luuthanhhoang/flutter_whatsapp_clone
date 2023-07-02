import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Wellcome to Whatsapp",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Image.asset(
            "assets/bg.png",
            width: 340,
            height: 340,
            color: tabColor,
          ),
          SizedBox(
            height: size.height / 9,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Tham gia Whatsapp tức là bạn đồng ý với điều khoản chính sách của chúng tôi",
              style: TextStyle(
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                  text: 'ĐỒNG Ý VÀ TIẾP TỤC',
                  onPressed: () {
                    navigateToLoginScreen(context);
                  }))
        ],
      )),
    );
  }
}
