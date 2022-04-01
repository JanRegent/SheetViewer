import 'package:fluent_ui/fluent_ui.dart';

void okdialog1(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text('Delete file permanently?'),
          content: const Text(
            'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
          ),
          actions: [
            Button(
              child: const Text('Delete'),
              autofocus: true,
              onPressed: () {
                // Delete file here
              },
            ),
            Button(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}
