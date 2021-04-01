
class ReceivedNotification {
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });

  /*ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });*/

  final int id;
  final String title;
  final String body;
  final String payload;
}