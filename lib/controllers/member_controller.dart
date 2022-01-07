//import 'package:http/http.dart';
import 'package:my_todo_app1/models/member_model.dart';
import 'package:my_todo_app1/services/member_services.dart';

class MemberController {
  final MemberService _memberService = MemberService();

  Future<List<Members>> getAllMembers() async {
    List<Members> member = [];
    await _memberService.getAllmembers().then((response) {
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        member = membersFromJson(response.body);
        print("api working");
      } else {
        member = [];
        print("error");
      }
    });
    return member;
  }
}
