import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/alumni/presentation/view_model/alumni_view_model.dart';

import 'widgets/alumni_hiring_card.dart';

class AlumniHiringView extends StatefulWidget {
  const AlumniHiringView({super.key});

  @override
  State<AlumniHiringView> createState() => _AlumniHiringViewState();
}

class _AlumniHiringViewState extends State<AlumniHiringView> {
  AlumniType selectedTab = AlumniType.hiring;
  late final PageController _pageController;

  /// 🔥 TODO: replace with real user type logic
  bool get isProfessional =>
      getIt<AppStateProvider>().userType == UserType.professional;

  AlumniViewModel alumniViewModel = AlumniViewModel();
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: selectedTab.index);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        alumniViewModel.fetchCollegeAlumni(),
        alumniViewModel.fetchCompanyAlumni(),
        alumniViewModel.fetchHiringAlumni(),
      ], eagerError: true);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await Future.wait([
      alumniViewModel.fetchCollegeAlumni(),
      alumniViewModel.fetchCompanyAlumni(),
      alumniViewModel.fetchHiringAlumni(),
    ], eagerError: true);
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
                      hintStyle: TextStyle(color: AppColors.secBorder),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.chip,
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
              Expanded(
                child: ClipRect(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedTab = AlumniType.values[index];
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RefreshIndicator(
                          color: AppColors.kGreen,
                          onRefresh: _refresh,
                          child: _buildList(AlumniType.hiring),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RefreshIndicator(
                          color: AppColors.kGreen,
                          onRefresh: _refresh,
                          child: _buildList(AlumniType.college),
                        ),
                      ),

                      if (isProfessional)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: RefreshIndicator(
                            color: AppColors.kGreen,
                            onRefresh: _refresh,
                            child: _buildList(AlumniType.company),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
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
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          ...tabs.map((t) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedTab = t);

                  _pageController.animateToPage(
                    t.index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
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
                        color: t == selectedTab
                            ? AppColors.onGreenButton
                            : AppColors.secText,
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

  /// 🔥 LIST BASED ON TAB
  Widget _buildList(AlumniType type) {
    return Consumer<AlumniViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final groupedList = vm.jobs(type);

        if (groupedList.isEmpty) {
          debugPrint("GROUPED LIST COUNT => ${groupedList.length}");
          debugPrint("FIRST ITEM => ${groupedList.firstOrNull}");
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 4),

            physics: const AlwaysScrollableScrollPhysics(),

            children: const [
              SizedBox(height: 250),

              Center(
                child: Text(
                  "No alumni found",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: groupedList.length,
          itemBuilder: (_, index) {
            return AlumniHiringCard(jobs: groupedList[index]);
          },
        );
      },
    );
  }
}
