import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:magicbook/module/efw100_common_widget/validator/efw100_validator.dart';

Widget rowLabelEfw100(Function func, int exerciseNumber) {
  var text = func.toString();
  int startIndex = text.indexOf("'") + 1;
  int endIndex = text.lastIndexOf("'");
  String functionName = text.substring(startIndex, endIndex);

  return Builder(
    builder: (context) {
      // Execute function to get widget for validation
      Widget? result = func();
      bool isValid = Efw100Validator.validateExercise(exerciseNumber, result);
      bool hasWidget = result != null;

      return InkWell(
        onTap: () {
          if (hasWidget) {
            // Re-execute function untuk preview yang fresh
            Widget? freshResult = func();
            bool freshIsValid =
                Efw100Validator.validateExercise(exerciseNumber, freshResult);
            _showWidgetPreview(
                context, freshResult, functionName, freshIsValid);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  functionName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Preview button
              if (hasWidget)
                IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.blue,
                    size: 20,
                  ),
                  onPressed: () {
                    // Re-execute function untuk preview yang fresh
                    Widget? freshResult = func();
                    bool freshIsValid = Efw100Validator.validateExercise(
                        exerciseNumber, freshResult);
                    _showWidgetPreview(
                        context, freshResult, functionName, freshIsValid);
                  },
                  tooltip: 'Preview Widget',
                ),
              // Status icon with completion info
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isValid ? Icons.check_circle : MdiIcons.minusBox,
                    color: isValid ? Colors.green : Colors.grey,
                    size: 32.0,
                  ),
                  if (isValid) // Tampilkan untuk semua exercise yang valid
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'SELESAI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showWidgetPreview(
    BuildContext context, Widget? widget, String title, bool isValid) {
  if (widget == null) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Widget tidak dapat ditampilkan'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
    return;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Expanded(child: Text('Preview: $title')),
          const SizedBox(width: 8),
          Icon(
            isValid ? Icons.check_circle : Icons.error,
            color: isValid ? Colors.green : Colors.red,
          ),
        ],
      ),
      content: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: isValid ? Colors.green : Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[50], // Background untuk widget
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 280,
              maxHeight: 280,
            ),
            child: widget,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  );
}
