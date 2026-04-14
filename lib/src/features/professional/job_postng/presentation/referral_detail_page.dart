
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

class ReferralDetailPage extends StatelessWidget {
  final ReferralApplication application;

  const ReferralDetailPage({super.key, required this.application});

  String safe(dynamic val) {
    if (val == null) return "-";
    if (val.toString().trim().isEmpty) return "-";
    if (val.toString() == "null") return "-";
    return val.toString();
  }

  Future<void> openUrl(String url) async {
    if (url == "-" || url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = application.applicant ?? const User();

    final name = safe(user.name);
    final email = safe(user.email);
    final phone = safe(user.phone);
    final college = safe(user.college);

    final gender = safe(user.gender);
    final degree = safe(user.degree);
    final specialization = safe(user.specialization);
    final graduation = safe(user.yearOfGraduation);
    final cgpa = safe(user.cgpa);

    final linkedin = safe(user.linkedin);
    final github = safe(user.github);
    final portfolio = safe(user.portfolio);
    final resume = safe(user.resume);

    final jobTitle = safe(application.jobTitle);
    final status = safe(application.statusText);
    final match = application.matchScore != null
        ? "${application.matchScore}%"
        : "-";

final skills = application.applicant?.skills ?? [];
    return ChangeNotifierProvider(
      create: (_) => PostedJobApplicationViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          title:  Text("Application Details",style: TextStyle(color :AppColors.white),),
        ),
        body: Consumer<PostedJobApplicationViewModel>(
          builder: (context, vm, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  // /// 🔥 JOB INFO
                  // _section(
                  //   "JOB DETAILS",
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       _info("Job Title", jobTitle),
                  //       const SizedBox(height: 6),
                  //       _statusChip(status),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 10),

                  /// 🔥 BASIC INFO
                  _section(
                    "CANDIDATE INFO",
                    Column(
                      children: [
                        _info("Name", name),
                        _info("Email", email),
                        _info("Phone", phone),
                        _info("College", college),
                        _info("Gender", gender),
                        _info("Degree", degree),
                        _info("Specialization", specialization),
                        _info("Graduation Year", graduation),
                        _info("CGPA", cgpa),
                        _info("Match Score", match),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// 🔥 LINKS
                  _section(
                    "LINKS",
                    Column(
                      children: [
                        _linkRow("LinkedIn", linkedin),
                        _linkRow("GitHub", github),
                        _linkRow("Portfolio", portfolio),
                        _linkRow("Resume", resume),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// 🔥 SKILLS
                  _section(
                    "SKILLS",
                    skills.isNotEmpty
                        ? Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children:
                                skills.map((e) => _chip(e)).toList(),
                          )
                        : const Text("-",
                            style: TextStyle(color: Colors.grey)),
                  ),

                  const SizedBox(height: 20),

                  /// 🔥 ACTION BUTTONS
                  _actions(context, vm, status),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// 🔥 SECTION CARD
  Widget _section(String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  /// 🔥 INFO ROW
  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text("$label: ",
              style: const TextStyle(color: Colors.grey)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: value == "-" ? Colors.grey : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 LINK ROW
  Widget _linkRow(String label, String url) {
    return GestureDetector(
      onTap: () => openUrl(url),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Text("$label: ",
                style: const TextStyle(color: Colors.grey)),
            Expanded(
              child: Text(
                url,
                style: TextStyle(
                  color: url == "-" ? Colors.grey : Colors.blue,
                  decoration:
                      url == "-" ? null : TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 CHIP
  Widget _chip(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.kGreen.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: AppColors.kGreen, fontSize: 11),
      ),
    );
  }

  /// 🔥 STATUS CHIP
  Widget _statusChip(String status) {
    Color color;

    switch (status) {
      case "Accepted":
        color = Colors.green;
        break;
      case "Referred To Company":
        color = Colors.blue;
        break;
      case "Application Sent":
        color = Colors.orange;
        break;
      case "Rejected":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
Widget _actions(
  BuildContext context,
  PostedJobApplicationViewModel vm,
  String status,
) {
  final id = application.id ?? "";

  return Column(
    children: [

      /// 🔵 REFER
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: status == "Referred To Company"
              ? Colors.blue.withOpacity(0.3)
              : AppColors.kGreen,
          minimumSize: const Size(double.infinity, 50),
        ),
       onPressed: () async {
  await vm.updateApplicationStatus(
    id: id,
    status: ApplicationStatus.referred,
  );

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Status updated successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }
},
        child: Text(
          "Refer Candidate",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      const SizedBox(height: 10),

      /// 🟢 ACCEPT
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: status == "Accepted"
              ? AppColors.kGreen.withOpacity(0.3)
              : AppColors.kGreen,
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () async {
  await vm.updateApplicationStatus(
    id: id,
    status: ApplicationStatus.accepted,
  );

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Status updated successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }
},
        child: Text(
          "Accept",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      const SizedBox(height: 10),

      /// 🔴 REJECT
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: status == "Rejected"
              ? Colors.red.withOpacity(0.3)
              : Colors.grey[800],
          minimumSize: const Size(double.infinity, 50),
        ),
      onPressed: () async {
  await vm.updateApplicationStatus(
    id: id,
    status: ApplicationStatus.rejected,
  );

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Status updated successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }
},
        child: Text(
          "Reject Request",
          style: TextStyle(color: AppColors.white),
        ),
      ),
    ],
  );
}
}

