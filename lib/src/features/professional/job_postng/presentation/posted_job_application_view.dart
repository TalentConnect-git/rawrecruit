import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/application_list_item.dart';

class PostedJobApplicationView extends StatefulWidget {
  const PostedJobApplicationView({this.id, super.key});
  final String? id;

  @override
  State<PostedJobApplicationView> createState() =>
      _PostedJobApplicationViewState();
}

class _PostedJobApplicationViewState extends State<PostedJobApplicationView> {
  PostedJobApplicationViewModel postedJobApplicationViewModel =
      PostedJobApplicationViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await postedJobApplicationViewModel.getApplications(
        id: widget.id ?? '-',
      );
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: postedJobApplicationViewModel,
      child: Scaffold(
        appBar: RAppBar(
          label: 'Applications',
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        body: Consumer<PostedJobApplicationViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.isLoading) return Center(child: AppLoadingIndicator());

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final job = vm.application[index];

                  return ApplicationListItem(
                    onTap: () {
                      context.pushNamed(RouteNames.applicantDetail, extra: job);
                    },
                    application: job,
                    onApplyOrReject: (status) async {
                      final failure = await vm.updateApplicationStatus(
                        id: job.id ?? '-',
                        status: status,
                      );

                      Toasts.showSuccessOrFailureToast(
                        context,
                        failure: failure,
                        popOnSuccess: false,
                        successMsg:
                            'Application is ${status.name} successfully.',
                        successCallback: () async {
                          await vm.getApplications(id: widget.id ?? '-');
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (_, _) => SizedBox(height: 4),
                itemCount: vm.application.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
