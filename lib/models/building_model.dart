import 'room_model.dart';

class BuildingModel {

  final String name;
  final int totalRooms;
  final int occupiedRooms;
  final int freeRooms;
  final List<RoomModel> rooms;

  BuildingModel({
    required this.name,
    required this.totalRooms,
    required this.occupiedRooms,
    required this.freeRooms,
    required this.rooms,
  });
}