import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/widget/application_card.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/applicant_card.dart';

class ProfessionalReferralView extends StatefulWidget {
  const ProfessionalReferralView({super.key});

  @override
  State<ProfessionalReferralView> createState() =>
      _ProfessionalReferralViewState();
}

class _ProfessionalReferralViewState
    extends State<ProfessionalReferralView> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApplicationViewModel()..fetchApplications(),
      child: Builder( // ✅ CRITICAL FIX (gives correct context)
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.kBg,
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTabs(context),
                  const SizedBox(height: 10),
                  Expanded(child: _buildBody()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔥 TABS
  Widget _buildTabs(BuildContext context) {
    return Row(
      children: [
        _tab("Applied by Me", 0, context),
        _tab("Requests Received", 1, context),
        _tab("Referred by Me", 2, context),
      ],
    );
  }

  Widget _tab(String title, int index, BuildContext context) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedTab = index);

          final vm = context.read<ApplicationViewModel>();

          /// ✅ CALL ONLY WHEN NEEDED
          if (index == 1 && vm.referralApplications.isEmpty) {
            vm.fetchReferralRequests();
          }
        },
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

  /// 🔥 BODY SWITCH
  Widget _buildBody() {
    switch (selectedTab) {
      case 0:
        return _appliedByMe();
      case 1:
        return _requestsReceived();
      case 2:
        return _placeholder("Referred by me API coming soon");
      default:
        return const SizedBox();
    }
  }

  /// ✅ REQUESTS RECEIVED
  Widget _requestsReceived() {
    return Consumer<ApplicationViewModel>(
      builder: (context, vm, _) {
        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.referralApplications.isEmpty) {
          return const Center(
            child: Text(
              "No requests received",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: vm.referralApplications.length,
          itemBuilder: (context, index) {
            final app = vm.referralApplications[index];
            return ApplicantCard(application: app);
          },
        );
      },
    );
  }

  /// ✅ APPLIED BY ME
  Widget _appliedByMe() {
    return Consumer<ApplicationViewModel>(
      builder: (context, vm, _) {
        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.appliedApplications.isEmpty) {
          return const Center(
            child: Text(
              "No applications found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: vm.appliedApplications.length,
          itemBuilder: (context, index) {
            final job = vm.appliedApplications[index];
            return ApplicationCard(model: job);
          },
        );
      },
    );
  }

  /// 🔥 PLACEHOLDER
  Widget _placeholder(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}