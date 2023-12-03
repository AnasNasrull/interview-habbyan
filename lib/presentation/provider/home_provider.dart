import 'package:flutter/material.dart';
import 'package:interview_test/domain/entity/recent_event.dart';
import 'package:interview_test/domain/use%20case/recent_event_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final RecentEventUseCase _recentEventUseCase;

  HomeProvider(this._recentEventUseCase);

  List<RecentEvent>? _recentEvent = [];
  List<RecentEvent>? get recentEvent => _recentEvent;

  Future<List<RecentEvent>> fetchingDatafromApi() async {
    try {
      final recentEvent = await _recentEventUseCase.getRecentEvent();

      _recentEvent = recentEvent;
      notifyListeners();

      return recentEvent;
    } catch (error) {
      throw Exception(error);
    }
  }
}
