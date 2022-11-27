
import 'package:get/get.dart';

class InterestsController extends GetxController {
  List interests = [
    "Football", "Basketball", "Icehokey",
    "Motorsports", "Bandy", "Rugby", "Skiing", "Shooting"
  ];

  List<dynamic> selectedInterests = [];

  var selectedInterestsValues = ''.obs;
}