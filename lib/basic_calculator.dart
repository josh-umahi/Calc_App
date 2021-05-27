import 'package:flutter/material.dart';

import 'constants.dart';
import './components/table_of_buttons.dart';
import './components/entries_and_results_display.dart';

class BasicCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: defaultPadding, bottom: 14),
              child: EntriesAndResultsDisplay(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                defaultPadding,
                defaultPadding,
                defaultPadding,
                50,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: TableOfButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
