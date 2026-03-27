import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
class AppInput extends StatelessWidget {
  final String hint;

  const AppInput(this.hint, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
         decoration: appInputDecoration(hint),
      ),
    );
  }
}
class AppDropdown extends StatefulWidget {
  final String hint;
  final List<String> options;
  final String? value;
  final Function(String?)? onChanged;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.options,
    this.value,
    this.onChanged,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? selected;

  @override
  void initState() {
    selected = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// 🔥 FIX: ensure value exists in options
    final safeValue =
        widget.options.contains(selected) ? selected : null;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: DropdownButtonFormField<String>(
        value: safeValue, // ✅ FIXED
        isExpanded: true,
        dropdownColor: AppColors.kCard,

        hint: Text(
          widget.hint,
          style: const TextStyle(color: Colors.white),
        ),

        style: const TextStyle(color: Colors.white),

        decoration: appInputDecoration("").copyWith(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),

        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),

        items: widget.options.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e, style: const TextStyle(color: Colors.white)),
          );
        }).toList(),

        onChanged: (val) {
          setState(() => selected = val);
          if (widget.onChanged != null) widget.onChanged!(val);
        },
      ),
    );
  }
}

class AppMultiSelectChips extends StatefulWidget {
  final String label;
  final List<String> options;

  const AppMultiSelectChips({
    super.key,
    required this.label,
    required this.options,
  });

  @override
  State<AppMultiSelectChips> createState() => _AppMultiSelectChipsState();
}

class _AppMultiSelectChipsState extends State<AppMultiSelectChips> {
  final TextEditingController customCtrl = TextEditingController();

  List<String> selected = [];
  bool showCustom = false;

  void toggle(String value) {
    setState(() {
      if (selected.contains(value)) {
        selected.remove(value);
        if (value == "Others") showCustom = false;
      } else {
        selected.add(value);
        if (value == "Others") showCustom = true;
      }
    });
  }

  void addCustom(String val) {
    if (val.trim().isEmpty) return;
    setState(() {
      selected.add(val.trim());
      customCtrl.clear();
    });
  }

  void remove(String val) {
    setState(() => selected.remove(val));
  }

  @override
  Widget build(BuildContext context) {
    final customItems =
        selected.where((e) => !widget.options.contains(e)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
        Text(
          widget.label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),

        const SizedBox(height: 8),

        /// BOX
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:     Colors.grey.shade900,

            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.kBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// OPTIONS
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.options.map((e) {
                  final isSelected = selected.contains(e);

                  return GestureDetector(
                    onTap: () => toggle(e),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.kGreen.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.kGreen
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.kGreen
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 12),

              /// CUSTOM INPUT (ONLY IF OTHERS SELECTED)
              if (showCustom) ...[
                TextField(
                  controller: customCtrl,
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: addCustom,
                  decoration: InputDecoration(
                    hintText: "Add custom certification",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
        fillColor: Colors.grey.shade900,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],

              /// SELECTED CHIPS
              if (customItems.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: customItems.map((e) {
                    return Chip(
                      label: Text(e),
                      onDeleted: () => remove(e),
                      backgroundColor: AppColors.kGreen,
                      labelStyle: const TextStyle(color: Colors.black),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
class AppHeader extends StatelessWidget {
  final String title;
  final String highlight;
  final VoidCallback onBack;

  const AppHeader({
    super.key,
    required this.title,
    required this.highlight,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onBack,
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text("Back", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),

        const SizedBox(height: 20),

        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "$title ",
                style: const TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: highlight,
                style: const TextStyle(color: Color(0xFF22C55E)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class AppChips extends StatelessWidget {
  final List<String> items;

  const AppChips(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: items
          .map((e) => Chip(
                label: Text(e),
                backgroundColor: const Color(0xFF1F2937),
                labelStyle: const TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }
}

InputDecoration appInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.white),
    filled: true,
        fillColor: Colors.grey.shade900,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.kBorder),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.kBorder),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.kGreen),
    ),
  );
}