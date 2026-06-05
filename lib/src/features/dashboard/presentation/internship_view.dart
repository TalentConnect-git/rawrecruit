import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel;
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/widgets/job_card.dart';
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

          final dashboardProvider = context.watch<DashboardViewModel>();

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
                onApply: () => applicationVM.apply(
                  jobId: internship.id ?? '',
                  jobType: 'Internship',

                  companyName: internship.companyName ?? '',
                ),
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
