import 'dart:async';

import 'package:flutter/material.dart';

import '../data/buildings_data.dart';
import '../models/building_model.dart';
import 'building_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({
    super.key,
    required this.username,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String orderType = 'Alfabeto';

  DateTime currentTime = DateTime.now();

  late Timer timer;

  @override
  void initState() {
    super.initState();

    sortBuildings();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          currentTime = DateTime.now();
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void sortBuildings() {
    setState(() {
      if (orderType == 'Alfabeto') {
        buildings.sort(
          (a, b) => a.name.compareTo(b.name),
        );
      } else {
        buildings.sort(
          (a, b) =>
              b.occupiedRooms.compareTo(a.occupiedRooms),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,

        title: const Text(
          'Horarios',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Stack(
        children: [

          /// IMAGEN DE FONDO
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundittla.jpg',
              fit: BoxFit.cover,
            ),
          ),

          /// CAPA OSCURA
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.45),
            ),
          ),

          /// CONTENIDO
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    'Bienvenido ${widget.username}!',

                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius:
                          BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),

                    child: Text(
                      '${currentTime.hour.toString().padLeft(2, '0')}:'
                      '${currentTime.minute.toString().padLeft(2, '0')}:'
                      '${currentTime.second.toString().padLeft(2, '0')}',

                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: orderType,
                        isExpanded: true,

                        items: const [

                          DropdownMenuItem(
                            value: 'Alfabeto',
                            child: Text(
                              'Ordenar por alfabeto',
                            ),
                          ),

                          DropdownMenuItem(
                            value: 'Concurrencia',
                            child: Text(
                              'Ordenar por concurrencia',
                            ),
                          ),
                        ],

                        onChanged: (value) {
                          setState(() {
                            orderType = value!;
                          });

                          sortBuildings();
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

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

                        final building =
                            buildings[index];

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
          ),
        ],
      ),
    );
  }

  Widget buildingCard(
    BuildContext context,
    BuildingModel building,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),

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
          color: Colors.white.withOpacity(0.92),

          borderRadius:
              BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                building.name,

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.symmetric(
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: Text(
                  'Total: ${building.totalRooms}',

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 14,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: Column(
                        children: [

                          const Text(
                            'Ocupados',
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '${building.occupiedRooms}',

                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 14,
                      ),

                      decoration: BoxDecoration(
                        color:
                            Colors.green.shade100,
                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: Column(
                        children: [

                          const Text(
                            'Libres',
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '${building.freeRooms}',

                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
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