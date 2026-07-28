import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel, ApplicationCard;
import 'package:rawrecruit/src/features/referrer/utils/enums.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/applicant_card.dart';

import '../../professional/job_postng/presentation/widgets/referred_applicant_card.dart';

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
  final ApplicationViewModel vm = ApplicationViewModel(); // 👈 ADD THIS LINE

  bool _initialApiCalled = false; // ✅ prevent multiple calls
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();

    selectedTab = widget.selectedType ?? selectedTab;

    _pageController = PageController(
      initialPage: selectedTab.index,
      viewportFraction: 1.0,
    );
    vm.fetchApplications(); // 👈 ADD THIS LINE
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // 👈 .value now
      value: vm, // 👈 use the field
      child: Builder(
        builder: (context) {
          // (deleted the `final vm = context.read...` line — vm is the field now)

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
                  Expanded(
                    child: ClipRect(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          final type =
                              ProfessionalReferrerApplicationType.values[index];

                          setState(() => selectedTab = type);

                          if (type ==
                                  ProfessionalReferrerApplicationType
                                      .requestsReceived &&
                              vm.referralApplications.isEmpty) {
                            vm.fetchReferralRequests();
                          }

                          if (type ==
                                  ProfessionalReferrerApplicationType
                                      .referredByMe &&
                              vm.referredByMe.isEmpty) {
                            vm.fetchReferredByMe();
                          }
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RefreshIndicator(
                              color: AppColors.kGreen,
                              onRefresh: _refresh,
                              child: _appliedByMe(),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RefreshIndicator(
                              color: AppColors.kGreen,
                              onRefresh: _refresh,
                              child: _requestsReceived(),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RefreshIndicator(
                              color: AppColors.kGreen,
                              onRefresh: _refresh,
                              child: _referredByMe(),
                            ),
                          ),
                        ],
                      ),
                    ),
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

          _pageController.animateToPage(
            type.index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );

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
            color: isSelected ? AppColors.kGreen : AppColors.kCard,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              type.label,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    await vm.fetchApplications();

    if (selectedTab == ProfessionalReferrerApplicationType.requestsReceived) {
      await vm.fetchReferralRequests();
    }

    if (selectedTab == ProfessionalReferrerApplicationType.referredByMe) {
      await vm.fetchReferredByMe();
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
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),

            children: const [
              SizedBox(height: 250),

              Center(
                child: Text(
                  "No requests received",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
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
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),

            children: const [
              SizedBox(height: 250),

              Center(
                child: Text(
                  "No applications found",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: vm.appliedApplications.length,
          itemBuilder: (context, index) {
            final job = vm.appliedApplications[index];
            return ApplicationCard(application: job);
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
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),

            children: const [
              SizedBox(height: 250),

              Center(
                child: Text(
                  "No referred candidates",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
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
