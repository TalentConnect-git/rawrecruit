import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';

class ReferralApplicationDetailScreen extends StatelessWidget {
  final ApplicationModel application;

  const ReferralApplicationDetailScreen({
    super.key,
    required this.application,
  });

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

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        title: const Text("Application Details"),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// -----------------------
          /// Job Title Section
          /// -----------------------
          Text(
            job?.jobTitle ?? "",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            children: [
              _buildStatusChip(application.currentStatus),
            
            ],
          ),

          const SizedBox(height: 20),

          /// -----------------------
          /// Job Overview Card
          /// -----------------------
          _buildSectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _buildInfoRow(
                  Icons.location_on_outlined,
                  job?.location?.join(", ") ?? "N/A",
                ),

                const SizedBox(height: 10),

                _buildInfoRow(
                  Icons.work_outline,
                  job?.employmentType?.join(", ") ?? "N/A",
                ),

                if (job?.yearsOfExperience != null) ...[
                  const SizedBox(height: 10),
                  _buildInfoRow(
                    Icons.timeline,
                    "Experience: ${job?.yearsOfExperience}",
                  ),
                ],

                if (job?.packageDetails != null) ...[
                  const SizedBox(height: 10),
                  _buildInfoRow(
                    Icons.currency_rupee,
                    "${job?.packageDetails?.currency} "
                    "${job?.packageDetails?.totalCTC}",
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// -----------------------
          /// Description Section
          /// -----------------------
          _buildSectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Job Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  job?.description ?? "No description provided.",
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// -----------------------
          /// Skills Section
          /// -----------------------
          if (job?.skills != null && job!.skills!.isNotEmpty)
            _buildSectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills Required",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: job.skills!
                        .map(
                          (skill) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.08),
                              borderRadius:
                                  BorderRadius.circular(30),
                            ),
                            child: Text(
                              skill,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// -----------------------
  /// Reusable Section Card
  /// -----------------------
  Widget _buildSectionCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: child,
    );
  }

  /// -----------------------
  /// Reusable Info Row
  /// -----------------------
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  /// -----------------------
  /// Status Chip
  /// -----------------------
  Widget _buildStatusChip(String? label) {
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