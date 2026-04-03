import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import '../../../common/index.dart';
import '../entities/internship_model.dart';

class InternshipDetailView extends StatelessWidget {
  final InternshipModel internship;

  const InternshipDetailView({super.key, required this.internship});

  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final jobId = internship.id ?? '';
    final shortlistVM = context.watch<ShortlistViewModel>();
    final applicationVM = context.watch<ApplicationViewModel>();

    final isSaved = shortlistVM.savedJobIds.contains(jobId);
    final isApplied = applicationVM.isApplied(jobId);

    final company = internship.companyPosted?.companyDetails;
    final pkg = internship.packageDetails;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
 iconTheme: IconThemeData(
    color: AppColors.white, // 🔥 back arrow color
  ),
        title: Text(internship.jobRoles?.first ?? 'Internship Detail',style: TextStyle(color: AppColors.white,fontWeight:FontWeight.bold)),
      ),
backgroundColor: AppColors.secBorder,
      // ✅ Bottom buttons same as screenshot
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => shortlistVM.toggleSave(
                  jobId: jobId,
                  jobType: 'Internship',
                  isSaved: isSaved,
                ),
                child: Text(isSaved ? 'Saved' : 'Save',style: TextStyle(color: AppColors.kGreen),),
              ),
            ),
            const SizedBox(width: 12),
          Expanded(
  flex: 2,
  child: ElevatedButton(
    onPressed: isApplied ? null : () => applicationVM.apply(jobId),

    style: ElevatedButton.styleFrom(
      backgroundColor: isApplied
          ? Colors.grey.shade800 // disabled bg
          : AppColors.kGreen,     // 🔥 main bg
      foregroundColor: Colors.white, // text color
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0, // clean flat look like profile UI
    ),

    child: Text(
      isApplied ? 'Applied' : 'Apply Now',
      style:  TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.white
      ),
    ),
  ),
),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 INTERNSHIP OVERVIEW
            _sectionCard(
              title: 'Internship Overview',
              icon: Icons.description_outlined,
              child: Column(
                children: [
                  Row(
                    children: [
                      _info('Job Type', internship.jobType),
                      const SizedBox(width: 12),
                      _statusChip(internship.jobStatus ?? 'Active'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  _infoFull('Description', internship.description),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _info('Duration', internship.internshipDuration),
                      const SizedBox(width: 12),
                      _info('CGPA', internship.cgpa?.toString()),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _info('Openings', internship.numberOfOpenings?.toString()),
                      const SizedBox(width: 12),
                      _info('Posted', _fmt(internship.createdAt)),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 LOCATION
            _sectionCard(
              title: 'Location & Work',
              icon: Icons.location_on_outlined,
              child: Column(
                children: [
                  _infoFull('Location', internship.location?.join(', ')),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _info('Work Mode', internship.workMode?.join(', ')),
                      const SizedBox(width: 12),
                      _info('Employment Type',
                          internship.employmentType?.join(', ')),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 PACKAGE
            _sectionCard(
              title: 'Stipend',
              icon: Icons.currency_rupee,
              child: Column(
                children: [
                  _infoFull('Currency', pkg?.currency),
                  const SizedBox(height: 12),

                  Text(
                    '₹${pkg?.totalCTC ?? ''}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _info('Fixed Pay', '₹${pkg?.fixedPay ?? ''}'),
                      const SizedBox(width: 12),
                      _info('Bonus', '₹${pkg?.joiningBonus ?? ''}'),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 SELECTION
            _sectionCard(
              title: 'Selection Process',
              icon: Icons.groups_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoFull(
                      'Total Rounds', internship.rounds?.length.toString()),

                  const SizedBox(height: 12),

                  ...?internship.selectionProcess?.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text("• $e"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ SECTION CARD
Widget _sectionCard({
  required String title,
  required IconData icon,
  required Widget child,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.kCard, // 🔥 DARK CARD
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.kBorder), // 🔥 BORDER
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.kGreen), // 🔥 GREEN ICON
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white, // 🔥 WHITE TEXT
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    ),
  );
}
Widget _info(String title, String? value) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey, // 🔥 subtle label
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value ?? '-',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white, // 🔥 MAIN TEXT WHITE
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
Widget _infoFull(String title, String? value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value ?? '-',
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      ),
    ],
  );
}
Widget _statusChip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.kGreen.withOpacity(0.15), // 🔥 GREEN BG
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.kGreen, // 🔥 GREEN TEXT
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
}