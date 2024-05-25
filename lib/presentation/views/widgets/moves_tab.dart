import 'package:flutter/cupertino.dart';

class MovesTab extends StatelessWidget {

  final List<String> moves;

  const MovesTab({super.key, required this.moves});

  List<Widget> getMoves(List<String> moves) {
    List<Widget> movesList = List.empty(growable: true);
    for (var move in moves) {
      movesList.add(Text(move));
      movesList.add(const SizedBox(height: 8.0,));
    }
    return movesList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getMoves(moves),
        ),
      ),
    );
  }
}