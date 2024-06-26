import 'package:flutter/material.dart';
import 'package:pokedex/presentation/models/base_stats_model.dart';

class BaseStatsTab extends StatelessWidget {

  final BaseStats baseStats;

  const BaseStatsTab({super.key, required this.baseStats});

  @override
  Widget build(BuildContext context) {
    final stats = {
      'HP': baseStats.hp,
      'Attack': baseStats.attack,
      'Defense': baseStats.defense,
      'Sp. Atk': baseStats.spatk,
      'Sp. Def': baseStats.spdef,
    };
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: stats.entries
              .map((entry) => StatBar(statName: entry.key, statValue: entry.value))
              .toList(),
        ),
      ),
    );
  }
}

class StatBar extends StatelessWidget {
  final String statName;
  final int statValue;

  const StatBar({super.key, required this.statName, required this.statValue});

  @override
  Widget build(BuildContext context) {
    int checkedStatValue = statValue > 100 ? 100 : statValue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              statName,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 30,
            child: Text(
              statValue.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: statValue < 100 ? Colors.grey.shade300 : Colors.green,
              ),
              child: FractionallySizedBox(
                widthFactor: checkedStatValue / 100,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: statValue < 50 ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
