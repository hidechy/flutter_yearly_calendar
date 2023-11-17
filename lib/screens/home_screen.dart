import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../alert/yearly_calendar_alert.dart';
import '../components/_brain_log_dialog.dart';
import '../extensions/extensions.dart';
import '../state/app_param/app_param_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(appParamProvider.select((value) => value.selectedDate));

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                GestureDetector(
                  onTap: () {
                    BrainLogDialog(context: context, widget: YearlyCalendarAlert());
                  },
                  child: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            Text((selectedDate != null) ? selectedDate.yyyymmdd : DateTime.now().yyyymmdd),
          ],
        ),
      ),
    );
  }
}
