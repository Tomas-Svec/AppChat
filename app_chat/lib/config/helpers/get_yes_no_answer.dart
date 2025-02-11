import 'package:app_chat/domain/entities/message.dart';
import 'package:app_chat/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnsewr {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

   
    final yesNoModel = YesNoModelo.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
