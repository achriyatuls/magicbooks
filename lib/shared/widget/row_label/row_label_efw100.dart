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
            // Header dengan judul Scaffold-style
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'EFW100 - Common Widget',
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
            // Preview content
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
  // Khusus untuk beberapa jenis widget, butuh pembungkus Material/Scaffold
  if (widget is Scaffold) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: widget,
    );
  }

  if (widget is AppBar) {
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          children: [
            SizedBox(
              height: 56,
              child: widget,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(child: Text('AppBar Preview')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  if (widget is FloatingActionButton) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        child: Container(
          color: Colors.grey[200],
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }

  if (widget is CircleAvatar) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Card) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: widget,
      ),
    );
  }

  if (widget is ListTile) {
    return Material(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: widget,
      ),
    );
  }

  if (widget is ElevatedButton) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  if (widget is SizedBox) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Padding) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  if (widget is Center) {
    return Material(
      child: Container(
        color: Colors.white,
        child: widget,
      ),
    );
  }

  if (widget is Align) {
    return Material(
      child: Container(
        color: Colors.white,
        child: widget,
      ),
    );
  }

  return Material(
    child: Container(
      color: Colors.white,
      child: Center(child: widget),
    ),
  );
}
