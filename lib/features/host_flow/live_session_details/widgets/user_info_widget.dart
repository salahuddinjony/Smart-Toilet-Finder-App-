import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(IconPath.lotionsIcon),
      ),
      title: const Text(
        'Cody Fisher',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.3,
          color: Color(0xff000000),
        ),
      ),
      subtitle: const Text(
        'Guest',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xff7F7F7F),
        ),
      ),
    );
  }
}
