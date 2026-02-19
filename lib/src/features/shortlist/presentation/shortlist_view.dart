import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

class ShortlistView extends StatefulWidget {
  const ShortlistView({super.key});

  @override
  State<ShortlistView> createState() =>
      _ShortlistViewState();
}

class _ShortlistViewState
    extends State<ShortlistView> {

  final viewModel = ShortlistViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchSaved();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child:
          Consumer<ShortlistViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState ==
              ViewState.busy) {
            return const Scaffold(
              body: Center(
                  child:
                      CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [

                  /// 🔽 Dropdown
                  DropdownButton<SavedTab>(
                    value: vm.selectedTab,
                    onChanged: (val) {
                      if (val != null) {
                        vm.changeTab(val);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value:
                            SavedTab.offCampus,
                        child: Text(
                            "Off-Campus"),
                      ),
                      DropdownMenuItem(
                        value:
                            SavedTab.internship,
                        child:
                            Text("Internship"),
                      ),
                    ],
                  ),

                  Expanded(
                    child: vm.saved.isEmpty
                        ? const Center(
                            child: Text(
                                "No saved jobs"),
                          )
                        : ListView.builder(
                            itemCount:
                                vm.saved.length,
                            itemBuilder:
                                (context,
                                    index) {

                              final item =
                                  vm.saved[
                                      index];

                              return ListTile(
                                title: Text(
                                    item.jobType ??
                                        ""),
                                subtitle: Text(
                                    item.currentStatus ??
                                        ""),
                              );
                            },
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
}
