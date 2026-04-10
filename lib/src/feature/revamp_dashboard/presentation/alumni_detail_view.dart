import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class AlumniDetailView extends StatelessWidget {
  final List<Job> jobs;

  const AlumniDetailView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    final first = jobs.first;

    final name = first.candidatePosted?.name ?? "User";
    final college = first.candidatePosted?.college ?? "";
    final role = first.jobTitle ?? "Professional";
    final location = first.location?.join(", ") ?? "Location";

    final initials = name.isNotEmpty
        ? name.split(" ").map((e) => e[0]).take(2).join()
        : "U";

    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kBg,
        elevation: 0,
        title:  Text("Alumni Profile",style: TextStyle(color: AppColors.white),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔥 PROFILE CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Column(
                children: [
                  /// Avatar
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.kGreen,
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Name
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// Role + Company
                  Text(
                    "$role at $college",
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  /// Location
                  Text(location, style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 6),

                  /// College line
                  Text(college, style: TextStyle(color: AppColors.kGreen)),

                  const SizedBox(height: 16),

                  /// 🔥 STATS ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statBox("0", "Response"),
                      _statBox("${jobs.length}", "Open Jobs"),
                      _statBox("●", "Hiring", isDot: true),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 OPEN POSITIONS
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Open Positions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ...jobs.map((job) => _jobTile(context,job)).toList(),
          ],
        ),
      ),
    );
  }

  /// 🔥 STAT BOX
  Widget _statBox(String value, String label, {bool isDot = false}) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          isDot
              ? Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(
                    color: isDot ? Colors.green : Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
Widget _jobTile(BuildContext context, Job job) {
  final title = job.jobTitle ?? "Role";

  final company =
      job.companyName ??
      job.candidatePosted?.college ??
      "Company";

  final pkg = job.packageDetails;

  String salary = "";

  if (pkg != null) {
    if ((pkg.fixedPay ?? 0) > 0) {
      salary = "₹${_formatSalary(pkg.fixedPay ?? 0)}";
    } else if ((pkg.totalCTC ?? 0) > 0) {
      salary = "₹${_formatSalary(pkg.totalCTC ?? 0)}";
    }
  }

  return GestureDetector(
    onTap: () async {
      /// 🔥 SAME LOGIC AS DASHBOARD
      if (job.jobType == "Internship") {
        await context.pushNamed(
          RouteNames.internshipDetail,
          extra: job,
        );
      } else if (job.jobType == "Referral") {
        await context.pushNamed(
          RouteNames.referralDetail,
          extra: job.id,
        );
      } else {
        await context.pushNamed(
          RouteNames.jobDetail,
          extra: job,
        );
      }
    },

    child: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              salary.isNotEmpty ? "$company • $salary" : company,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
 String _formatSalary(num amount) {
  if (amount >= 10000000) {
    return "${(amount / 10000000).toStringAsFixed(0)} Cr";
  } else if (amount >= 100000) {
    return "${(amount / 100000).toStringAsFixed(0)} LPA";
  } else if (amount >= 1000) {
    return "${(amount / 1000).toStringAsFixed(0)}K";
  }
  return amount.toString();
}
}
