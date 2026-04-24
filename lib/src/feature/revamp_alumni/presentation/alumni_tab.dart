import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/view_model/alumni_view_model.dart';

import 'widgets/alumni_hiring_card.dart';

class AlumniHiringView extends StatefulWidget {
  const AlumniHiringView({super.key});

  @override
  State<AlumniHiringView> createState() => _AlumniHiringViewState();
}

class _AlumniHiringViewState extends State<AlumniHiringView> {
  AlumniType selectedTab = AlumniType.hiring;

  /// 🔥 TODO: replace with real user type logic
  bool get isProfessional =>
      getIt<AppStateProvider>().userType == UserType.professional;

  AlumniViewModel alumniViewModel = AlumniViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        alumniViewModel.fetchCollegeAlumni(),
        alumniViewModel.fetchCompanyAlumni(),
      ], eagerError: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => alumniViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔍 SEARCH
              Consumer<AlumniViewModel>(
                builder: (context, vm, _) {
                  return TextField(
                    onChanged: (value) {
                      vm.search(value, selectedTab);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search alumni...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              /// 🔥 TABS
              _tabs(),

              const SizedBox(height: 16),

              /// 🔥 LIST
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 TABS UI (PILL STYLE)
  Widget _tabs() {
    final tabs = isProfessional ? AlumniType.values : AlumniType.freshers;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          ...tabs.map((t) {
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedTab = t),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: t == selectedTab
                        ? AppColors.kGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      t.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: t == selectedTab ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (selectedTab) {
      case AlumniType.hiring:
        return _buildList(AlumniType.hiring);
      case AlumniType.college:
        return _buildList(AlumniType.college);
      case AlumniType.company:
        return _buildList(AlumniType.company);
    }
  }

  /// 🔥 LIST BASED ON TAB
  Widget _buildList(AlumniType type) {
    return Consumer<AlumniViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final groupedList = vm.jobs(type);

        if (groupedList.isEmpty) {
          return const Center(
            child: Text(
              "No alumni found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: groupedList.length,
          itemBuilder: (_, index) {
            return AlumniHiringCard(jobs: groupedList[index]);
          },
        );
      },
    );
  }
}
