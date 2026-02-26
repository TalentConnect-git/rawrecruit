import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/application_listing/presentation/application_detail_view.dart';

class ReferralApplicationCard extends StatelessWidget {
  final ApplicationModel application;

  const ReferralApplicationCard({
    super.key,
    required this.application,
  });

  /// Improved status color logic
  Color _statusColor(String? status) {
    final value = status?.toLowerCase() ?? "";

    if (value.contains("applied")) return Colors.blue;
    if (value.contains("rejected")) return Colors.red;
    if (value.contains("approved")) return Colors.green;
    if (value.contains("pending")) return Colors.orange;
    if (value.contains("sent")) return Colors.deepPurple;

    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final job = application.jobDetails;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ReferralApplicationDetailScreen(
              application: application,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Job Title
            Text(
              job?.jobTitle ?? "No Title",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            /// Location
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    job?.location?.join(", ") ?? "N/A",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            /// Employment Type
            Row(
              children: [
                const Icon(Icons.work_outline,
                    size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  job?.employmentType?.join(", ") ?? "N/A",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            /// Divider
            Divider(color: Colors.grey.withOpacity(0.2)),

            const SizedBox(height: 10),

            /// Status Row
            Wrap(
              spacing: 8,
              children: [

                /// Application Status
                _buildStatusChip(
                  label: application.currentStatus,
                ),

                /// Admin Status
                if (application.adminApprovalStatus != null)
                  _buildStatusChip(
                    label:
                        "${application.adminApprovalStatus} By Admin",
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip({String? label}) {
    final color = _statusColor(label);

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: color.withOpacity(0.4),
          width: 0.6,
        ),
      ),
      child: Text(
        label ?? "Unknown",
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}