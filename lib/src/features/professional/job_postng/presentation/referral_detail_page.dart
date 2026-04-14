import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

class ReferralDetailPage extends StatelessWidget {
  final ReferralApplication application;

  const ReferralDetailPage({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final user = application.applicant ?? const User();

    final name = user.name ?? "-";
    final email = user.email ?? "-";
    final phone = user.phone ?? "-";
    final college = user.college ?? "-";
    final jobTitle = application.jobTitle ?? "-";
    final match =
        application.matchScore != null ? "${application.matchScore}%" : "-";

final String status = application.statusText ?? "-";

    final skills = application.skills ?? [];

    return ChangeNotifierProvider(
      create: (_) => PostedJobApplicationViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
      
        body: Consumer<PostedJobApplicationViewModel>(
          builder: (context, vm, _) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  /// 🔥 JOB SECTION
                  _sectionCard(
                    title: "JOB APPLIED FOR",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobTitle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 8),

                        /// ✅ STATUS CHIP
                        _statusChip(status),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// 🔥 CANDIDATE DETAILS
                  _sectionCard(
                    title: "CANDIDATE DETAILS",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.kGreen,
                              child: Text(
                                name.isNotEmpty ? name[0] : "U",
                                style:
                                    const TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        _infoRow("Email", email),
                        _infoRow("Phone", phone),
                        _infoRow("College", college),
                        _infoRow("Match Score", match),

                        const SizedBox(height: 10),

                        /// SKILLS
                        if (skills.isNotEmpty)
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: skills
                                .map<Widget>((s) => _chip(s))
                                .toList(),
                          )
                        else
                          const Text("-",
                              style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),

                  const Spacer(),

                  /// 🔥 ACTIONS BASED ON STATUS
                  _actions(context, vm, status),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// 🔥 STATUS CHIP
  Widget _statusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _statusColor(status).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _statusColor(status),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 🔥 STATUS COLOR
  Color _statusColor(String status) {
    switch (status) {
      case "Accepted":
        return Colors.green;
      case "Referred To Company":
        return Colors.blue;
      case "Application Sent":
        return Colors.orange;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  /// 🔥 ACTION BUTTONS (SMART)
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
              ? Colors.blue.withOpacity(0.3) // selected state
              : AppColors.kGreen,
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () async {
          await vm.updateApplicationStatus(
            id: id,
            status: ApplicationStatus.referred, // 🔥 API value
          );
        },
        child:  Text("Refer Candidate",style: TextStyle(color: AppColors.white),),
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
        },
        child:  Text("Accept",style: TextStyle(color: AppColors.white),),
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
        },
        child:  Text("Reject Request",style: TextStyle(color: AppColors.white),),
      ),
    ],
  );
}

  /// 🔥 CARD
  Widget _sectionCard({required String title, required Widget child}) {
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
                  color: Colors.green, fontSize: 12)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text("$label: ",
              style: const TextStyle(color: Colors.grey)),
          Expanded(
            child: Text(
              value.isNotEmpty ? value : "-",
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

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
        style: TextStyle(
            color: AppColors.kGreen, fontSize: 11),
      ),
    );
  }
}