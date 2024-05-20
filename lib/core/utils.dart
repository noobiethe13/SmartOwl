import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  try {
    final scaffoldContext = findRootScaffoldContext(context);
    ScaffoldMessenger.of(scaffoldContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  } catch (e) {
    debugPrint('Error: $e');
  }
}

BuildContext findRootScaffoldContext(BuildContext context) {
  BuildContext? scaffoldContext = context;
  while (scaffoldContext != null) {
    if (scaffoldContext.widget is Scaffold) {
      return scaffoldContext;
    }
    scaffoldContext = scaffoldContext.findAncestorStateOfType<ScaffoldState>()?.context;
  }
  throw Exception('No Scaffold ancestor found.');
}


Future<FilePickerResult?> pickImage() async {
  final image = await FilePicker.platform.pickFiles(type: FileType.image);

  return image;
}
