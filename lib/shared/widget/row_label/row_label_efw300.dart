import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

Widget rowLabelEfw300(Widget? Function() func, int number) {
  return Builder(
    builder: (context) {
      final result = func();
      final hasWidget = result != null;
      final isValid = Efw300Validator.validateExercise(number, result);

      return InkWell(
        onTap: hasWidget
            ? () => _showWidgetPreview(context, result, number, isValid)
            : null,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Exercise $number',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              if (hasWidget)
                const Icon(
                  Icons.visibility,
                  color: Colors.blue,
                  size: 20,
                ),
              const SizedBox(width: 8),
              Icon(
                isValid ? Icons.check_circle : Icons.cancel,
                color: isValid ? Colors.green : Colors.red,
                size: 20,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showWidgetPreview(
    BuildContext context, Widget widget, int number, bool isValid) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(
            color: isValid ? Colors.green : Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFAD88C6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.visibility, color: Colors.white),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'EFW300 - ListView',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    isValid ? Icons.check_circle : Icons.error,
                    color: isValid ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: _buildPreviewSurface(widget),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPreviewSurface(Widget widget) {
  if (widget is Scaffold) return widget;

  if (widget is Column || widget is Row) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Stack) {
    return Material(
      child: SizedBox(
        width: 200,
        height: 200,
        child: widget,
      ),
    );
  }

  if (widget is Transform) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(child: widget),
      ),
    );
  }

  return Material(
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Center(child: widget),
    ),
  );
}
