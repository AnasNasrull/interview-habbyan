import 'package:interview_test/domain/entity/recent_event.dart';
import 'package:interview_test/domain/repository/recent_event_repo.dart';

class RecentEventUseCase {
  final RecentEventRepository _recentEventRepository;

  RecentEventUseCase(this._recentEventRepository);

  Future<List<RecentEvent>> getRecentEvent() async {
    return await _recentEventRepository.getRecentEvent();
  }
}
