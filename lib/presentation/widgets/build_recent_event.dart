import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/recent_event.dart';
import '../provider/home_provider.dart';

class BuildRecentEvent extends StatelessWidget {
  const BuildRecentEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return FutureBuilder(
      future: homeProvider.fetchingDatafromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data available');
        } else {
          final List<RecentEvent> events = snapshot.data as List<RecentEvent>;
          return SizedBox(
            width: double.infinity,
            height: 420,
            child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: events[index].image.isNotEmpty
                            ? Image.network(
                                events[index].image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 192,
                              )
                            : const Center(
                                child: Text("Failed Load Image"),
                              ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        events[index].title,
                        style: const TextStyle(
                            fontSize: 14.6, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        events[index].subtitle,
                        style: const TextStyle(
                            fontSize: 14.6, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        events[index].date,
                        style: const TextStyle(
                            fontSize: 14.6, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
          );
        }
      },
    );
  }
}
