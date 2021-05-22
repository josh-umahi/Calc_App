import 'package:flutter/material.dart';

import '../../constants.dart';
import './widgets/ActionButton.dart';
import './widgets/NumberButton.dart';

class BasicCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: defaultPadding, bottom: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: 29,
                    width: double.infinity,
                    child: ListView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text(
                          "12 + 5",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: defaultPadding),
                    alignment: AlignmentDirectional.centerEnd,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "87",
                        style: TextStyle(
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
              child: Table(
                children: [
                  TableRow(
                    children: [
                      ActionButton(text: "AC"),
                      ActionButton(icon: Icons.brightness_4_outlined),
                      ActionButton(text: '%'),
                      ActionButton(unicodeText: "\u00f7"),
                    ],
                  ),
                  _buildTableRowSpacing(),
                  TableRow(
                    children: [
                      NumberButton('7'),
                      NumberButton('8'),
                      NumberButton('9'),
                      ActionButton(unicodeText: "\u00d7"),
                    ],
                  ),
                  _buildTableRowSpacing(),
                  TableRow(
                    children: [
                      NumberButton('4'),
                      NumberButton('5'),
                      NumberButton('6'),
                      ActionButton(unicodeText: "\u2013"),
                    ],
                  ),
                  _buildTableRowSpacing(),
                  TableRow(
                    children: [
                      NumberButton('1'),
                      NumberButton('2'),
                      NumberButton('3'),
                      ActionButton(unicodeText: "\u002b"),
                    ],
                  ),
                  _buildTableRowSpacing(),
                  TableRow(
                    children: [
                      NumberButton('0'),
                      NumberButton('.'),
                      ActionButton(icon: Icons.backspace_outlined),
                      ActionButton(unicodeText: "\u003d"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows() {}

  TableRow _buildTableRowSpacing() {
    return TableRow(
      children: List.generate(4, (index) => SizedBox(height: 22.4)),
    );
  }
}
