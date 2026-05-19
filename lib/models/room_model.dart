import 'class_schedule_model.dart';

class RoomModel {

  final String roomName;

  final List<ClassSchedule> schedules;

  bool manuallyOccupied;

  RoomModel({
    required this.roomName,
    required this.schedules,
    this.manuallyOccupied = false,
  });
}