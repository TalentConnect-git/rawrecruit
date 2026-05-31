import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel, ApplicationCard, ApplicationSearchBar;

class ApplicationsView extends StatefulWidget {
  const ApplicationsView({super.key});

  @override
  State<ApplicationsView> createState() => _ApplicationsViewState();
}

class _ApplicationsViewState extends State<ApplicationsView> {
  final viewModel = ApplicationViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchApplications();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ApplicationViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.secBorder,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const ApplicationSearchBar(),
                    const SizedBox(height: 20),

                    Expanded(
                      child: vm.appliedApplications.isEmpty
                          ? const Center(child: Text("No Applications Yet"))
                          : ListView.builder(
                              itemCount: vm.appliedApplications.length,
                              itemBuilder: (context, index) {
                                final item = vm.appliedApplications[index];

                                return ApplicationCard(model: item);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
