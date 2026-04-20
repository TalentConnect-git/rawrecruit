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
  int selectedTab = 0;

  /// 🔥 TODO: replace with real user type logic
  bool get isProfessional =>
      getIt<AppStateProvider>().userType == UserType.professional;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlumniViewModel()..fetchCollegeAlumni(),
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
                    onChanged: vm.search,
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
              Expanded(child: _buildList()),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 TABS UI (PILL STYLE)
  Widget _tabs() {
    final tabs = isProfessional
        ? ["Hiring", "My College", "My Company"]
        : ["Hiring", "My College"];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedTab == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.kGreen : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// 🔥 LIST BASED ON TAB
  Widget _buildList() {
    return Consumer<AlumniViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final groupedList = vm.groupedAlumni.values.toList();

        if (groupedList.isEmpty) {
          return const Center(
            child: Text(
              "No alumni found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        /// 🔥 TAB SWITCH
        switch (selectedTab) {
          /// ✅ HIRING TAB
          case 0:
            final hiring = groupedList
                .where((jobs) => jobs.isNotEmpty)
                .toList();

            if (hiring.isEmpty) {
              return const Center(
                child: Text(
                  "No hiring alumni",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }

            return ListView.builder(
              itemCount: hiring.length,
              itemBuilder: (_, index) {
                return AlumniHiringCard(jobs: hiring[index]);
              },
            );

          /// ✅ MY COLLEGE TAB
          case 1:
            return ListView.builder(
              itemCount: groupedList.length,
              itemBuilder: (_, index) {
                return AlumniHiringCard(jobs: groupedList[index]);
              },
            );

          /// ✅ MY COMPANY TAB (placeholder)
          case 2:
            return const Center(
              child: Text(
                "No company data yet",
                style: TextStyle(color: Colors.grey),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
