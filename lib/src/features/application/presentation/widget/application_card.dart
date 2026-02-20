import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

enum ApplicationStatus { applied, accepted }

class ApplicationCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final ApplicationStatus status;

  const ApplicationCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        context.pushNamed(RouteNames.applicationDetail);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFDCE3F1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            /// Left Section
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.s16W600,
                ),
                const SizedBox(height: 6),
                Text(
                  company,
                  style: AppTextStyles.s18W600,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 16),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style:
                          AppTextStyles.s12W400,
                    ),
                  ],
                ),
              ],
            ),

            /// Status Badge
            _StatusBadge(status: status),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ApplicationStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final bool isAccepted =
        status == ApplicationStatus.accepted;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isAccepted
            ? Colors.green
            : const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isAccepted ? "Accepted" : "Applied",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color:
              isAccepted ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
