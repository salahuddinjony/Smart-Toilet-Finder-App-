import 'package:flutter/material.dart';

import '../screen/edit_profile_screen.dart';

Widget buildPersonalInformationSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                _showEditProfile(context);
              },
              child: Row(
                children: [
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.edit, size: 16, color: Colors.red.shade400),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Information Items
        _buildInfoItem(
          icon: Icons.person_outline,
          label: 'Name',
          value: 'Melton Terry',
        ),

        const SizedBox(height: 20),

        _buildInfoItem(
          icon: Icons.email_outlined,
          label: 'Email',
          value: 'terrymelton123@gmail.com',
        ),

        const SizedBox(height: 20),

        _buildInfoItem(
          icon: Icons.phone_outlined,
          label: 'Phone No',
          value: '+123 456 789 00',
        ),

        const SizedBox(height: 20),

        _buildInfoItem(
          icon: Icons.location_on_outlined,
          label: 'Address',
          value: 'Central Station, Downtown,\nNew York',
        ),
      ],
    ),
  );
}

Widget _buildInfoItem({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF00BCD4).withValues(alpha: .1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF00BCD4), size: 20),
      ),

      const SizedBox(width: 16),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

void _showEditProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const EditProfileScreen()),
  );
}
