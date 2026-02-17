import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/internship_view.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/job_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
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
                    child: provider.selectedTab ==
                            DashboardTab.internships
                        ? const InternshipView()
                        : const JobView(),
                  ),
                ],
              ),
            ),
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
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
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
                    left: provider.selectedTab ==
                            DashboardTab.internships
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
                        isSelected: provider.selectedTab ==
                            DashboardTab.internships,
                        onTap: () => provider
                            .changeTab(DashboardTab.internships),
                      ),
                      _segmentItem(
                        title: "Jobs",
                        isSelected:
                            provider.selectedTab == DashboardTab.jobs,
                        onTap: () =>
                            provider.changeTab(DashboardTab.jobs),
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
              color:
                  isSelected ? Colors.white : AppColors.primary,
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
    return Row(
      children: const [
        _SmallChip(text: "Sort By :"),
        SizedBox(width: 12),
        _SmallChip(text: "Filters", hasIcon: true),
      ],
    );
  }
}

class _SmallChip extends StatelessWidget {
  final String text;
  final bool hasIcon;

  const _SmallChip({
    required this.text,
    this.hasIcon = false,
  });

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
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
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

