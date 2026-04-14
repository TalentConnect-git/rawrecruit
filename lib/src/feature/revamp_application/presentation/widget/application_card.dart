
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class ApplicationCard extends StatelessWidget {
  final Job model;

  const ApplicationCard({super.key, required this.model});

  /// 🔥 STEP MAPPING (UPDATED - NO SHORTLISTED)
  int _getStep(String status) {
    switch (status.toLowerCase()) {
      case "referred to company":
        return 1;
      case "accepted":
      case "rejected":
        return 2;
      case "pending":
      default:
        return 0;
    }
  }

  /// 🔥 PROGRESS (3 STEPS NOW)
  double _getProgress(String status) {
    return (_getStep(status) + 1) / 3;
  }

  int _getPercentage(String status) {
    return (_getProgress(status) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final title = (model.jobRoles?.isNotEmpty == true)
        ? model.jobRoles!.first
        : (model.jobTitle?.isNotEmpty == true
            ? model.jobTitle!
            : "-");

    final company = (model.companyName?.isNotEmpty == true)
        ? model.companyName!
        : (model.jobType == "Referral"
            ? "Referral"
            : "-");

    final status = model.status ?? "pending";

    final step = _getStep(status);
    final progress = _getProgress(status);
    final percent = _getPercentage(status);

    final isRejected = status.toLowerCase() == "rejected";

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        context.pushNamed(
          RouteNames.applicationDetail,
          extra: model,
        );
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
              company,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 PROGRESS BAR
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation(
                isRejected ? Colors.red : AppColors.kGreen,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 STEPPER (UPDATED)
            Row(
              children: [
                _step("Pending", 0, step, isRejected),
                _line(),
                _step("Referred", 1, step, isRejected),
                _line(),
                _step(
                  isRejected ? "Rejected" : "Final",
                  2,
                  step,
                  isRejected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 STEP CIRCLE
  Widget _step(String label, int index, int currentStep, bool isRejected) {
    final isActive = index <= currentStep;

    final color = isActive
        ? (isRejected && index == currentStep
            ? Colors.red
            : AppColors.kGreen)
        : Colors.grey.shade700;

    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 CONNECTING LINE
  Widget _line() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey.shade700,
      ),
    );
  }
}
