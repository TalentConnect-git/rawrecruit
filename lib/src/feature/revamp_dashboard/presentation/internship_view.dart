import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';

import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../core/index.dart';

class InternshipView extends StatefulWidget {
  const InternshipView({super.key});

  @override
  State<InternshipView> createState() => _InternshipViewState();
}

class _InternshipViewState extends State<InternshipView> {
  final viewModel = DashboardViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.getInternships();

    Future.microtask(() {
      context.read<ShortlistViewModel>().fetchSaved();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<DashboardViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          }

          final dashboardProvider = context.watch<DashboardProvider>();

          final filteredInternships = dashboardProvider.applyInternshipFilters(
            vm.internships,
          );

          final shortlistVM = context.watch<ShortlistViewModel>();

          /// ✅ ADD THIS (you were missing this)
          final applicationVM = context.watch<ApplicationViewModel>();

          return ListView.builder(
            itemCount: filteredInternships.length,
            itemBuilder: (context, index) {
              final internship = filteredInternships[index];

              final isSaved = shortlistVM.savedJobIds.contains(internship.id);

              /// ✅ DEFINE isApplied
              final isApplied = applicationVM.isApplied(internship.id ?? '');

             
              return JobCard(
               job: internship,
                isSaved: isSaved,
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: internship.id ?? '',
                    jobType: "Internship",
                    isSaved: isSaved,
                  );
                },
                isApplied: isApplied,
                onApply: () {
                  applicationVM.apply(internship.id ?? '');
                },
              onTap: () async {
  await context.pushNamed(
    RouteNames.internshipDetail,
    extra: internship,
  );
  if (context.mounted) {
    context.read<ShortlistViewModel>().fetchSaved();
    context.read<ApplicationViewModel>().fetchApplications();
  }
},
              );
            },
          );
        },
      ),
    );
  }
}

class _InternshipStats extends StatelessWidget {
  final int total;

  const _InternshipStats({required this.total});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    int activeFilters =
        [
          provider.selectedWorkMode,
          provider.selectedLocation,
          provider.selectedEmploymentType,
          provider.selectedDegree,
          provider.selectedCourse,
          provider.selectedDuration,
        ].where((e) => e != null).length +
        (provider.paidOnly ? 1 : 0);

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: "Total\nInternships",
            value: total.toString(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            title: "Active Filters",
            value: activeFilters.toString(),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.s12W600),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.s22W600.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
