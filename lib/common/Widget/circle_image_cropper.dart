import 'dart:io';
import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rainbow_new/common/Widget/text_styles.dart';
import 'package:rainbow_new/utils/color_res.dart';

class CircleImageCropper extends StatefulWidget {
  final Function(File file) onCropped;
  final File image;

  const CircleImageCropper(
      {Key? key, required this.onCropped, required this.image})
      : super(key: key);

  @override
  State<CircleImageCropper> createState() => _CircleImageCropperState();
}

class _CircleImageCropperState extends State<CircleImageCropper> {
  // final ImagePicker _picker = ImagePicker();

  final GlobalKey _cropperKey = GlobalKey(debugLabel: 'cropperKey');

  // Uint8List? _croppedImage;

  final OverlayType _overlayType = OverlayType.circle;

  final int _rotationTurns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.08),
            Text("Crop your Selfie",
                style: textStyleFont26WhiteBold.copyWith(fontSize: 24)),
            SizedBox(height: Get.height * 0.1),
            Cropper(
              cropperKey: _cropperKey,
              overlayType: _overlayType,
              rotationTurns: _rotationTurns,
              image: Image.file(widget.image),
              // aspectRatio: Get.width / Get.height,
              onScaleStart: (details) {
                // todo: define started action.
              },
              onScaleUpdate: (details) {
                // todo: define updated action.
              },
              onScaleEnd: (details) {
                // todo: define ended action.
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorRes.color_4F359B,
        onPressed: () async {
          final image = await Cropper.crop(
            cropperKey: _cropperKey,
          );
          if (image != null) {
            final Directory? directory = Platform.isIOS
                ? await getApplicationDocumentsDirectory()
                : await getExternalStorageDirectory();
            File file = File(
                "${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.jpg");

            await file.writeAsBytes(image);
            return widget.onCropped(file);
          }
        },
        child: const Icon(
          Icons.arrow_forward_rounded,
          color: ColorRes.white,
        ),
      ),
    );
  }
}
