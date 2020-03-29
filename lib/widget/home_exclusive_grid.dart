import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_exclusive_grid_model.dart';

class HomeExclusiveGrid extends StatelessWidget {
  final String title;
  final List<HomeExclusiveGridModel> list;

  const HomeExclusiveGrid({Key key, this.title, this.list}) : super(key: key);

  Widget _createItem(
      HomeExclusiveGridModel model, EdgeInsets margin, TextStyle style) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            child: CachedNetworkImage(fit: BoxFit.fill, imageUrl: model.url),
            borderRadius: BorderRadius.circular(5),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(model.label, style: style),
                        Text('实惠安心送到家',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 237, 120, 47))),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(color: Color.fromARGB(245, 238, 238, 238)),
                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
        fit: StackFit.expand,
      ),
      margin: margin,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      childAspectRatio: 1.5,
      mainAxisSpacing: 5,
      children: <Widget>[
        _createItem(list[0], EdgeInsets.only(left: 10), style),
        _createItem(list[1], EdgeInsets.only(right: 10), style),
        _createItem(list[2], EdgeInsets.only(left: 10), style),
        _createItem(list[3], EdgeInsets.only(right: 10), style),
      ],
    );
  }
}