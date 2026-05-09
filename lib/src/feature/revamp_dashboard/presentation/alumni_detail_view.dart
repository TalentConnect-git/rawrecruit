import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class AlumniDetailView extends StatelessWidget {
  final List<Job> jobs;

  const AlumniDetailView({
    super.key,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    if (jobs.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "No data",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final first = jobs.first;

    final name =
        first.candidatePosted?.name ?? "User";

    final college =
        first.candidatePosted?.college ?? "";

    final skills =
        first.candidatePosted?.skills ??
            ['Skill 1', 'Skill 2'];

    final role =
        first.candidatePosted?.designation ??
            first.candidatePosted
                ?.specialization ??
            first.jobTitle ??
            "Professional";

    final location =
        first.location?.join(", ") ??
            "Location";

    final referrals =
        first.candidatePosted
                ?.referralJobs ??
            [];

    final isHiring =
        referrals.isNotEmpty;

    final company =
        first.candidatePosted
                ?.currentCompany ??
            "";

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Alumni Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔥 COMPACT HEADER
            Container(
              padding:
                  const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.kCard,
                borderRadius:
                    BorderRadius.circular(
                        20),
                border: Border.all(
                  color: Colors.white
                      .withOpacity(.06),
                ),
              ),
              child: Column(
                children: [

                  /// TOP
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [

                      /// AVATAR
                      CircleAvatar(
                        radius: 32,
                        backgroundColor:
                            AppColors
                                .kGreen,
                        child: Text(
                          name.getInitials,
                          style:
                              const TextStyle(
                            color:
                                Colors.black,
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      const SizedBox(
                          width: 14),

                      /// INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [

                            Row(
                              children: [

                                Expanded(
                                  child: Text(
                                    name,
                                    style:
                                        const TextStyle(
                                      color: Colors
                                          .white,
                                      fontSize:
                                          18,
                                      fontWeight:
                                          FontWeight
                                              .w700,
                                    ),
                                  ),
                                ),

                                Icon(
                                  Icons
                                      .verified,
                                  color:
                                      AppColors
                                          .kGreen,
                                  size: 18,
                                ),
                              ],
                            ),

                            const SizedBox(
                                height: 4),

                            Text(
                              role,
                              style:
                                  const TextStyle(
                                color:
                                    Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(
                                height: 10),

                            Row(
                              children: [

                                Icon(
                                  Icons
                                      .location_on_outlined,
                                  size: 14,
                                  color: Colors
                                      .grey,
                                ),

                                const SizedBox(
                                    width:
                                        6),

                                Expanded(
                                  child: Text(
                                    location,
                                    style:
                                        const TextStyle(
                                      color: Colors
                                          .white70,
                                      fontSize:
                                          12,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                                height: 6),

                            Row(
                              children: [

                                Icon(
                                  Icons
                                      .business_outlined,
                                  size: 14,
                                  color: Colors
                                      .grey,
                                ),

                                const SizedBox(
                                    width:
                                        6),

                                Expanded(
                                  child: Text(
                                    company,
                                    style:
                                        const TextStyle(
                                      color: Colors
                                          .white70,
                                      fontSize:
                                          12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 12),

                      /// MATCH
                      SizedBox(
                        width: 74,
                        height: 74,
                        child: Stack(
                          alignment:
                              Alignment
                                  .center,
                          children: [

                            SizedBox(
                              width: 74,
                              height: 74,
                              child:
                                  CircularProgressIndicator(
                                value:
                                    0.85,
                                strokeWidth:
                                    6,
                                backgroundColor:
                                    Colors
                                        .white
                                        .withOpacity(
                                            .08),
                                valueColor:
                                    AlwaysStoppedAnimation(
                                  AppColors
                                      .kGreen,
                                ),
                              ),
                            ),

                            Column(
                              mainAxisSize:
                                  MainAxisSize
                                      .min,
                              children: [

                                const Text(
                                  "85%",
                                  style:
                                      TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize:
                                        15,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                Text(
                                  "Match",
                                  style:
                                      TextStyle(
                                    color:
                                        AppColors
                                            .kGreen,
                                    fontSize:
                                        9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 16),

                  /// MESSAGE BUTTON
                  SizedBox(
                    width:
                        double.infinity,
                    child:
                        ElevatedButton
                            .icon(
                      style:
                          ElevatedButton
                              .styleFrom(
                        backgroundColor:
                            AppColors
                                .kGreen,
                        foregroundColor:
                            Colors.white,
                        padding:
                            const EdgeInsets
                                .symmetric(
                          vertical: 14,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      14),
                        ),
                      ),
                      onPressed: () {
                        context
                            .pushNamed(
                          RouteNames
                              .chatUser,
                          extra: first
                              .candidatePosted,
                        );
                      },
                      icon: const Icon(
                        Icons.message,
                        color:
                            Colors.white,
                      ),
                      label:
                          const Text(
                        "Message",
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontWeight:
                              FontWeight
                                  .w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// EDUCATION + METRICS
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                /// EDUCATION
                Expanded(
                  child: _modernCard(
                    title: "Education",
                    icon:
                        Icons.school_outlined,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [

                        Text(
                          college.isEmpty
                              ? "-"
                              : college,
                          style:
                              const TextStyle(
                            color: Colors
                                .white,
                            fontWeight:
                                FontWeight
                                    .w600,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(
                            height: 8),

                        Text(
                          role,
                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(
                            height: 8),

                        _skillChip(
                          '${(first.candidatePosted?.emailVerified ?? false) ? 'Verified' : 'Unverified'} Professional',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                /// METRICS
                Expanded(
                  child: _modernCard(
                    title: "Metrics",
                    icon: Icons
                        .analytics_outlined,
                    child: Column(
                      children: [

                        _metricRow(
                          "Open Jobs",
                          "${referrals.length}",
                        ),

                        const SizedBox(
                            height: 10),

                        _metricRow(
                          "Company",
                          company.isEmpty
                              ? "-"
                              : company,
                        ),

                        const SizedBox(
                            height: 10),

                        Row(
                          children: [

                            const Text(
                              "Status",
                              style:
                                  TextStyle(
                                color: Colors
                                    .grey,
                                fontSize: 12,
                              ),
                            ),

                            const Spacer(),

                            Container(
                              width: 8,
                              height: 8,
                              decoration:
                                  BoxDecoration(
                                color: isHiring
                                    ? Colors
                                        .green
                                    : Colors
                                        .red,
                                shape: BoxShape
                                    .circle,
                              ),
                            ),

                            const SizedBox(
                                width: 6),

                            Text(
                              isHiring
                                  ? "Hiring"
                                  : "Inactive",
                              style:
                                  TextStyle(
                                color: isHiring
                                    ? Colors
                                        .green
                                    : Colors
                                        .red,
                                fontSize:
                                    12,
                                fontWeight:
                                    FontWeight
                                        .w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// ABOUT
            _modernCard(
              title: "About",
              icon:
                  Icons.person_outline,
              child: Text(
                first.candidatePosted
                        ?.about ??
                    '-',
                style:
                    const TextStyle(
                  color:
                      Colors.grey,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// SKILLS
       /// SKILLS
_modernCard(
  title: "Skills & Domain",
  icon: Icons.code,
  child: Wrap(
    spacing: 8,
    runSpacing: 8,
    children: skills
        .map(
          (s) => Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(.06),
              borderRadius:
                  BorderRadius.circular(
                      30),
              border: Border.all(
                color: Colors.white
                    .withOpacity(.05),
              ),
            ),
            child: Text(
              s,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ),
        )
        .toList(),
  ),
),

            const SizedBox(height: 18),

            /// OPEN POSITIONS
            _modernCard(
              title: "Open Positions",
              icon:
                  Icons.work_outline,
              child: Column(
                children: referrals
                    .map(
                      (job) =>
                          _jobTile(
                        context,
                        job,
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 40),
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
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius:
            BorderRadius.circular(
                18),
        border: Border.all(
          color: Colors.white
              .withOpacity(.05),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Icon(
                icon,
                color: Colors.grey,
                size: 18,
              ),

              const SizedBox(
                  width: 8),

              Text(
                title,
                style:
                    const TextStyle(
                  color:
                      Colors.white,
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(
              height: 14),

          child,
        ],
      ),
    );
  }

  Widget _metricRow(
    String title,
    String value,
  ) {
    return Row(
      children: [

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

        const Spacer(),

        Flexible(
          child: Text(
            value,
            overflow:
                TextOverflow.ellipsis,
            style:
                const TextStyle(
              color:
                  Colors.white,
              fontSize: 12,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _skillChip(
      String skill) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(
                .06),
        borderRadius:
            BorderRadius.circular(
                30),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _jobTile(
    BuildContext context,
    Job job,
  ) {
    final title =
        job.jobTitle ?? "Role";

    final company =
        job.companyName
                    ?.isNotEmpty ==
                true
            ? job.companyName!
            : job.candidatePosted
                        ?.currentCompany
                        ?.isNotEmpty ==
                    true
                ? job
                    .candidatePosted!
                    .currentCompany!
                : "Company";

    final pkg =
        job.packageDetails;

    String salary = "";

    if (pkg != null) {
      if ((pkg.fixedPay ?? 0) >
          0) {
        salary =
            "₹${_formatSalary(pkg.fixedPay ?? 0)}";
      } else if ((pkg.totalCTC ??
              0) >
          0) {
        salary =
            "₹${_formatSalary(pkg.totalCTC ?? 0)}";
      }
    }

    return GestureDetector(
      onTap: () async {
        if (job.jobType ==
            "Internship") {
          await context
              .pushNamed(
            RouteNames
                .internshipDetail,
            extra: job,
          );
        } else if (job.jobType ==
            "Referral") {
          await context
              .pushNamed(
            RouteNames
                .referralDetail,
            extra: job.id,
          );
        } else {
          await context
              .pushNamed(
            RouteNames.jobDetail,
            extra: job,
          );
        }
      },
      child: Container(
        width: double.infinity,
        margin:
            const EdgeInsets.only(
          bottom: 12,
        ),
        padding:
            const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color:
              Colors.white.withOpacity(
                  .03),
          borderRadius:
              BorderRadius.circular(
                  16),
          border: Border.all(
            color: Colors.white
                .withOpacity(.05),
          ),
        ),
        child: Row(
          children: [

            Container(
              height: 46,
              width: 46,
              decoration:
                  BoxDecoration(
                color: AppColors
                    .kGreen
                    .withOpacity(.15),
                borderRadius:
                    BorderRadius
                        .circular(
                            12),
              ),
              child: Icon(
                Icons.work_outline,
                color:
                    AppColors.kGreen,
              ),
            ),

            const SizedBox(
                width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [

                  Text(
                    title,
                    style:
                        const TextStyle(
                      color: Colors
                          .white,
                      fontWeight:
                          FontWeight
                              .w600,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(
                      height: 6),

                  Text(
                    salary.isNotEmpty
                        ? "$company • $salary"
                        : company,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons
                  .arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  String _formatSalary(
      num amount) {
    if (amount >= 10000000) {
      return "${(amount / 10000000).toStringAsFixed(0)} Cr";
    } else if (amount >=
        100000) {
      return "${(amount / 100000).toStringAsFixed(0)} LPA";
    } else if (amount >=
        1000) {
      return "${(amount / 1000).toStringAsFixed(0)}K";
    }

    return amount.toString();
  }
}