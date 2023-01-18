const String codeSnippetGitsImagePicker = '''import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../widgets/gits_spacing.dart';
import '../gits_button/gits_button.dart';

class ImagePickerService {
  File? imageFile;
  ImagePickerService({this.imageFile});

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();

    var picture =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    imageFile = File(picture!.path);
    if (imageFile != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(imageFile);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(null);
    }
  }

  _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    PermissionStatus status = await Permission.camera.status;
    if (status.isPermanentlyDenied) return openAppSettings();
    status = await Permission.camera.request();
    if (status.isDenied) return;

    var picture =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    imageFile = File(picture!.path);
    if (imageFile != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(imageFile);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(null);
    }
  }

  Future dialogImageEditProfil(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const GitsSpacing.vertical12(),
                Text(
                  'Ambil Gambar',
                  textAlign: TextAlign.center,
                  style: context.titleLarge,
                ),
                const GitsSpacing.vertical16(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Pilih salah satu dari Kamera atau Galeri',
                    textAlign: TextAlign.center,
                    style: context.bodyMedium,
                  ),
                ),
                const GitsSpacing.vertical28(),
                SizedBox(
                  width: double.infinity,
                  child: GitsButton.elevated(
                    text: "Galeri",
                    onPressed: () => _openGallery(context),
                  ),
                ),
                const GitsSpacing.vertical12(),
                SizedBox(
                  width: double.infinity,
                  child: GitsButton.outlined(
                    text: "Kamera",
                    onPressed: () => _openCamera(context),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
''';
const String codeSnippetExampleGitsImagePicker = '''class ExampleGitsImagePicker extends StatefulWidget {
  const ExampleGitsImagePicker({super.key});

  @override
  State<ExampleGitsImagePicker> createState() => _ExampleGitsImagePickerState();
}

class _ExampleGitsImagePickerState extends State<ExampleGitsImagePicker> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Gits Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GitsButton.elevated(
              text: "Image Picker",
              onPressed: () async {
                File? result =
                    await ImagePickerService().dialogImageEditProfil(context);
                setState(() {
                  file = result;
                });
              },
            ),
            const GitsSpacing.vertical16(),
            Text("Result", style: context.titleLarge),
            const GitsSpacing.vertical12(),
            (file != null) ? Image.file(file!) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}''';
