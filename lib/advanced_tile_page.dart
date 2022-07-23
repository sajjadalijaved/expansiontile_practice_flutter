import 'package:expansiontile_practice/utils.dart';
import 'package:flutter/material.dart';

import 'advance_tile.dart';

class AdvancedTilePage extends StatefulWidget {
  const AdvancedTilePage({Key? key}) : super(key: key);

  @override
  _AdvancedTilePageState createState() => _AdvancedTilePageState();
}

class _AdvancedTilePageState extends State<AdvancedTilePage> {
  get advancedTiles => null;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (index, isExpanded) {
              final tile = advancedTiles[index];
              setState(() => tile.isExpanded = isExpanded);

              Utils.showSnackBar(
                context,
                text: isExpanded
                    ? 'Shrink ${tile.title}'
                    : 'Expand ${tile.title}',
                color: Colors.green,
              );
            },
            children: advancedTiles
                .map((tile) => ExpansionPanelRadio(
                      value: tile.title,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => buildTile(tile),
                      body: Column(
                        children: tile.tiles.map(buildTile).toList(),
                      ),
                    ))
                .toList(),
          ),
        ),
      );

  Widget buildTile(AdvancedTile tile) => ListTile(
        // ignore: unnecessary_null_comparison
        leading: tile.icon != null ? Icon(tile.icon) : null,
        title: Text(tile.title),
        onTap: tile.tiles.isEmpty
            ? () => Utils.showSnackBar(
                  context,
                  text: 'Clicked on: ${tile.title}',
                  color: Colors.green,
                )
            : null,
      );
}
