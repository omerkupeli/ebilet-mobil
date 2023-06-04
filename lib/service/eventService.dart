import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobil_bilet1/models/eventModel.dart';

import '../Event.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 2|QHLiGunG1pK0z8iQcTJ37QE8pGMg42xJA48kyo1o',
};

class EventApi {
  static Future<http.Response> getEvents() async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/events'),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> getEvent(String id) async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/events/$id'),
      headers: headers,
    );
    return response;
  }

  //create event
  static Future<http.Response> createEvent(Events event) async {
    final response = await http.post(
      Uri.parse('https://ebiletsatis.tk/api/events'),
      headers: headers,
      body: jsonEncode(event.toJson()),
    );
    return response;
  }

  //checkout event post send event_id and price
  static Future<http.Response> checkoutEvent(int eventId, int price) async {
    final response = await http.post(
      Uri.parse('https://ebiletsatis.tk/api/checkout'),
      headers: headers,
      body: jsonEncode({
        "event_id": eventId,
        "price": price,
      }),
    );
    print(response.body);
    return response;
  }

  //post use ticket with booking number
  static Future<http.Response> useTicket(String bookingNumber) async {
    final response = await http.post(
      Uri.parse('https://ebiletsatis.tk/api/useTicket'),
      headers: headers,
      body: jsonEncode({
        "booking_number": bookingNumber,
      }),
    );
    print(response.body);
    return response;
  }

  //get bookings
  static Future<http.Response> getBookings() async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/getBookings'),
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
