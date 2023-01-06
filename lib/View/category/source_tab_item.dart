import 'package:flutter/material.dart';
import 'package:news_app/Model/sources/Source.dart';

class SourceTabItem extends StatelessWidget {
  Source? source;
  bool selected;

  SourceTabItem(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      ),
      child: Text(
        source?.name ?? '',
        style: TextStyle(
          color: selected ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
