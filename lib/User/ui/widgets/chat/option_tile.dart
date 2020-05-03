import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';

class OptionTile extends StatelessWidget {
  final Function(String _idTempEvent, String newText) onSelectOption;
  final Sequence sequence;
  final int index;

  const OptionTile({this.sequence, this.index, this.onSelectOption});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("1 Print ${sequence.next.documentID} + $index");
        onSelectOption(sequence.next.documentID, sequence.text);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Container(
              padding: EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                "Opción ${index + 1}",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.display1.copyWith(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    sequence.text,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}