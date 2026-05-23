import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/models/job.dart';

class ApplicationDetailView extends StatelessWidget {
  final Job? model;

  const ApplicationDetailView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final job = model;

    /// 🔥 RAW + NORMALIZED STATUS
    final rawStatus = job?.status ?? "";
    final status = _normalizeStatus(rawStatus);
final currentExp =
    job?.candidatePosted?.experiences?.isNotEmpty == true
        ? job!.candidatePosted!.experiences!.firstWhere(
            (e) => e.isCurrent == true,
            orElse: () =>
                job.candidatePosted!.experiences!.first,
          )
        : null;

final jobTitle =
    currentExp?.role ??
    (job?.jobTitle ?? "-");

final companyName =
    currentExp?.company ??
    ((job?.companyName?.isNotEmpty == true)
        ? job!.companyName!
        : (job?.jobType == "Referral"
            ? "Referral"
            : "-"));

    final location = (job?.location ?? []).isNotEmpty
        ? job?.location?.firstOrNull
        : "-";

    final appliedDate =
        job?.createdAt?.toLocal().toString().split(' ').first ?? "-";

    return Scaffold(
      backgroundColor: AppColors.secBorder,
      appBar: RAppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          companyName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            /// 🔥 HEADER CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.kBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + STATUS BADGE
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          jobTitle ?? "-",
                          style: AppTextStyles.s22W600
                              .copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),

                      _statusBadge(rawStatus),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// LOCATION
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        location ?? "-",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// APPLIED DATE
                  Text(
                    "Applied on $appliedDate",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// REFERRER
                  const Text(
                    "Referrer: -",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 TIMELINE TITLE
            const Text(
              "Progress Timeline",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 TIMELINE
            _timelineItem("Pending", true),

            _timelineItem(
              "Application Sent",
              status == "application_sent" ||
                  status == "referred" ||
                  status == "shortlisted" ||
                  status == "interview" ||
                  status == "offer" ||
                  status == "accepted" ||
                  status == "rejected",
            ),

            _timelineItem(
              "Referred To Company",
              status == "referred" ||
                  status == "shortlisted" ||
                  status == "interview" ||
                  status == "offer" ||
                  status == "accepted" ||
                  status == "rejected",
            ),

            _timelineItem(
              "Shortlisted",
              status == "shortlisted" ||
                  status == "interview" ||
                  status == "offer" ||
                  status == "accepted" ||
                  status == "rejected",
            ),

            _timelineItem(
              "Interview Scheduled",
              status == "interview" ||
                  status == "offer" ||
                  status == "accepted" ||
                  status == "rejected",
            ),

            _timelineItem(
              "Offer Extended",
              status == "offer" ||
                  status == "accepted" ||
                  status == "rejected",
            ),

            _timelineItem(
              "Accepted",
              status == "accepted",
            ),

            _timelineItem(
              "Rejected",
              status == "rejected",
            ),

            // const SizedBox(height: 30),

            // /// 🔥 BUTTON
            // OutlinedButton(
            //   onPressed:
            //       status == "accepted"
            //           ? null
            //           : () {},
            //   style: OutlinedButton.styleFrom(
            //     side: BorderSide(
            //       color: status == "accepted"
            //           ? Colors.grey
            //           : Colors.red,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius:
            //           BorderRadius.circular(12),
            //     ),
            //   ),
            //   child: Text(
            //     status == "accepted"
            //         ? "Application Accepted"
            //         : "Withdraw Application",
            //     style: TextStyle(
            //       color: status == "accepted"
            //           ? Colors.grey
            //           : Colors.red,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  /// 🔥 NORMALIZE STATUS
  String _normalizeStatus(String status) {
    final s = status.toLowerCase();

    if (s.contains("pending")) {
      return "pending";
    }

    if (s.contains("application sent")) {
      return "application_sent";
    }

    if (s.contains("referred")) {
      return "referred";
    }

    if (s.contains("shortlist")) {
      return "shortlisted";
    }

    if (s.contains("interview")) {
      return "interview";
    }

    if (s.contains("offer")) {
      return "offer";
    }

    if (s.contains("accept")) {
      return "accepted";
    }

    if (s.contains("reject")) {
      return "rejected";
    }

    return "pending";
  }

  /// 🔥 STATUS BADGE
  Widget _statusBadge(String rawStatus) {
    final status = _normalizeStatus(rawStatus);

    Color textColor = Colors.grey;

    switch (status) {
      case "pending":
        textColor = Colors.grey;
        break;

      case "application_sent":
        textColor = Colors.orange;
        break;

      case "referred":
        textColor = Colors.deepOrange;
        break;

      case "shortlisted":
        textColor = Colors.amber;
        break;

      case "interview":
        textColor = Colors.blue;
        break;

      case "offer":
        textColor = Colors.purple;
        break;

      case "accepted":
        textColor = Colors.green;
        break;

      case "rejected":
        textColor = Colors.red;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        rawStatus.isEmpty
            ? "Pending"
            : rawStatus,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 🔥 TIMELINE ITEM
  Widget _timelineItem(
    String title,
    bool isDone,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isDone
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: isDone
                  ? Colors.green
                  : Colors.grey,
              size: 20,
            ),

            Container(
              width: 2,
              height: 30,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),

        const SizedBox(width: 10),

        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            title,
            style: TextStyle(
              color: isDone
                  ? Colors.white
                  : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}