import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/my_job_card.dart';

class PostedJobView extends StatefulWidget {
  const PostedJobView({super.key});

  @override
  State<PostedJobView> createState() => _PostedJobViewState();
}

class _PostedJobViewState extends State<PostedJobView> {
  PostedJobViewModel postedJobViewModel = PostedJobViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await postedJobViewModel.getPostedJobs();
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: postedJobViewModel,
      child: Scaffold(
        appBar: RAppBar(
          label: 'Posted Jobs',
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        body: Consumer<PostedJobViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.isLoading) return Center(child: AppLoadingIndicator());

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final job = vm.jobs[index];
                  return MyJobCard(job: job);
                },
                separatorBuilder: (_, _) => SizedBox(height: 4),
                itemCount: vm.jobs.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
