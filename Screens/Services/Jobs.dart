import 'package:flutter/material.dart';
import 'package:brooms_n_belans/l10n/app_localizations.dart';

class JobLineupScreen extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      title: 'House Cleaning',
      rooms: 3,
      address: '123 Maple Street',
      dateTime: DateTime(2023, 12, 10, 9, 0),
    ),
    Job(
      title: 'Cooking for Dinner Party',
      people: 6,
      address: '456 Oak Avenue',
      dateTime: DateTime(2023, 12, 10, 18, 0),
    ),
    Job(
      title: 'Cleaning and Organizing',
      rooms: 5,
      address: '789 Pine Lane',
      dateTime: DateTime(2023, 12, 11, 14, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Jobs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffD90000),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return JobCard(job: jobs[index]);
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.home_outlined),
                SizedBox(width: 5),
                Text(job.rooms != null
                    ? 'Rooms: ${job.rooms}'
                    : 'People: ${job.people}'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 5),
                Text(job.address),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                SizedBox(width: 5),
                Text('${job.dateTime.toLocal()}'.split(' ')[0]),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time_outlined),
                SizedBox(width: 5),
                Text(
                    '${job.dateTime.hour}:${job.dateTime.minute.toString().padLeft(2, '0')}'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Decline job action
                  },
                  child: Text('Decline', style: TextStyle(color: Colors.red)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Accept job action
                  },
                  child: Text('Accept'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Job {
  final String title;
  final int? rooms; // Use this for maid jobs
  final int? people; // Use this for cook jobs
  final String address;
  final DateTime dateTime;

  Job({
    required this.title,
    this.rooms,
    this.people,
    required this.address,
    required this.dateTime,
  });
}
