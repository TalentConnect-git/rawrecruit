import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/application_listing/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/professional/application_listing/presentation/widgets/application_card.dart';


class ReferralApplicationsScreen extends StatefulWidget {
  const ReferralApplicationsScreen({super.key});

  @override
  State<ReferralApplicationsScreen> createState() =>
      _ReferralApplicationsScreenState();
}

class _ReferralApplicationsScreenState
    extends State<ReferralApplicationsScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<ReferralApplicationsViewModel>()
            .fetchReferralApplications());
  }

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<ReferralApplicationsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Referral Applications"),
      ),
      body: Builder(
        builder: (_) {

          if (vm.viewState == ViewState.busy) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (vm.applications.isEmpty) {
            return const Center(
              child: Text("No Applications Found"),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                vm.fetchReferralApplications(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vm.applications.length,
              itemBuilder: (context, index) {

                final application =
                    vm.applications[index];

                return ReferralApplicationCard(
                  application: application,
                );
              },
            ),
          );
        },
      ),
    );
  }
}