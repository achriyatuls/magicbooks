import 'package:flutter/material.dart';
import 'package:magicbook/state_util.dart';
import '../view/efw400_grid_view.dart';
import 'package:magicbook/shared/service/efw400_progress_service.dart';

class Efw400GridController extends State<Efw400GridView>
    implements MvcController {
  static late Efw400GridController instance;
  late Efw400GridView view;

  @override
  void initState() {
    instance = this;
    // Register view for preview/status service
    Efw400ProgressService.instance.setEfw400View(widget);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
