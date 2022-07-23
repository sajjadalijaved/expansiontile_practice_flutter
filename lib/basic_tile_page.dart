import 'package:flutter/material.dart';

import 'basic_tile.dart';

import 'utils.dart';

class BasicTilePage extends StatelessWidget {
  const BasicTilePage({Key? key}) : super(key: key);

  get basicTiles => null;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: ListView(
          children:
              basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
}

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.tiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title),
        onTap: () => Utils.showSnackBar(
          context,
          text: 'Clicked on: $title',
          color: Colors.green,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}
