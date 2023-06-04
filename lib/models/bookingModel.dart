import 'dart:convert';

class Bookings {
  int id;
  String bookingNumber;
  int eventId;
  int userId;
  dynamic seats;
  dynamic seatCount;
  int price;
  int isPaid;
  int isConfirmed;
  dynamic paymentMethod;
  dynamic paymentId;
  dynamic paymentStatus;
  String createdAt;
  String updatedAt;

  Bookings({
    required this.id,
    required this.bookingNumber,
    required this.eventId,
    required this.userId,
    required this.seats,
    required this.seatCount,
    required this.price,
    required this.isPaid,
    required this.isConfirmed,
    required this.paymentMethod,
    required this.paymentId,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        id: json["id"],
        bookingNumber: json["booking_number"],
        eventId: json["event_id"],
        userId: json["user_id"],
        seats: json["seats"],
        seatCount: json["seatCount"],
        price: json["price"],
        isPaid: json["isPaid"],
        isConfirmed: json["isConfirmed"],
        paymentMethod: json["paymentMethod"],
        paymentId: json["paymentId"],
        paymentStatus: json["paymentStatus"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_number": bookingNumber,
        "event_id": eventId,
        "user_id": userId,
        "seats": seats,
        "seatCount": seatCount,
        "price": price,
        "isPaid": isPaid,
        "isConfirmed": isConfirmed,
        "paymentMethod": paymentMethod,
        "paymentId": paymentId,
        "paymentStatus": paymentStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
