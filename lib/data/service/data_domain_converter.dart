import '../../domain/entity/recent_event.dart';
import '../models/recent_event_model.dart';

class RecentEventConverter {
  static RecentEvent fromModel(RecentEventModel recentModel) {
    return RecentEvent(
      image: recentModel.coverImage,
      title: "Basketball Junior Drums League - Basketball Competition 2022",
      subtitle: "Warriors vs Lakers (ini event name)",
      date: "November 11, 2011",
    );
  }
}
