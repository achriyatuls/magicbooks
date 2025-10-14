import 'package:flutter/material.dart';
import '../../model/efd_config.dart';
import 'efd_widgets.dart';
import 'efd_dialogs.dart';

/// Generic View untuk semua EFD modules
/// Menggantikan duplicated view code di setiap module
///
/// Usage:
/// ```dart
/// class Efd1100VariableView extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return EfdGenericView(
///       config: EfdModuleConfig(
///         moduleCode: "EFD1100",
///         moduleName: "Variable",
///         // ... other config
///       ),
///     );
///   }
/// }
/// ```
class EfdGenericView extends StatefulWidget {
  final EfdModuleConfig config;

  const EfdGenericView({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  State<EfdGenericView> createState() => _EfdGenericViewState();
}

class _EfdGenericViewState extends State<EfdGenericView> {
  @override
  Widget build(BuildContext context) {
    final config = widget.config;

    return Scaffold(
      backgroundColor: config.backgroundColor,
      appBar: _buildAppBar(config),
      body: _buildBody(config),
      floatingActionButton: _buildFAB(config),
    );
  }

  /// AppBar dengan actions untuk statistics dan run all tests
  AppBar _buildAppBar(EfdModuleConfig config) {
    return AppBar(
      title: Text("${config.moduleCode} - ${config.moduleName}"),
      backgroundColor: config.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        // View Statistics button
        IconButton(
          icon: const Icon(Icons.analytics_outlined),
          tooltip: 'View Statistics',
          onPressed: () => EfdDialogs.showOverallStats(context, config),
        ),
        // Run All Tests button
        IconButton(
          icon: const Icon(Icons.play_arrow),
          tooltip: 'Run All Tests',
          onPressed: () => EfdDialogs.showRunAllTests(context, config),
        ),
      ],
    );
  }

  /// Main body dengan semua components
  Widget _buildBody(EfdModuleConfig config) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Banner
            EfdWidgets.buildInfoBanner(config),
            const SizedBox(height: 16),

            // Quick Stats Card
            EfdWidgets.buildQuickStatsCard(config),
            const SizedBox(height: 16),

            // How to Use Instructions
            EfdWidgets.buildInstructionsCard(config),
            const SizedBox(height: 16),

            // Section Title
            EfdWidgets.buildSectionTitle("Exercises"),
            const SizedBox(height: 12),

            // Dynamic Exercise Cards
            ...List.generate(
              config.totalExercises,
              (index) => EfdWidgets.buildExerciseCard(
                config.buildExerciseRow(index + 1),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Floating Action Button untuk quick access ke statistics
  Widget _buildFAB(EfdModuleConfig config) {
    return FloatingActionButton.extended(
      onPressed: () => EfdDialogs.showOverallStats(context, config),
      backgroundColor: config.primaryColor,
      icon: const Icon(Icons.analytics),
      label: const Text('View Stats'),
    );
  }
}

/// Helper widget untuk modules yang masih menggunakan StatefulWidget pattern
/// Ini untuk backward compatibility dengan existing controllers
class EfdGenericStatefulView extends StatefulWidget {
  final EfdModuleConfig config;
  final Widget Function(BuildContext, dynamic) builder;
  final dynamic controller;

  const EfdGenericStatefulView({
    Key? key,
    required this.config,
    required this.builder,
    required this.controller,
  }) : super(key: key);

  @override
  State<EfdGenericStatefulView> createState() => _EfdGenericStatefulViewState();
}

class _EfdGenericStatefulViewState extends State<EfdGenericStatefulView> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller);
  }
}

/// Mixin untuk existing controllers yang ingin menggunakan generic functionality
mixin EfdGenericMixin {
  /// Show overall statistics dialog
  void showOverallStatsDialog(BuildContext context, EfdModuleConfig config) {
    EfdDialogs.showOverallStats(context, config);
  }

  /// Show run all tests dialog
  void showRunAllTestsDialog(BuildContext context, EfdModuleConfig config) {
    EfdDialogs.showRunAllTests(context, config);
  }

  /// Show success message
  void showSuccess(BuildContext context, String message) {
    EfdDialogs.showSuccess(context, 'Success', message);
  }

  /// Show error message
  void showError(BuildContext context, String message) {
    EfdDialogs.showError(context, 'Error', message);
  }
}
