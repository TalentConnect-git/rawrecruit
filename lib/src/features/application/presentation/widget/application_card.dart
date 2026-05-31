import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class ApplicationCard extends StatelessWidget {
  final Job model;

  const ApplicationCard({super.key, required this.model});

  /// 🔥 TOTAL STEPS
  static const int totalSteps = 7;

  /// 🔥 STEP MAPPING
  int _getStep(String status) {
    final s = status.toLowerCase();

    if (s.contains("pending")) {
      return 0;
    }

    if (s.contains("application sent")) {
      return 1;
    }

    if (s.contains("referred")) {
      return 2;
    }

    if (s.contains("shortlist")) {
      return 3;
    }

    if (s.contains("interview")) {
      return 4;
    }

    if (s.contains("offer")) {
      return 5;
    }

    if (s.contains("accepted") || s.contains("rejected")) {
      return 6;
    }

    return 0;
  }

  /// 🔥 PROGRESS
  double _getProgress(String status) {
    return (_getStep(status) + 1) / totalSteps;
  }

  int _getPercentage(String status) {
    return (_getProgress(status) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final title = (model.jobRoles?.isNotEmpty == true)
        ? model.jobRoles!.first
        : (model.jobTitle?.isNotEmpty == true ? model.jobTitle! : "-");

    final company = (model.referralCompany != null)
        ? model.referralCompany
        : (model.jobType == "Referral" ? "Referral" : "-");

    log('Referral Company: ${model.referralCompany}');
    log(' Company: ${company}');

    final status = model.status ?? "pending";

    final step = _getStep(status);

    // final progress = _getProgress(status);

    final percent = _getPercentage(status);

    final isRejected = status.toLowerCase().contains("rejected");

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        context.pushNamed(RouteNames.applicationDetail, extra: model);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.kBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Text(
                  "$percent%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              company ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 16),

            /// 🔥 STEP LABEL
            Text(
              status,
              style: TextStyle(
                color: isRejected ? Colors.red : AppColors.kGreen,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 14),

            /// 🔥 MINI STEPPER
            Row(
              children: List.generate(totalSteps, (index) {
                final isActive = index <= step;

                final color = isActive
                    ? (isRejected && index == step
                          ? Colors.red
                          : AppColors.kGreen)
                    : Colors.grey.shade700;

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 6,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
