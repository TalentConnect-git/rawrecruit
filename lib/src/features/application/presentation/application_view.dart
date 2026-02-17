import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/application/presentation/widget/application_card.dart';
import 'package:rawrecruit/src/features/application/presentation/widget/search_bar.dart';

class ApplicationsView extends StatelessWidget {
  const ApplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              ApplicationSearchBar(),
              SizedBox(height: 20),
              Expanded(child: _ApplicationsList()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicationsList extends StatelessWidget {
  const _ApplicationsList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ApplicationCard(
          title: "Software Developer",
          company: "TCS",
          location: "Mumbai",
          status: ApplicationStatus.applied,
        ),
        ApplicationCard(
          title: "Software Developer",
          company: "TCS",
          location: "Mumbai",
          status: ApplicationStatus.accepted,
        ),
        ApplicationCard(
          title: "Software Developer",
          company: "TCS",
          location: "Mumbai",
          status: ApplicationStatus.applied,
        ),
      ],
    );
  }
}
