import 'package:eventos/features/create_event/presentation/view_models/cubit/my_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Events Screen",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: BlocBuilder<MyEventCubit, MyEventState>(
          builder: (context, state) {
            if (state is MyEventLoaded) {
              if (state.myEventsModel.data == null ||
                  state.myEventsModel.data!.isEmpty) {
                return const Center(
                  child: Text('No events available.'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.myEventsModel.data!.length,
                itemBuilder: (context, index) {
                  final event = state.myEventsModel.data![index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title ?? 'No Title',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            event.description ?? 'No Description',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: Colors.black54,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.people,
                                  size: 20.0, color: Colors.blue),
                              const SizedBox(width: 4.0),
                              Text(
                                '${event.peopleNumber ?? 0} People',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.black87,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 20.0, color: Colors.green),
                              const SizedBox(width: 4.0),
                              Text(
                                event.date ?? 'No Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.black87,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(Icons.label,
                                  size: 20.0, color: Colors.orange),
                              const SizedBox(width: 4.0),
                              Text(
                                event.type ?? 'No Type',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.black87,
                                    ),
                              ),
                            ],
                          ),
                          const Divider(height: 20.0),
                          Text(
                            'Timeline:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          if (event.timelines != null &&
                              event.timelines!.isNotEmpty)
                            ...event.timelines!.map<Widget>((timelineItem) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.access_time,
                                        size: 20.0, color: Colors.purple),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${timelineItem.startTime ?? ''} - ${timelineItem.endTime ?? ''}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            timelineItem.description ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.black54,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
