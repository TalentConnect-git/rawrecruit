import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/alumni_detail_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AlumniDetailView extends StatefulWidget {
  final String alumniId;

  const AlumniDetailView({super.key, required this.alumniId});

  @override
  State<AlumniDetailView> createState() => _AlumniDetailViewState();
}

class _AlumniDetailViewState extends State<AlumniDetailView> {
  AlumniDetailViewModel alumniDetailViewModel = AlumniDetailViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await alumniDetailViewModel.getAlumniByid(
        widget.alumniId,
      );
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: alumniDetailViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Alumni Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: Consumer<AlumniDetailViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.alumni == null) {
              return const Center(
                child: Text(
                  "No data found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            final name = vm.alumni?.name ?? "User";

            final currentExperience =
                (vm.alumni?.experiences ?? [])
                    .where((e) => e.isCurrent == true)
                    .isNotEmpty
                ? vm.alumni?.experiences?.firstWhere((e) => e.isCurrent == true)
                : null;
            final currentEducation =
                (vm.alumni?.educations ?? [])
                    .where((e) => e.isCurrent == true)
                    .isNotEmpty
                ? vm.alumni!.educations!.firstWhere((e) => e.isCurrent == true)
                : ((vm.alumni?.educations ?? []).isNotEmpty
                      ? vm.alumni!.educations!.first
                      : null);

            final college = currentEducation?.college ?? '';

            /// Only show current experience
            final role = (currentExperience?.role ?? '').trim();
            final company = (currentExperience?.company ?? '').trim();

            final roleCompanyText = role.isNotEmpty && company.isNotEmpty
                ? "$role @ $company"
                : role.isNotEmpty
                ? role
                : company;

            /// LOCATION
            final location = (vm.alumni?.locations?.isNotEmpty ?? false)
                ? vm.alumni!.locations!
                      .where((e) => e.trim().isNotEmpty)
                      .join(", ")
                : '';
            final isHiring = vm.alumni?.referralJobs?.isNotEmpty ?? false;
            final currentStatus = vm.alumni?.status;
            final statusType = currentStatus?.type ?? '';

            String formattedStatus;

            switch (statusType) {
              case 'looking_job':
                formattedStatus = 'Looking for Job';
                break;
              case 'looking_internship':
                formattedStatus = 'Looking for Internship';
                break;
              case 'open_to_work':
                formattedStatus = 'Open to Work';
                break;
              case 'career_break':
                formattedStatus = 'Career Break';
                break;
              case 'preparing_exams':
                formattedStatus = 'Preparing for Exams';
                break;
              case 'not_looking':
                formattedStatus = 'Not Looking';
                break;
              case 'freelancing':
                formattedStatus = 'Freelancing';
                break;
              case 'building':
                formattedStatus = 'Building Something';
                break;
              default:
                formattedStatus = statusType
                    .replaceAll('_', ' ')
                    .split(' ')
                    .map(
                      (e) => e.isEmpty
                          ? e
                          : '${e[0].toUpperCase()}${e.substring(1)}',
                    )
                    .join(' ');
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// 🔥 COMPACT HEADER
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.kCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(.06)),
                    ),
                    child: Column(
                      children: [
                        /// TOP
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// AVATAR
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.kGreen,

                              backgroundImage:
                                  (vm.alumni?.profileImage ?? '').isNotEmpty
                                  ? NetworkImage(vm.alumni?.profileImage ?? '')
                                  : null,

                              child: (vm.alumni?.profileImage ?? '').isEmpty
                                  ? Text(
                                      name.getInitials,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    )
                                  : null,
                            ),

                            const SizedBox(width: 14),

                            /// INFO
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 6),

                                      Icon(
                                        Icons.verified,
                                        color: AppColors.kGreen,
                                        size: 18,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 4),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      /// LOCATION
                                      if (location.isNotEmpty)
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 14,
                                              color: Colors.grey,
                                            ),

                                            const SizedBox(width: 6),

                                            Expanded(
                                              child: Text(
                                                location ?? '',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      const SizedBox(height: 6),

                                      /// COLLEGE
                                      if ((college ?? '').isNotEmpty)
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.school_outlined,
                                              size: 14,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(width: 6),
                                            Expanded(
                                              child: Text(
                                                college ?? '',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      const SizedBox(height: 6),

                                      /// COMPANY
                                      if (roleCompanyText.isNotEmpty)
                                        Row(
                                          children: [
                                            Expanded(
                                              child:
                                                  /// ROLE + COMPANY
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.work_outline,
                                                        size: 14,
                                                        color: Colors.grey,
                                                      ),

                                                      const SizedBox(width: 6),

                                                      Expanded(
                                                        child: Text(
                                                          roleCompanyText,

                                                          style:
                                                              const TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            ),
                                          ],
                                        ),

                                      const SizedBox(height: 6),

                                      /// EXPERIENCE
                                      if ((vm.alumni?.totalYearsOfExperience ??
                                              '')
                                          .isNotEmpty)
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.work_history_outlined,
                                              size: 14,
                                              color: Colors.grey,
                                            ),

                                            const SizedBox(width: 6),

                                            Expanded(
                                              child: Text(
                                                "${vm.alumni?.totalYearsOfExperience} years experience",

                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (statusType.isNotEmpty &&
                                          statusType != "employed") ...[
                                        const SizedBox(height: 2),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.info_outline,
                                              size: 14,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(width: 6),
                                            Expanded(
                                              child: Text(
                                                formattedStatus,
                                                style: const TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        if ((currentStatus?.note ?? '')
                                            .isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Text(
                                              currentStatus!.note!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.location_on_outlined,
                                  //       size: 14,
                                  //       color: Colors.grey,
                                  //     ),

                                  //     const SizedBox(width: 6),

                                  //     Expanded(
                                  //       child: Text(
                                  //         location,
                                  //         style: const TextStyle(
                                  //           color: Colors.white70,
                                  //           fontSize: 12,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),

                                  // const SizedBox(height: 6),

                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.business_outlined,
                                  //       size: 14,
                                  //       color: Colors.grey,
                                  //     ),

                                  //     const SizedBox(width: 6),

                                  //     Expanded(
                                  //       child: Text(
                                  //         company,
                                  //         style: const TextStyle(
                                  //           color: Colors.white70,
                                  //           fontSize: 12,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        /// MESSAGE BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kGreen,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              context.pushNamed(
                                RouteNames.chatUser,
                                extra: widget.alumniId,
                              );
                            },
                            icon: const Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,

                          child: OutlinedButton.icon(
                            onPressed: () {
                              final userId = vm.alumni?.userId ?? vm.alumni?.id;

                              if (userId == null) return;

                              context.pushNamed(
                                RouteNames.profileDetail,
                                extra: userId,
                              );
                            },

                            icon: Icon(
                              Icons.person_outline,
                              size: 18,
                              color: AppColors.kGreen,
                            ),

                            label: Text(
                              "Show Profile",
                              style: TextStyle(
                                color: AppColors.kGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),

                              side: BorderSide(
                                color: AppColors.kGreen.withOpacity(.5),
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// EDUCATION + METRICS
                  /// METRICS
                  /// METRICS
                  _modernCard(
                    title: "Metrics",
                    icon: Icons.analytics_outlined,

                    child: Column(
                      children: [
                        _metricRow(
                          "Open Jobs",
                          "${vm.alumni?.referralJobs?.length ?? 0}",
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const Spacer(),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isHiring ? "Hiring" : "Not Hiring",
                                  style: TextStyle(
                                    color: isHiring
                                        ? Colors.green
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),

                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isHiring
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// ABOUT
                  _modernCard(
                    title: "About",
                    icon: Icons.person_outline,
                    child: Text(
                      vm.alumni?.about ?? '-',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  _modernCard(
                    title: "Professional Links",
                    icon: Icons.link,
                    child: Column(
                      children: [
                        if ((vm.alumni?.linkedin ?? '').isNotEmpty)
                          _linkTile(
                            context: context,

                            image: "assets/images/linkedin.png",

                            title: "LinkedIn",
                            value: vm.alumni?.linkedin ?? '',
                          ),
                        if ((vm.alumni?.email ?? '').isNotEmpty)
                          _linkTile(
                            context: context,

                            image: "assets/images/mail.png",
                            title: "Email",
                            value: vm.alumni?.email ?? '',
                          ),
                        if ((vm.alumni?.github ?? '').isNotEmpty)
                          _linkTile(
                            context: context,

                            image: "assets/images/github.png",
                            title: "GitHub",
                            value: vm.alumni?.github ?? '',
                          ),

                        if ((vm.alumni?.portfolio ?? '').isNotEmpty)
                          _linkTile(
                            context: context,
                            image: "assets/images/portfolio.png",

                            title: "Portfolio",
                            value: vm.alumni?.portfolio ?? '',
                          ),

                        if ((vm.alumni?.resume ?? '').isNotEmpty)
                          _linkTile(
                            context: context,

                            image: "assets/images/cv.png",
                            title: "Resume",
                            value: vm.alumni?.resume ?? '',
                          ),
                      ],
                    ),
                  ),

                  //             const SizedBox(height: 18),
                  const SizedBox(height: 18),

                  /// OPEN POSITIONS
                  _modernCard(
                    title: "Open Positions",
                    icon: Icons.work_outline,
                    child: Column(
                      children: (vm.alumni?.referralJobs ?? [])
                          .map(
                            (job) => _jobTile(
                              context,
                              job,
                              vm.alumni?.currentCompany,
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _linkTile({
    required BuildContext context,
    required String image,
    required String title,
    required String value,
  }) {
    return GestureDetector(
      onTap: () async {
        try {
          /// EMAIL
          if (title == "Email") {
            final uri = Uri(scheme: "mailto", path: value);

            final launched = await launchUrl(
              uri,
              mode: LaunchMode.platformDefault,
            );

            /// fallback if no mail app
            if (!launched) {
              await Clipboard.setData(ClipboardData(text: value));

              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Email copied")));
              }
            }

            return;
          }

          /// OTHER LINKS
          String url = value.trim();

          if (!url.startsWith(RegExp(r'https?://'))) {
            url = 'https://$url';
          }

          final uri = Uri.parse(url);

          final launched = await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
          );

          debugPrint('Launch result: $launched');
        } catch (e) {
          debugPrint("LINK ERROR: $e");
        }
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 10),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.03),

          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: Colors.white.withOpacity(.05)),
        ),

        child: Row(
          children: [
            Image.asset(image, height: 22, width: 22),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    value,

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              title == "Email" ? Icons.email_outlined : Icons.open_in_new,

              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _modernCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey, size: 18),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          child,
        ],
      ),
    );
  }

  Widget _metricRow(String title, String value) {
    return Row(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),

        const Spacer(),

        Text(
          value,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _jobTile(BuildContext context, Job job, String? companyName) {
    final title = job.jobTitle ?? "Role";
    final company = companyName ?? "Company";

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
        if (job.jobType == "Internship") {
          await context.pushNamed(RouteNames.internshipDetail, extra: job);
        } else if (job.jobType == "Referral") {
          await context.pushNamed(RouteNames.referralDetail, extra: job.id);
        } else {
          await context.pushNamed(RouteNames.jobDetail, extra: job);
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(.05)),
        ),
        child: Row(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: AppColors.kGreen.withOpacity(.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.work_outline, color: AppColors.kGreen),
            ),

            const SizedBox(width: 12),

            Expanded(
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

            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
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
