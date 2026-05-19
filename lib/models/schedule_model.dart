class ScheduleModel {
  final String subject;
  final String teacher;
  final String classroom;
  final String day;
  final String startHour;
  final String endHour;
  final int color;

  ScheduleModel({
    required this.subject,
    required this.teacher,
    required this.classroom,
    required this.day,
    required this.startHour,
    required this.endHour,
    required this.color,
  });
}