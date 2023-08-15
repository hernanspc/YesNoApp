import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';
import 'package:yes_no_app/presentation/entities/message.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final dio = Dio();

  Future<Message> getAnswer() async {
    final response = await dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
