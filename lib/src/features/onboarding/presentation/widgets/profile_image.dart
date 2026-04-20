import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/common/index.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    required this.imagePath,
    this.onImageSelected, // ✅ now OPTIONAL
    this.size = 80, // ✅ flexible size
    super.key,
  });

  final String imagePath;
  final Function(XFile)? onImageSelected; // ✅ nullable
  final double size;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ValueNotifier<XFile?> _pickedFile = ValueNotifier<XFile?>(null);

  @override
  Widget build(BuildContext context) {
    final image = widget.imagePath;
    final isNetworkImage = image.startsWith('http');

    final isEditable = widget.onImageSelected != null; // ✅ key logic

    return ValueListenableBuilder<XFile?>(
      valueListenable: _pickedFile,
      builder: (_, pickedFile, __) => Container(
        height: widget.size,
        width: widget.size,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),

        /// 🔥 Only clickable if editable
        child: GestureDetector(
          onTap: !isEditable
              ? null
              : () async {
                  final file = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );

                  if (file != null) {
                    _pickedFile.value = file;
                    widget.onImageSelected!(file);
                  }
                },

          child: Center(
            child: pickedFile != null
                ? Image.file(
                    File(pickedFile.path),
                    height: widget.size,
                    width: widget.size,
                    fit: BoxFit.cover,
                  )

                /// 🔥 NETWORK IMAGE
                : isNetworkImage && image.isNotEmpty
                    ? Image.network(
                        image,
                        height: widget.size,
                        width: widget.size,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                      )

                /// 🔥 EMPTY STATE
                : _placeholder(isEditable),
          ),
        ),
      ),
    );
  }

  /// 🔥 Placeholder UI
  Widget _placeholder([bool showUpload = true]) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          showUpload ? Icons.camera_alt : Icons.person,
          size: 24,
          color: Colors.white,
        ),
        if (showUpload)
          Text(
            'Upload',
            style: AppTextStyles.s14W600.copyWith(color: Colors.white),
          ),
      ],
    );
  }
}