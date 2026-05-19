import '../models/building_model.dart';
import '../models/room_model.dart';
import '../models/class_schedule_model.dart';

List<BuildingModel> buildings = [

  // =========================
  // EDIFICIO Z
  // =========================

  BuildingModel(
    name: 'Edificio Z',
    totalRooms: 5,
    occupiedRooms: 2,
    freeRooms: 3,

    rooms: [
RoomModel(
        roomName: 'Z 01',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'Z 02',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'Z 03',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'Z 04',
        schedules: [
        ],
      ),
      // Z05
      RoomModel(
        roomName: 'Z 05',

        schedules: [
          ClassSchedule(
            subject: 'Taller Base de Datos',
            room: 'Z 05',
            day: 'Martes',
            startHour: 13,
            endHour: 15,
          ),

          ClassSchedule(
            subject: 'Taller Base de Datos',
            room: 'Z 05',
            day: 'Jueves',
            startHour: 13,
            endHour: 15,
          ),
        ],
      ),
RoomModel(
        roomName: 'Z 06',
        schedules: [
        ],
      ),
      // Z07
      RoomModel(
        roomName: 'Z 07',

        schedules: [
          ClassSchedule(
            subject: 'Estructura de Datos',
            room: 'Z 07',
            day: 'Viernes',
            startHour: 13,
            endHour: 14,
          ),
        ],
      ),
    ],
  ),
  BuildingModel(
    name: 'Edificio H',
    totalRooms: 7,
    occupiedRooms: 3,
    freeRooms: 4,

    rooms: [

      RoomModel(
        roomName: 'H 01',

        schedules: [
          ClassSchedule(
            subject: 'Ecuaciones Diferenciales',
            room: 'H 01',
            day: 'Martes',
            startHour: 7,
            endHour: 9,
          ),

          ClassSchedule(
            subject: 'Ecuaciones Diferenciales',
            room: 'H 01',
            day: 'Jueves',
            startHour: 7,
            endHour: 9,
          ),
        ],
      ),
  RoomModel(
        roomName: 'H 02',
        schedules: [
        ],
      ),
      
      // H03
      RoomModel(
        roomName: 'H 03',

        schedules: [
          ClassSchedule(
            subject: 'Investigacion de Operaciones',
            room: 'H 03',
            day: 'Miercoles',
            startHour: 9,
            endHour: 11,
          ),

          ClassSchedule(
            subject: 'Diseño Centrado en el Usuario',
            room: 'H 03',
            day: 'Miercoles',
            startHour: 11,
            endHour: 13,
          ),
        ],
      ),

      // H04
      RoomModel(
        roomName: 'H 04',

        schedules: [
          ClassSchedule(
            subject: 'Investigacion de Operaciones',
            room: 'H 04',
            day: 'Lunes',
            startHour: 9,
            endHour: 11,
          ),
        ],
      ),
 RoomModel(
        roomName: 'H 05',
        schedules: [
        ],
      ),
      // H06
      RoomModel(
        roomName: 'H 06',

        schedules: [
          ClassSchedule(
            subject: 'Estructura de Datos',
            room: 'H 06',
            day: 'Lunes',
            startHour: 13,
            endHour: 15,
          ),
        ],
      ),
       RoomModel(
        roomName: 'H 07',
        schedules: [
        ],
      ),
    ],
  ),



  BuildingModel(
    name: 'Edificio T',
    totalRooms: 7,
    occupiedRooms: 2,
    freeRooms: 5,

    rooms: [
  RoomModel(
        roomName: 'T 01',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'T 02',
        schedules: [
        ],
      ),
      // T3
      RoomModel(
        roomName: 'T 03',

        schedules: [
          ClassSchedule(
            subject: 'Ecuaciones Diferenciales',
            room: 'T 03',
            day: 'Viernes',
            startHour: 7,
            endHour: 8,
          ),
        ],
      ),
RoomModel(
        roomName: 'T 04',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'T 05',
        schedules: [
        ],
      ),
      RoomModel(
        roomName: 'T 06',
        schedules: [
        ],
      ),
      // T7
      RoomModel(
        roomName: 'T 07',

        schedules: [
          ClassSchedule(
            subject: 'Diseño Centrado en el Usuario',
            room: 'T 07',
            day: 'Lunes',
            startHour: 11,
            endHour: 13,
          ),
        ],
      ),
    ],
  ),
];