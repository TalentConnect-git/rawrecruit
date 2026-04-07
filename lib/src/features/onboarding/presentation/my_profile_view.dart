import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/my_profile_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final MyProfileViewModel myProfileViewModel = MyProfileViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await myProfileViewModel.getUser();
      if (mounted) failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: myProfileViewModel,
      child: Scaffold(
        body: Consumer<MyProfileViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.isLoading) {
              return const Center(child: AppLoadingIndicator());
            }

            final p = vm.user;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  // ── HEADER CARD ──────────────────────────────────────────
                  _card(
                    child: Row(
                      spacing: 16,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.card,
                          ),
                          child:
                              vm.isProfileAvailable &&
                                  (p?.profileImage ?? '').isNotEmpty
                              ? Image.network(
                                  p!.profileImage!,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Icon(Icons.person, size: 32),
                                ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p?.name ?? '-',
                                style: AppTextStyles.s18W600,
                              ),
                              Text(
                                p?.email ?? '-',
                                style: AppTextStyles.s16W400,
                              ),
                              if ((p?.phone ?? '').isNotEmpty)
                                Text(p!.phone!, style: AppTextStyles.s14W400),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── BASIC INFO ───────────────────────────────────────────
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 6,
                      children: [
                        _sectionTitle('Basic Information'),
                        const SizedBox(height: 4),
                        _infoRow('Gender', p?.gender),
                        _infoRow('Date of Birth', p?.dob),
                        _infoRow('Ethnicity', p?.ethnicity),
                        _infoRow('Marital Status', p?.maritalStatus),
                        _infoRow('Visa Status', p?.visaStatus),
                      ],
                    ),
                  ),

                  // ── EDUCATION ────────────────────────────────────────────
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 6,
                      children: [
                        _sectionTitle('Education'),
                        const SizedBox(height: 4),
                        _infoRow('College', p?.college),
                        _infoRow('Degree', p?.degree),
                        _infoRow('Specialization', p?.specialization),
                        _infoRow('Semester', p?.semester),
                        _infoRow('Graduation Year', p?.yearOfGraduation),
                        _infoRow('CGPA', p?.cgpa),
                      ],
                    ),
                  ),

                  // ── LINKS ────────────────────────────────────────────────
                  if (_anyNonEmpty([p?.github, p?.linkedin, p?.portfolio]))
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 6,
                        children: [
                          _sectionTitle('Links'),
                          const SizedBox(height: 4),
                          if ((p?.linkedin ?? '').isNotEmpty)
                            _linkRow('LinkedIn', p!.linkedin!),
                          if ((p?.github ?? '').isNotEmpty)
                            _linkRow('GitHub', p!.github!),
                          if ((p?.portfolio ?? '').isNotEmpty)
                            _linkRow('Portfolio', p!.portfolio!),
                        ],
                      ),
                    ),

                  // ── CAREER ───────────────────────────────────────────────
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 6,
                      children: [
                        _sectionTitle('Career'),
                        const SizedBox(height: 4),
                        _infoRow('Open To Shift', p?.openToShift),
                        if ((p?.currentSalaryAmount ?? '').isNotEmpty)
                          _infoRow(
                            'Current Salary',
                            '${p?.currentSalaryAmount ?? ''} ${p?.currentSalaryCurrency ?? ''}',
                          ),
                        if ((p?.expectedSalaryAmount ?? '').isNotEmpty)
                          _infoRow(
                            'Expected Salary',
                            '${p?.expectedSalaryAmount ?? ''} ${p?.expectedSalaryCurrency ?? ''}',
                          ),
                      ],
                    ),
                  ),

                  // ── ABOUT ────────────────────────────────────────────────
                  if ((p?.about ?? '').isNotEmpty)
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 8,
                        children: [
                          _sectionTitle('About'),
                          Text(p!.about!, style: AppTextStyles.s14W400),
                          if ((p.certifications ?? '').isNotEmpty) ...[
                            _sectionTitle('Certifications'),
                            Text(
                              p.certifications!,
                              style: AppTextStyles.s14W400,
                            ),
                          ],
                        ],
                      ),
                    ),

                  // ── SKILLS ───────────────────────────────────────────────
                  if ((p?.skills ?? []).isNotEmpty)
                    _chipCard('Skills', p!.skills!),

                  // ── DOMAIN KNOWLEDGE ─────────────────────────────────────
                  if ((p?.domainKnowledge ?? []).isNotEmpty)
                    _chipCard('Domain Knowledge', p!.domainKnowledge!),

                  // ── JOB ROLES ────────────────────────────────────────────
                  if ((p?.jobRoles ?? []).isNotEmpty)
                    _chipCard('Job Roles', p!.jobRoles!),

                  // ── EMPLOYMENT TYPE ──────────────────────────────────────
                  if ((p?.employmentType ?? []).isNotEmpty)
                    _chipCard('Employment Type', p!.employmentType!),

                  // ── INDUSTRY ─────────────────────────────────────────────
                  if ((p?.industry ?? []).isNotEmpty)
                    _chipCard('Industry', p!.industry!),

                  // ── LOOKING FOR ──────────────────────────────────────────
                  if ((p?.lookingFor ?? []).isNotEmpty)
                    _chipCard('Looking For', p!.lookingFor!),

                  // ── TOOLS & PLATFORMS ────────────────────────────────────
                  if ((p?.toolsAndPlatforms ?? []).isNotEmpty)
                    _chipCard('Tools & Platforms', p!.toolsAndPlatforms!),

                  // ── LANGUAGES KNOWN ──────────────────────────────────────
                  if ((p?.languagesKnown ?? []).isNotEmpty)
                    _chipCard('Languages Known', p!.languagesKnown!),

                  // ── LOCATIONS ────────────────────────────────────────────
                  if ((p?.locations ?? []).isNotEmpty)
                    _chipCard('Preferred Locations', p!.locations!),

                  // ── EXPERIENCES ──────────────────────────────────────────
                  if ((p?.experiences ?? []).isNotEmpty)
                    _chipCard('Experiences', p!.experiences!),

                  // ── ACHIEVEMENTS ─────────────────────────────────────────
                  if ((p?.achievements ?? []).isNotEmpty)
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          _sectionTitle('Achievements'),
                          const SizedBox(height: 4),
                          ...(p!.achievements!).map(
                            (a) => _itemCard(
                              title: a.title ?? '-',
                              subtitle: a.event ?? '',
                              trailing: a.date ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),

                  // ── AWARDS ───────────────────────────────────────────────
                  if ((p?.awards ?? []).isNotEmpty)
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          _sectionTitle('Awards'),
                          const SizedBox(height: 4),
                          ...(p!.awards!).map(
                            (a) => _itemCard(
                              title: a.title ?? '-',
                              subtitle: a.organization ?? '',
                              trailing: [
                                a.startDate,
                                a.endDate,
                              ].where((s) => (s ?? '').isNotEmpty).join(' – '),
                              description: a.description,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // ── PUBLICATIONS ─────────────────────────────────────────
                  if ((p?.publications ?? []).isNotEmpty)
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          _sectionTitle('Publications'),
                          const SizedBox(height: 4),
                          ...(p!.publications!).map(
                            (pub) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pub.title ?? '-',
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                  if ((pub.url ?? '').isNotEmpty)
                                    GestureDetector(
                                      onTap: () async {
                                        final uri = Uri.parse(pub.url!);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(
                                            uri,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                      child: Text(
                                        pub.url!,
                                        style: AppTextStyles.s14W400.copyWith(
                                          color: Colors.purple,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // ── RESUME ───────────────────────────────────────────────
                  if ((p?.resume ?? '').isNotEmpty)
                    _card(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Resume', style: AppTextStyles.s16W600),
                                Text(
                                  'Tap to download',
                                  style: AppTextStyles.s14W400.copyWith(
                                    color: AppColors.chipText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.download_rounded),
                            color: AppColors.chipText,
                            onPressed: () async {
                              final uri = Uri.parse(p!.resume!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                  // ── EDIT BUTTON ──────────────────────────────────────────
                  AppButton(
                    onPressed: () async {
                      final result = await context.pushNamed(
                        RouteNames.addEditProfileView,
                        extra: myProfileViewModel.user,
                      );
                      if (result == true) {
                        final failure = await myProfileViewModel.getUser();
                        if (mounted) failure?.showError(context);
                      }
                    },
                    child: Text(
                      'Edit Profile',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ── Helper builders ──────────────────────────────────────────────────────────

  bool _anyNonEmpty(List<String?> values) =>
      values.any((v) => (v ?? '').isNotEmpty);

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.shadow, spreadRadius: 1, blurRadius: 1),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title, style: AppTextStyles.s16W600);
  }

  Widget _infoRow(String label, String? value) {
    if ((value ?? '').isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: AppTextStyles.s14W600.copyWith(color: AppColors.chipText),
          ),
          Expanded(
            child: Text(
              value!,
              style: AppTextStyles.s14W400.copyWith(color: AppColors.chipText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkRow(String label, String url) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Row(
        children: [
          Text(
            '$label : ',
            style: AppTextStyles.s14W600.copyWith(color: AppColors.chipText),
          ),
          Expanded(
            child: Text(
              url,
              style: AppTextStyles.s14W400.copyWith(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipCard(String title, List<String> items) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          _sectionTitle(title),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item,
                  style: AppTextStyles.s14W600.copyWith(
                    color: AppColors.chipText,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _itemCard({
    required String title,
    String? subtitle,
    String? trailing,
    String? description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.s14W600.copyWith(
                    color: AppColors.chipText,
                  ),
                ),
              ),
              if ((trailing ?? '').isNotEmpty)
                Text(
                  trailing!,
                  style: AppTextStyles.s12W400.copyWith(
                    color: AppColors.chipText,
                  ),
                ),
            ],
          ),
          if ((subtitle ?? '').isNotEmpty)
            Text(
              subtitle!,
              style: AppTextStyles.s14W400.copyWith(color: AppColors.chipText),
            ),
          if ((description ?? '').isNotEmpty)
            Text(
              description!,
              style: AppTextStyles.s14W400.copyWith(color: AppColors.chipText),
            ),
        ],
      ),
    );
  }
}
