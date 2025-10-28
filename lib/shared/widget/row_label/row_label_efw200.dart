import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

Widget rowLabelEfw200(Widget? Function() func, int number) {
  return Builder(
    builder: (context) {
      final result = func();
      final hasWidget = result != null;
      final isValid = Efw200Validator.validateExercise(number, result);

      return InkWell(
        onTap: hasWidget
            ? () => _showWidgetPreview(context, result, number, isValid)
            : null,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exercise $number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasWidget)
                Icon(
                  Icons.visibility,
                  color: Colors.blue,
                  size: 20,
                ),
              SizedBox(width: 8),
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
              decoration: BoxDecoration(
                color: const Color(0xFFAD88C6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.visibility, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'EFW200 - Layout',
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
                  borderRadius: BorderRadius.only(
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
  // Wrapper untuk berbagai widget types agar bisa dirender dengan baik
  if (widget is Scaffold) {
    return widget;
  }

  if (widget is Column || widget is Row) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Stack) {
    return Material(
      child: Container(
        width: 200,
        height: 200,
        child: widget,
      ),
    );
  }

  if (widget is Transform) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(child: widget),
      ),
    );
  }

  // Default wrapper untuk kelompok widget lainnya
  return Material(
    child: Container(
      padding: EdgeInsets.all(16),
      child: Center(child: widget),
    ),
  );
}
