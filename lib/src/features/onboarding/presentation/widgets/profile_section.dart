import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    required this.label,
    required this.children,
    this.trailing,
    this.spacing = 16,
    this.initiallyExpanded = true,
    super.key,
  });

  final String label;
  final Widget? trailing;
  final List<Widget> children;
  final double spacing;
  final bool initiallyExpanded;

  @override
  State<ProfileSection> createState() =>
      _ProfileSectionState();
}

class _ProfileSectionState
    extends State<ProfileSection> {

  late bool isExpanded;

  @override
  void initState() {
    super.initState();

    isExpanded =
        widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.kCard,

        borderRadius:
            BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment:
            CrossAxisAlignment.start,

        spacing: widget.spacing,

        children: [

          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded =
                    !isExpanded;
              });
            },

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                Row(
                  children: [

                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,

                      color: Colors.white,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      widget.label,

                      style: AppTextStyles.s18W600
                          .copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                widget.trailing ??
                    const SizedBox(),
              ],
            ),
          ),

          if (isExpanded)
            ...widget.children,
        ],
      ),
    );
  }
}