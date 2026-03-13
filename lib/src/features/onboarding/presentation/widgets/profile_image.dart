import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/common/index.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    required this.imagePath,
    required this.onImageSelected,
    super.key,
  });

  final String imagePath;
  final Function(XFile) onImageSelected;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ValueNotifier<XFile?> _pickedFile = ValueNotifier<XFile?>(null);

  @override
  Widget build(BuildContext context) {
    final image = widget.imagePath;
    final isNetworkImage = widget.imagePath.startsWith('http');

    return ValueListenableBuilder(
      valueListenable: _pickedFile,
      builder: (_, pickedFile, _) => Container(
        height: 80,
        width: 80,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: GestureDetector(
          onTap: () async {
            final file = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );

            if (file != null) {
              _pickedFile.value = file;
              widget.onImageSelected.call(file);
            }
          },
          child: Center(
            child: pickedFile != null
                ? Image.file(
                    File(pickedFile.path),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  )
                : isNetworkImage
                ? Image.network(image, height: 80, width: 80, fit: BoxFit.cover)
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt, size: 24, color: Colors.white),
                      Text(
                        'Upload',
                        style: AppTextStyles.s14W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
