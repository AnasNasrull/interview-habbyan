import 'package:interview_test/data/datasource/recent_event_remote_data_source.dart';
import 'package:interview_test/data/service/data_domain_converter.dart';
import 'package:interview_test/domain/entity/recent_event.dart';
import 'package:interview_test/domain/repository/recent_event_repo.dart';

import '../models/recent_event_model.dart';

class RecentEventRepositoryImpl extends RecentEventRepository {
  final RecentEventRemoteDataSource _recentEventRemoteDataSource;

  RecentEventRepositoryImpl(this._recentEventRemoteDataSource);

  @override
  Future<List<RecentEvent>> getRecentEvent() async {
    try {
      final List<RecentEventModel> recentEventModels =
          await _recentEventRemoteDataSource.fetchDataApiRecentEvent();

      final List<RecentEvent> recentEvents = recentEventModels
          .map((model) => RecentEventConverter.fromModel(model))
          .toList();

      return recentEvents;
    } catch (error) {
      throw Exception('Error repo: $error');
    }
  }
}
