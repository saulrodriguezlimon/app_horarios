import 'package:flutter/material.dart';

import '../models/building_model.dart';

class BuildingScreen extends StatelessWidget {

  final BuildingModel building;

  const BuildingScreen({
    super.key,
    required this.building,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(building.name),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              building.name,

              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Total de salones: ${building.totalRooms}',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              'Ocupados: ${building.occupiedRooms}',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              'Libres: ${building.freeRooms}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}