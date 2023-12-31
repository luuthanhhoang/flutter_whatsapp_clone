import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/models/user_model.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';

final selectContactsRepositoryProvider = Provider(
    (ref) => SelectContactsRepository(firestore: FirebaseFirestore.instance));

class SelectContactsRepository {
  final FirebaseFirestore firestore;

  SelectContactsRepository({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNum =
            selectedContact.phones[0].number.replaceAll(' ', '');

        if (userData.phoneNumber == selectedPhoneNum) {
          isFound = true;
          Navigator.pushNamed(context, MobileChatScreen.routerName);
        }
      }

      if (!isFound) {
        showSnackBar(context: context, content: "Không tìm thấy liên hệ này!");
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
