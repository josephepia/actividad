import 'package:flutter/material.dart';

class CardItemList extends StatefulWidget {
  final String? imageLeadingUrl;
  final String title;
  final String subtitle;
  final String? trailing;
  const CardItemList({
    Key? key,
    this.imageLeadingUrl,
    required this.title,
    required this.subtitle,
    this.trailing
  }) : super(key: key);

  @override
  State<CardItemList> createState() => _CardItemListState();
}

class _CardItemListState extends State<CardItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 20.0
            )
          ]
      ),
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.imageLeadingUrl ?? ''),
          ),
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          trailing: Container(
            width: 80,
            height: 40,
            // color: Colors.yellow,
            child: Text(
              widget.trailing ?? '',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );;
  }
}
