import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_ui/common/widgets/error_screen.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));

    case OtpScreen.routerName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: ((context) => OtpScreen(
                verificationId: verificationId,
              )));

    case UserInformationScreen.routerName:
      return MaterialPageRoute(
          builder: ((context) => const UserInformationScreen()));

    case SelectContactsScreen.routerName:
      return MaterialPageRoute(
          builder: ((context) => const SelectContactsScreen()));

    case MobileChatScreen.routerName:
      return MaterialPageRoute(
          builder: ((context) => const MobileChatScreen()));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(
                  error: "This page does't not exits",
                ),
              ));
  }
}
