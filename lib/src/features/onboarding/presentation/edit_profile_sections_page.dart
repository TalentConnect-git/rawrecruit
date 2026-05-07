import 'package:flutter/material.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import 'add_edit_profile_view.dart';

class EditProfileSectionsPage extends StatelessWidget {
  const EditProfileSectionsPage({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final sections = [
      'Basic',
      'Education',
      'Links',
      'Career',
      'Employee Preferences',
      'Languages Known',
      'Job Roles',
      'Skills',
      'Domain Knowledge',
      'Industry',
      'Tools & Platforms',
      'Publications',
      'Achievements',
'Experience',
'Leadership Experience',
'International Experience',    ];

    return Scaffold(
      backgroundColor: AppColors.kBg,

      appBar: RAppBar(
        title: Text(
          'Edit Profile',
          style: AppTextStyles.s16W600.copyWith(
            color: AppColors.white,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,

        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddEditProfileView(
                    user: user,
                    initialStep: index,
                  ),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColors.kCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.kBorder,
                ),
              ),

              child: Row(
                children: [

                  Icon(
                    Icons.edit_outlined,
                    color: AppColors.kGreen,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      sections[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}