import 'package:dio/dio.dart';
import 'package:interview_test/data/models/recent_event_model.dart';

class RecentEventRemoteDataSource {
  final Dio _dio;

  RecentEventRemoteDataSource() : _dio = Dio() {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<List<RecentEventModel>> fetchDataApiRecentEvent() async {
    try {
      final response = await _dio
          .get('https://fg-api.lumoshive.net/pub/api/v1/event/recent');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final datas = responseData['data'] as List;
        final List<RecentEventModel> getData =
            datas.map((data) => RecentEventModel.fromJson(data)).toList();

        return getData;
      } else {
        throw Exception('Failed to fetch Data Recent Event');
      }
    } catch (error) {
      print("api: $error");
      throw Exception('Error: $error');
    }
  }
}
