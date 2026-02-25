import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/internship_view.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/job_view.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ShortlistViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
      ],
      child: const _DashboardBody(),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.background,

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _SegmentToggle(),
                  const SizedBox(height: 16),
                  const _SortFilterRow(),
                  const SizedBox(height: 16),

                  /// 🔥 SWITCH VIEW BASED ON TAB
                  Expanded(
                    child: provider.selectedTab == DashboardTab.internships
                        ? const InternshipView()
                        : const JobView(),
                  ),
                ],
              ),
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushNamed(RouteNames.jobPosted);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _SegmentToggle extends StatelessWidget {
  const _SegmentToggle();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth / 2;

              return Stack(
                children: [
                  ///  Sliding Background
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    left: provider.selectedTab == DashboardTab.internships
                        ? 0
                        : width,
                    child: Container(
                      width: width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  /// Text Row
                  Row(
                    children: [
                      _segmentItem(
                        title: "Internships",
                        isSelected:
                            provider.selectedTab == DashboardTab.internships,
                        onTap: () =>
                            provider.changeTab(DashboardTab.internships),
                      ),
                      _segmentItem(
                        title: "Jobs",
                        isSelected: provider.selectedTab == DashboardTab.jobs,
                        onTap: () => provider.changeTab(DashboardTab.jobs),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _segmentItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class _SortFilterRow extends StatelessWidget {
  const _SortFilterRow();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Row(
      children: [
        /// Sort Dropdown
        DropdownButton<SortOption>(
          value: provider.sortOption,
          onChanged: (value) {
            if (value != null) {
              provider.changeSort(value);
            }
          },
          items: const [
            DropdownMenuItem(
              value: SortOption.newestFirst,
              child: Text("Sort: Newest First"),
            ),
            DropdownMenuItem(
              value: SortOption.oldestFirst,
              child: Text("Sort: Oldest First"),
            ),
            DropdownMenuItem(
              value: SortOption.companyNameAZ,
              child: Text("Sort: Company Name (A-Z)"),
            ),
            DropdownMenuItem(
              value: SortOption.highestStipend,
              child: Text("Sort: Highest Stipend"),
            ),
            DropdownMenuItem(
              value: SortOption.nearestDeadline,
              child: Text("Sort: Nearest Deadline"),
            ),
          ],
        ),

        const SizedBox(width: 12),

        /// Filters Button
        GestureDetector(
          onTap: () {
            final provider = context.read<DashboardProvider>();

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return ChangeNotifierProvider.value(
                  value: provider,
                  child: const _FilterBottomSheet(),
                );
              },
            );
          },

          child: const _SmallChip(text: "Filters", hasIcon: true),
        ),
      ],
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filters",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// Work Mode
            DropdownButtonFormField<String>(
              value: provider.selectedWorkMode,
              hint: const Text("Select Work Mode"),
              items: const [
                DropdownMenuItem(value: "Hybrid", child: Text("Hybrid")),
                DropdownMenuItem(value: "Remote", child: Text("Remote")),
                DropdownMenuItem(value: "On-Site", child: Text("On-Site")),
              ],
              onChanged: (value) {
                provider.selectedWorkMode = value;
                provider.notifyListeners();
              },
            ),

            const SizedBox(height: 16),

            /// Location
            DropdownButtonFormField<String>(
              value: provider.selectedLocation,
              hint: const Text("Select Location"),
              items: const [
                DropdownMenuItem(value: "Bengaluru", child: Text("Bengaluru")),
                DropdownMenuItem(value: "Mumbai", child: Text("Mumbai")),
              ],
              onChanged: (value) {
                provider.selectedLocation = value;
                provider.notifyListeners();
              },
            ),

            const SizedBox(height: 16),

            /// Paid Only
            CheckboxListTile(
              value: provider.paidOnly,
              title: const Text("Show only paid"),
              onChanged: (value) {
                provider.paidOnly = value ?? false;
                provider.notifyListeners();
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.clearFilters();
                      Navigator.pop(context);
                    },
                    child: const Text("Clear"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Apply"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallChip extends StatelessWidget {
  final String text;
  final bool hasIcon;

  const _SmallChip({required this.text, this.hasIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32, // 👈 small like screenshot
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(6), // 👈 not pill
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          if (hasIcon) ...[
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ],
      ),
    );
  }
}
