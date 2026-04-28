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
    final skills = first.candidatePosted?.skills ?? ['Skill 1', 'Skill 2'];
final role = first.candidatePosted?.designation ??
    first.candidatePosted?.specialization ??
    first.jobTitle ??
    "Professional";    final location = first.location?.join(", ") ?? "Location";
    final referrals = first.candidatePosted?.referralJobs ?? [];
final company = first.candidatePosted?.currentCompany ?? "";
    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kBg,
        elevation: 0,
        title: Text("Alumni Profile", style: TextStyle(color: AppColors.white)),
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
                      name.getInitials,
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

                  const SizedBox(height: 2),
if (company.isNotEmpty)
  Text(
    company,
    style: const TextStyle(
      color: Colors.grey,
      fontSize: 13,
    ),
  ),
  
                  const SizedBox(height: 2),
                  /// College line
                  Text(college, style: TextStyle(color: AppColors.kGreen)),

                  const SizedBox(height: 6),

                  /// College line
                  _skillChip(
                    '${(first.candidatePosted?.emailVerified ?? false) ? 'Verified' : 'Unverified'} Professional',
                  ),

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

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                first.candidatePosted?.about ?? '-',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Skills & Domain",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [...skills.map((s) => _skillChip(s))],
                ),
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

            ...referrals.map((job) => _jobTile(context, job)).toList(),

            const SizedBox(height: 80),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () {
                  context.pushNamed(
                    RouteNames.chatUser,
                    extra: first.candidatePosted,
                  );
                },
                backgroundColor: AppColors.kGreen,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    Icon(Icons.message, color: AppColors.kBg),
                    Text(
                      'Message',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.kBg,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

  Widget _skillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: AppColors.white, width: 0.5),
        color: Color(0xff222222),
      ),
      child: Text(
        skill,
        style: AppTextStyles.s12W400.copyWith(color: AppColors.white),
      ),
    );
  }

  Widget _jobTile(BuildContext context, Job job) {
    final title = job.jobTitle ?? "Role";

final company = job.companyName?.isNotEmpty == true
    ? job.companyName!
    : job.candidatePosted?.currentCompany?.isNotEmpty == true
        ? job.candidatePosted!.currentCompany!
        : "Company";

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
          await context.pushNamed(RouteNames.internshipDetail, extra: job);
        } else if (job.jobType == "Referral") {
          await context.pushNamed(RouteNames.referralDetail, extra: job.id);
        } else {
          await context.pushNamed(RouteNames.jobDetail, extra: job);
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
                style: const TextStyle(color: Colors.grey, fontSize: 12),
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
