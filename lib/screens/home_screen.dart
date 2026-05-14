import 'package:flutter/material.dart';

import '../data/buildings_data.dart';
import '../models/building_model.dart';
import 'building_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String orderType = 'Alfabeto';

  @override
  void initState() {
    super.initState();
    sortBuildings();
  }

  void sortBuildings() {
    setState(() {
      if (orderType == 'Alfabeto') {
        buildings.sort(
          (a, b) => a.name.compareTo(b.name),
        );
      } else {
        buildings.sort(
          (a, b) => b.occupiedRooms.compareTo(a.occupiedRooms),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          'Horarios',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// SALUDO
            const Text(
              'Bienvenido {user}!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Selecciona un edificio de interes :)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            /// DROPDOWN
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: orderType,

                  isExpanded: true,

                  items: const [
                    DropdownMenuItem(
                      value: 'Alfabeto',
                      child: Text('Ordenar por alfabeto'),
                    ),

                    DropdownMenuItem(
                      value: 'Concurrencia',
                      child: Text('Ordenar por concurrencia'),
                    ),
                  ],

                  onChanged: (value) {
                    orderType = value!;
                    sortBuildings();
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// GRID DE EDIFICIOS
            Expanded(
              child: GridView.builder(
                itemCount: buildings.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.95,
                ),

                itemBuilder: (context, index) {
                  final building = buildings[index];

                  return buildingCard(
                    context,
                    building,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildingCard(
    BuildContext context,
    BuildingModel building,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) => BuildingScreen(
              building: building,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// NOMBRE
              Text(
                building.name,

                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              /// TOTAL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Text(
                  'Total: ${building.totalRooms}',

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              /// OCUPADOS Y LIBRES
              Row(
                children: [

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Column(
                        children: [

                          const Text(
                            'Ocupados',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '${building.occupiedRooms}',

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Column(
                        children: [

                          const Text(
                            'Libres',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '${building.freeRooms}',

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}