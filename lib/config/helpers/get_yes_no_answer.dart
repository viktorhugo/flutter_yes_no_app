

import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromMap(response.data);
    print(response);
    return yesNoModel.toMessageEntity();
  }

}