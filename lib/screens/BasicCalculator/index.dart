import 'package:flutter/material.dart';

import '../../constants.dart';
import './widgets/ActionButton.dart';
import './widgets/NumberButton.dart';

class BasicCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                defaultPadding,
                0,
                defaultPadding,
                14,
              ),
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
                53,
              ),
              width: double.infinity,
              height: height * 0.6,
              // height:
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
                      ActionButton(),
                      ActionButton(),
                      ActionButton(),
                      ActionButton(),
                    ],
                  ),
                  buildTableRowSpacing(),
                  TableRow(
                    children: [
                      NumberButton('7'),
                      NumberButton('8'),
                      NumberButton('9'),
                      NumberButton('9'),
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

  TableRow buildTableRowSpacing() {
    return TableRow(
      children: List.generate(4, (index) => SizedBox(height: 22.4)),
    );
  }
}

