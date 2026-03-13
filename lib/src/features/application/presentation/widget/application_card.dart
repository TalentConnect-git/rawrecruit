import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/entities/application_model.dart';

class ApplicationCard extends StatelessWidget {
  final ApplicationModel model;

  const ApplicationCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final title = model.jobDetails?.jobRoles?.isNotEmpty == true
        ? model.jobDetails!.jobRoles!.first
        : "-";

    final company = model.companyProfile?.companyDetails?.companyName ?? "-";

    final location = model.jobDetails?.location?.isNotEmpty == true
        ? model.jobDetails!.location!.first
        : "-";

    final status = model.currentStatus ?? "";

    final isAccepted = status.toLowerCase() == "accepted";

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        context.pushNamed(
          RouteNames.applicationDetail,
          extra: model, // 🔥 Now model exists
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFDCE3F1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.s16W600),
                const SizedBox(height: 6),
                Text(company, style: AppTextStyles.s18W600),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Text(location, style: AppTextStyles.s12W400),
                  ],
                ),
              ],
            ),

            /// Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isAccepted ? Colors.green : const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status.toCapitalise,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isAccepted ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
