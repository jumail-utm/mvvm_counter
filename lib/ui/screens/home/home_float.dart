import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:mvvm_counter/ui/ui_utils.dart';
import 'home_viewmodel.dart';

class HomeFloat extends StatelessWidget {
  const HomeFloat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<HomeViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => FloatingActionButton(
        onPressed: () =>
            showSnackBarWhenError(context, viewmodel.incrementCounter),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
