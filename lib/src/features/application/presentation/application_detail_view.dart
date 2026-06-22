import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart';
import 'package:rawrecruit/src/features/application/presentation/view_model/application_detail_view_model.dart';

import '../../../core/navigation/routes_index.dart';

class ApplicationDetailView extends StatefulWidget {
  final String applicationId;
  const ApplicationDetailView({super.key, required this.applicationId});

  @override
  State<ApplicationDetailView> createState() => _ApplicationDetailViewState();
}

class _ApplicationDetailViewState extends State<ApplicationDetailView> {
  ApplicationDetailViewModel applicationDetailViewModel =
      ApplicationDetailViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await applicationDetailViewModel.getApplicationDetail(
        widget.applicationId,
      );
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 🔥 RAW + NORMALIZED STATUS

    return ChangeNotifierProvider.value(
      value: applicationDetailViewModel,
      child: Scaffold(
        backgroundColor: AppColors.secBorder,
        appBar: RAppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
          title: Selector<ApplicationDetailViewModel, ApplicationModel?>(
            selector: (_, vm) => vm.application,
            builder: (_, application, _) => Text(
              application?.displayCompanyName ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Selector<ApplicationDetailViewModel, bool>(
          selector: (_, vm) => vm.isLoading,
          builder: (_, isLoading, _) => isLoading
              ? Center(child: AppLoadingIndicator())
              : Selector<ApplicationDetailViewModel, ApplicationModel?>(
                  selector: (_, vm) => vm.application,
                  builder: (_, application, _) {
                    final job = application?.job;
                    final rawStatus = application?.currentStatus ?? "";
                    final status = _normalizeStatus(rawStatus);
                    final currentExp =
                        job?.candidatePosted?.experiences?.isNotEmpty == true
                        ? job!.candidatePosted!.experiences!.firstWhere(
                            (e) => e.isCurrent == true,
                            orElse: () =>
                                job.candidatePosted!.experiences!.first,
                          )
                        : null;

                    final jobTitle = currentExp?.role ?? (job?.jobTitle ?? "-");

                    // final companyName =
                    //     currentExp?.company ??
                    //     ((job?.companyName?.isNotEmpty == true)
                    //         ? job!.companyName!
                    //         : (job?.jobType == "Referral" ? "Referral" : "-"));

                    final location = (job?.location ?? []).isNotEmpty
                        ? job?.location?.firstOrNull
                        : "-";

                    final appliedDate =
                        job?.createdAt?.toLocal().toString().split(' ').first ??
                        "-";
                    final receiver = job?.receiverProfile;
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          final failure = await applicationDetailViewModel
                              .getApplicationDetail(widget.applicationId);
                          failure?.showError(context);
                        },
                        child: ListView(
                          children: [
                            /// 🔥 HEADER CARD
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.08,
                                ),
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
                                          jobTitle,
                                          style: AppTextStyles.s22W600.copyWith(
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
                                  if (receiver != null) ...[
                                    const SizedBox(height: 12),

                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (receiver?.userId == null)
                                              return;

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    ProfileDetailView(
                                                      userId: receiver.userId!,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundImage:
                                                receiver
                                                        ?.profileImage
                                                        ?.isNotEmpty ==
                                                    true
                                                ? NetworkImage(
                                                    receiver!.profileImage!,
                                                  )
                                                : null,
                                            child:
                                                receiver
                                                        ?.profileImage
                                                        ?.isEmpty ??
                                                    true
                                                ? const Icon(
                                                    Icons.person,
                                                    size: 18,
                                                  )
                                                : null,
                                          ),
                                        ),

                                        const SizedBox(width: 10),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Referrer",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11,
                                                ),
                                              ),

                                              Text(
                                                receiver.name ?? "-",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                            /// 🔥 TIMELINE
                            _timelineItem("Applied", true),

                            _timelineItem(
                              "Application Sent",
                              [
                                "application_sent",
                                "referred",
                                "shortlisted",
                                "interview",
                                "offer",
                                "accepted",
                                "offer_accepted",
                                "offer_rejected",
                                "joined",
                              ].contains(status),
                            ),

                            _timelineItem(
                              "Referred To Company",
                              [
                                "referred",
                                "shortlisted",
                                "interview",
                                "offer",
                                "accepted",
                                "offer_accepted",
                                "offer_rejected",
                                "joined",
                              ].contains(status),
                            ),

                            _timelineItem(
                              "Shortlisted",
                              [
                                "shortlisted",
                                "interview",
                                "offer",
                                "accepted",
                                "offer_accepted",
                                "offer_rejected",
                                "joined",
                              ].contains(status),
                            ),

                            _timelineItem(
                              "Interview Scheduled",
                              [
                                "interview",
                                "offer",
                                "accepted",
                                "offer_accepted",
                                "offer_rejected",
                                "joined",
                              ].contains(status),
                            ),

                            _timelineItem(
                              "Offer Extended",
                              [
                                "offer",
                                "accepted",
                                "offer_accepted",
                                "offer_rejected",
                                "joined",
                              ].contains(status),
                            ),

                            if (status == "offer_accepted")
                              _timelineItem("Offer Accepted", true)
                            else if (status == "offer_rejected")
                              _timelineItem("Offer Rejected", true)
                            else
                              _timelineItem(
                                "Offer Accepted / Offer Rejected",
                                false,
                              ),

                            _timelineItem(
                              "Joined the Company",
                              status == "joined",
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  /// 🔥 NORMALIZE STATUS
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

    if (s.contains("joined")) {
      return "joined";
    }

    if (s.contains("offer accepted")) {
      return "offer_accepted";
    }

    if (s.contains("offer rejected")) {
      return "offer_rejected";
    }

    if (s.contains("offer extended")) {
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

      case "offer_accepted":
        textColor = Colors.green;
        break;

      case "offer_rejected":
        textColor = Colors.red;
        break;

      case "joined":
        textColor = Colors.teal;
        break;

      case "rejected":
        textColor = Colors.red;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        rawStatus.isEmpty ? "Pending" : rawStatus,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 🔥 TIMELINE ITEM
  Widget _timelineItem(String title, bool isDone, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isDone ? Colors.green : Colors.grey,
              size: 20,
            ),

            if (!isLast)
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
              color: isDone ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
