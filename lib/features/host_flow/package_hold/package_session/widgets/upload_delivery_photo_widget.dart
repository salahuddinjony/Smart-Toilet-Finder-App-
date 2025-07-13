import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDeliveryPhotoWidget extends StatefulWidget {
  const UploadDeliveryPhotoWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadDeliveryPhotoWidgetState createState() =>
      _UploadDeliveryPhotoWidgetState();
}

class _UploadDeliveryPhotoWidgetState extends State<UploadDeliveryPhotoWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFC4C4C4), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, color: Colors.grey, size: 40),
          SizedBox(height: 10),
          Text(
            'Upload Delivery Photo (Optional)',
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7F7F7F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                'Choose Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
