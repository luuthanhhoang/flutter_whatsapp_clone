import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/colors.dart';

class OtpScreen extends ConsumerWidget {
  static const String routerName = '/otp-screen';
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Xác nhận OTP"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: size.width * 0.85,
              child: const Text(
                "Chúng tôi đã gửi mã xác nhận đến số điện thoại của bạn",
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: size.width * 0.4,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintText: "- - - - - -", hintStyle: TextStyle(fontSize: 30)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOTP(ref, context, value.trim());
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
