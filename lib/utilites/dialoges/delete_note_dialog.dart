import 'package:flutter/material.dart';

import '../routes.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Note"),
          content: const Text("Are you sure you want to delete the note?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes")),
          ],
        );
      }).then((value) => value ?? false);
}
