import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDetailsView extends StatelessWidget {
  final ReferralApplication application;

  const ApplicationDetailsView({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    final applicant = application.applicant;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Profile Image
            if (applicant?.profileImage != null)
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage(applicant!.profileImage!),
                ),
              ),

            const SizedBox(height: 20),

            /// Basic Info
            _buildTile("Name", applicant?.name),
            _buildTile("Email", applicant?.email),
            _buildTile("Phone", applicant?.phone),
            _buildTile("Gender", applicant?.gender),

            const Divider(),

            /// Professional Info
            _buildTile("Current Company", applicant?.currentCompany),
            _buildTile("Degree", applicant?.degree),
            _buildTile("College", applicant?.college),
            _buildTile("Experience Roles",
                applicant?.jobRoles?.join(", ")),
            _buildTile("Industry",
                applicant?.industry?.join(", ")),
            _buildTile("Skills",
                applicant?.skills?.join(", ")),

            const Divider(),

            /// Salary & Notice
            _buildTile("Current Salary",
                applicant?.currentSalaryAmount),
            _buildTile("Expected Salary",
                applicant?.expectedSalaryAmount),
            _buildTile("Notice Period",
                applicant?.noticePeriod),

            const Divider(),

            /// Resume
            if (applicant?.resume != null)
           TextButton(
  onPressed: () async {
    final resumeUrl = application.applicant?.resume;

    if (resumeUrl == null || resumeUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Resume not available")),
      );
      return;
    }

    final uri = Uri.parse(resumeUrl);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open resume")),
      );
    }
  },
  child: const Text("View Resume"),
),

            const SizedBox(height: 20),

            /// Current Status
            Text(
              "Current Status: ${application.currentStatus?.name}",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 130,
              child: Text("$title:",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}