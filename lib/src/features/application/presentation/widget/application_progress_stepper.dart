import 'package:flutter/material.dart';

class ApplicationProgressStepper extends StatelessWidget {
  final int currentStep;

  const ApplicationProgressStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _stepCircle(
          isCompleted: currentStep >= 0,
          label: "applied",
          index: 0,
        ),
        _line(),
        _stepCircle(
          isCompleted: currentStep >= 1,
          label: "shortlisted",
          index: 1,
        ),
        _line(),
        _stepCircle(
          isCompleted: currentStep >= 2,
          label: "Accepted",
          index: 2,
        ),
      ],
    );
  }

  Widget _stepCircle({
    required bool isCompleted,
    required String label,
    required int index,
  }) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? Colors.green
                : Colors.grey.shade300,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check,
                    color: Colors.white)
                : Text(
                    "${index + 1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.black,
      ),
    );
  }
}
