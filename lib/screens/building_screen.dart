import 'package:flutter/material.dart';

import '../models/building_model.dart';
import '../models/room_model.dart';
import '../models/class_schedule_model.dart';

class BuildingScreen extends StatefulWidget {

  final BuildingModel building;

  const BuildingScreen({
    super.key,
    required this.building,
  });

  @override
  State<BuildingScreen> createState() =>
      _BuildingScreenState();
}

class _BuildingScreenState
    extends State<BuildingScreen> {

  final List<String> days = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo',
  ];

  String getCurrentDay() {

    final now = DateTime.now();

    switch (now.weekday) {

      case 1:
        return 'Lunes';

      case 2:
        return 'Martes';

      case 3:
        return 'Miercoles';

      case 4:
        return 'Jueves';

      case 5:
        return 'Viernes';

      case 6:
        return 'Sabado';

      default:
        return 'Domingo';
    }
  }

  int getCurrentHour() {
    return DateTime.now().hour;
  }

  bool isClassActive(ClassSchedule schedule) {

    final currentDay = getCurrentDay();

    final currentHour = getCurrentHour();

    return schedule.day == currentDay &&
        currentHour >= schedule.startHour &&
        currentHour < schedule.endHour;
  }

  bool isRoomOccupied(RoomModel room) {

    for (var schedule in room.schedules) {

      if (isClassActive(schedule)) {
        return true;
      }
    }

    return room.manuallyOccupied;
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: const BoxDecoration(

        image: DecorationImage(
          image: AssetImage(
            'assets/images/backgroundittla.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(

        backgroundColor:
            Colors.black.withOpacity(0.35),

        appBar: AppBar(
          title: Text(widget.building.name),
          backgroundColor: Colors.white,
        ),

        body: ListView.builder(

          padding: const EdgeInsets.all(16),

          itemCount:
              widget.building.rooms.length,

          itemBuilder: (context, index) {

            final room =
                widget.building.rooms[index];

            final occupied =
                isRoomOccupied(room);

            return Container(

              margin:
                  const EdgeInsets.only(
                bottom: 16,
              ),

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: occupied
                    ? Colors.red
                        .shade100
                        .withOpacity(0.92)
                    : Colors.green
                        .shade100
                        .withOpacity(0.92),

                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    room.roomName,

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(

                    occupied
                        ? 'Estado: Ocupado'
                        : 'Estado: Libre',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,

                      color: occupied
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),

                  const SizedBox(height: 14),

                  if (room.schedules.isNotEmpty)

                    const Text(
                      'Horarios:',

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                  const SizedBox(height: 8),

                  ...room.schedules.map(
                    (schedule) {

                      final active =
                          isClassActive(schedule);

                      return Container(

                        margin:
                            const EdgeInsets.only(
                          bottom: 10,
                        ),

                        padding:
                            const EdgeInsets.all(10),

                        decoration: BoxDecoration(

                          color: active
                              ? Colors.orange
                                  .shade200
                              : Colors.white
                                  .withOpacity(0.95),

                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),

                        child: Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              schedule.subject,

                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            Text(schedule.day),

                            Text(
                              '${schedule.startHour}:00 - ${schedule.endHour}:00',
                            ),

                            if (active)

                              const Padding(
                                padding:
                                    EdgeInsets.only(
                                  top: 6,
                                ),

                                child: Text(
                                  'CLASE ACTIVA',

                                  style:
                                      TextStyle(
                                    color:
                                        Colors.red,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          occupied
                              ? Colors.red
                              : Colors.green,
                    ),

                    onPressed: () {

                      setState(() {

                        room.manuallyOccupied =
                            !room
                                .manuallyOccupied;
                      });
                    },

                    child: Text(

                      room.manuallyOccupied
                          ? 'Liberar salón'
                          : 'Marcar ocupado',

                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}