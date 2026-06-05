import 'package:flutter/material.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import 'add_edit_profile_view.dart';

class EditProfileSectionsPage extends StatefulWidget {
  const EditProfileSectionsPage({required this.user, super.key});

  final User user;

  @override
  State<EditProfileSectionsPage> createState() =>
      _EditProfileSectionsPageState();
}

class _EditProfileSectionsPageState extends State<EditProfileSectionsPage> {
  bool hasUpdated = false;

  @override
  Widget build(BuildContext context) {
    final sections = [
      'Basic',
      'Career',
      'Skills',
      'Experience',
      'International Experience',
      'Leadership Experience',
      'Employee Preferences',
      'Domain Knowledge',
      'Tools & Platforms',
      'Industry',
      'Links',
      'Achievements',
      'Publications',
      'Languages Known',
      'Education',
    ];

    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        Navigator.pop(context, hasUpdated);
      },

      child: Scaffold(
        backgroundColor: AppColors.kBg,

        appBar: RAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),

            onPressed: () {
              Navigator.pop(context, hasUpdated);
            },
          ),

          title: Text(
            'Edit Profile',

            style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
          ),
        ),

        body: ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount: sections.length,

          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) => AddEditProfileView(
                      user: getIt<AppStateProvider>().user ?? widget.user,

                      initialStep: index,
                    ),
                  ),
                );

                if (result == true) {
                  hasUpdated = true;

                  await getIt<AppStateProvider>().getUserDetails();

                  if (mounted) {
                    setState(() {});
                  }
                }
              },

              child: Container(
                margin: const EdgeInsets.only(bottom: 10),

                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.kCard,

                  borderRadius: BorderRadius.circular(14),

                  border: Border.all(color: AppColors.kBorder),
                ),

                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, color: AppColors.kGreen),

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
      ),
    );
  }
}
