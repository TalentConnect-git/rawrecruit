import 'package:flutter/material.dart';

class ApplicationProgressStepper extends StatelessWidget {
  final int currentStep;
  final String status;

  const ApplicationProgressStepper({
    super.key,
    required this.status,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _stepCircle(isCompleted: currentStep >= 0, label: "applied", index: 0),
        _line(),
        _stepCircle(
          isCompleted: currentStep >= 1,
          label: "shortlisted",
          index: 1,
        ),
        _line(),
        if (status == 'Rejected')
          _stepCircle(
            isCompleted: currentStep >= 2,
            label: "Rejected",
            index: 2,
            isErrored: true,
          )
        else
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
    bool isErrored = false,
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
                ? isErrored
                      ? Colors.red
                      : Colors.green
                : Colors.grey.shade300,
          ),
          child: Center(
            child: isCompleted
                ? Icon(
                    isErrored ? Icons.close : Icons.check,
                    color: Colors.white,
                  )
                : Text(
                    "${index + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _line() {
    return Expanded(
      child: Center(child: Container(height: 2, color: Colors.black)),
    );
  }
}
