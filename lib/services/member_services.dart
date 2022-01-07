import 'package:http/http.dart';

class MemberService {
  final String baseUrl = "https://reaper-api.herokuapp.com";

  // getting all menbers
  Future<Response> getAllmembers() async {
    return await get(Uri.parse('$baseUrl/members'));
  }

}
