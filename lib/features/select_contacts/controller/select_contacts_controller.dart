import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/select_contacts/repository/select_contacts_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactsRepository = ref.watch(selectContactsRepositoryProvider);

  return selectContactsRepository.getContacts();
});

final selectedContactsControllerProvider = Provider((ref) {
  final selectContactsRepository = ref.watch(selectContactsRepositoryProvider);
  return SelectContactsController(
      ref: ref, selectContactsRepository: selectContactsRepository);
});

class SelectContactsController {
  final ProviderRef ref;
  final SelectContactsRepository selectContactsRepository;

  SelectContactsController(
      {required this.ref, required this.selectContactsRepository});

  void selectContact(Contact selectContact, BuildContext context) {
    selectContactsRepository.selectContact(selectContact, context);
  }
}
