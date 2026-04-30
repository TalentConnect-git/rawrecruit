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
];

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
                  builder: (_) =>
                      AddEditProfileView(
                        user: user,
                        initialStep: index,
                      ),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.only(
                bottom: 14,
              ),

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xFF111827),

                borderRadius:
                    BorderRadius.circular(18),

                border: Border.all(
                  color: Colors.white.withOpacity(
                    0.06,
                  ),
                ),
              ),

              child: Row(
                children: [

                  Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: AppColors.kGreen,

                      borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                    ),

                    child: Center(
                      child: Text(
                        '${index + 1}',

                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Text(
                      sections[index],

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
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