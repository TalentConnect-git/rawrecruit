import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/widget/application_card.dart';
import 'package:rawrecruit/src/feature/revamp_referrer/utils/enums.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/applicant_card.dart';

import '../../../features/professional/job_postng/presentation/widgets/referred_applicant_card.dart';

class ProfessionalReferralView extends StatefulWidget {
  const ProfessionalReferralView({this.selectedType, super.key});
  final ProfessionalReferrerApplicationType? selectedType;

  @override
  State<ProfessionalReferralView> createState() =>
      _ProfessionalReferralViewState();
}

class _ProfessionalReferralViewState extends State<ProfessionalReferralView> {
  ProfessionalReferrerApplicationType selectedTab =
      ProfessionalReferrerApplicationType.appliedByMe;

  bool _initialApiCalled = false; // ✅ prevent multiple calls

  @override
  void initState() {
    super.initState();
    selectedTab = widget.selectedType ?? selectedTab;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApplicationViewModel()..fetchApplications(),
      child: Builder(
        builder: (context) {
          final vm = context.read<ApplicationViewModel>();

          /// ✅ SAFE INITIAL API CALL
          if (!_initialApiCalled) {
            _initialApiCalled = true;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (selectedTab ==
                  ProfessionalReferrerApplicationType.requestsReceived) {
                vm.fetchReferralRequests();
              }

              if (selectedTab ==
                  ProfessionalReferrerApplicationType.referredByMe) {
                vm.fetchReferredByMe();
              }
            });
          }

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
        ...ProfessionalReferrerApplicationType.values.map(
          (t) => _tab(t, context),
        ),
      ],
    );
  }

  Widget _tab(ProfessionalReferrerApplicationType type, BuildContext context) {
    final isSelected = selectedTab == type;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedTab = type);

          final vm = context.read<ApplicationViewModel>();

          /// ✅ CALL ONLY WHEN NEEDED
          if (type == ProfessionalReferrerApplicationType.requestsReceived &&
              vm.referralApplications.isEmpty) {
            vm.fetchReferralRequests();
          }

          if (type == ProfessionalReferrerApplicationType.referredByMe &&
              vm.referredByMe.isEmpty) {
            vm.fetchReferredByMe();
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
              type.label,
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
      case ProfessionalReferrerApplicationType.appliedByMe:
        return _appliedByMe();
      case ProfessionalReferrerApplicationType.requestsReceived:
        return _requestsReceived();
      case ProfessionalReferrerApplicationType.referredByMe:
        return _referredByMe();
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

  /// ✅ REFERRED BY ME
  Widget _referredByMe() {
    return Consumer<ApplicationViewModel>(
      builder: (context, vm, _) {
        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.referredByMe.isEmpty) {
          return const Center(
            child: Text(
              "No referred candidates",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: vm.referredByMe.length,
          itemBuilder: (context, index) {
            final app = vm.referredByMe[index];
     return ReferredApplicantCard(
  application: app,
  showStatusActions: true,
);
          },
        );
      },
    );
  }
}
