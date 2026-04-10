import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/view_model/alumni_view_model.dart';

import 'widgets/alumni_hiring_card.dart';
class AlumniHiringView extends StatefulWidget {
  const AlumniHiringView({super.key});

  @override
  State<AlumniHiringView> createState() => _AlumniHiringViewState();
}

class _AlumniHiringViewState extends State<AlumniHiringView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlumniViewModel()..fetchAlumni(),
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
                      hintStyle:
                          const TextStyle(color: Colors.grey),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.grey),
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

              /// 🔥 LIST
              Expanded(
                child: Consumer<AlumniViewModel>(
                  builder: (context, vm, _) {
                    if (vm.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    /// 🔥 USE GROUPED LIST
                    final groupedList =
                        vm.groupedAlumni.values.toList();

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
                        final jobs = groupedList[index];

                        return AlumniHiringCard(
                          jobs: jobs, // ✅ grouped jobs
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}