import 'package:flutter/material.dart';
import 'package:magicbook/state_util.dart';
import 'package:magicbook/shared/service/efw301_progress_service.dart';
import '../view/efw301_list_view.dart';

class Efw301ListController extends State<Efw301ListView>
    implements MvcController {
  static late Efw301ListController instance;
  late Efw301ListView view;

  @override
  void initState() {
    instance = this;
    // Register current view to progress service for preview/status
    Efw301ProgressService.instance.setEfw301View(widget);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
