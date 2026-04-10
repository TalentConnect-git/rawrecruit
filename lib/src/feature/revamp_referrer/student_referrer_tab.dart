import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/widget/application_card.dart';

class StudentApplicationsView extends StatefulWidget {
  const StudentApplicationsView({super.key});

  @override
  State<StudentApplicationsView> createState() =>
      _StudentApplicationsViewState();
}

class _StudentApplicationsViewState
    extends State<StudentApplicationsView> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApplicationViewModel(),
      child: Builder(
        builder: (context) {

          /// 🔥 LOAD ONLY ONCE
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ApplicationViewModel>().fetchApplications();
          });

          return Scaffold(
            backgroundColor: AppColors.kBg,
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTabs(),
                  const SizedBox(height: 10),

                  Expanded(
                    child: _buildBody(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔥 TABS
  Widget _buildTabs() {
    return Row(
      children: [
        _tab("All", 0),
        _tab("Referral Jobs", 1),
        _tab("Internships", 2),
        _tab("Off-Campus", 3),
      ],
    );
  }

  Widget _tab(String title, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kGreen : const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 BODY
  Widget _buildBody() {
    return Consumer<ApplicationViewModel>(
      builder: (context, vm, _) {
        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        final all = vm.appliedApplications;

        /// 🔥 FILTER LOGIC
        List filtered = [];

       switch (selectedTab) {
  case 0:
    filtered = all;
    break;

  case 1:
    filtered = all
        .where((e) => e.jobType == "Referral")
        .toList();
    break;

  case 2:
    filtered = all
        .where((e) => e.jobType == "Internship")
        .toList();
    break;

  case 3:
    filtered = all
        .where((e) => e.jobType == "Off-campus")
        .toList();
    break;
}
        if (filtered.isEmpty) {
          return const Center(
            child: Text(
              "No applications found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView(
          children: filtered.map((item) {
            return ApplicationCard(model: item); // ✅ reuse
          }).toList(),
        );
      },
    );
  }
}