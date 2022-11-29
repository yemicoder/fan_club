
import 'package:fan_club/models/interest_model.dart';
import 'package:get/get.dart';

// This controller handles everything that has to do with interests

class InterestsController extends GetxController {

  // A list of all available interests

  List<Interests> interest = [

    Interests(sport: "Football"),
    Interests(sport: "Basketball"),
    Interests(sport: "Ice hockey"),
    Interests(sport: "Motorsports"),
    Interests(sport: "Bandy"),
    Interests(sport: "Rugby"),
    Interests(sport: "Skiing"),
    Interests(sport: "Shooting"),
    Interests(sport: "Tennis"),
    Interests(sport: "Boxing"),
    Interests(sport: "Judo"),
    Interests(sport: "Cricket"),
    Interests(sport: "Roller skating"),
    Interests(sport: "Darts"),
    Interests(sport: "Baseball"),

  ];

  // Stores a list interests selected by user
  List<dynamic> selectedInterests = [];

  var selectedInterestsValues = ''.obs;

}