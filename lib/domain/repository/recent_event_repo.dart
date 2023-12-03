import 'package:interview_test/domain/entity/recent_event.dart';

abstract class RecentEventRepository {
  Future<List<RecentEvent>> getRecentEvent();
}
