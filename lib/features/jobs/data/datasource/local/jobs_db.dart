import 'dart:math';

import 'package:revo/features/jobs/data/model/jobs_model.dart';

class MockJobsData {
  static final _random = Random();

  static final _names = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Davis',
    'Diana Moore',
    'Ethan Brown',
    'Fiona White',
    'George Clark',
    'Hannah Lewis',
    'Ian Walker',
    'Julia Hall',
  ];

  static final _addresses = [
    '123 Main Street, Manila',
    '45 Rizal Ave, Quezon City',
    '78 Ayala Blvd, Makati',
    '12 Bonifacio St, Taguig',
    '9 Ortigas Center, Pasig',
    '56 Commonwealth Ave, QC',
    '33 España Blvd, Manila',
    '90 Shaw Blvd, Mandaluyong',
    '21 Pioneer St, Pasig',
    '67 BGC, Taguig',
  ];

  static final _documentUrls = [
    'https://example.com/doc1.pdf',
    'https://example.com/doc2.pdf',
    'https://example.com/doc3.pdf',
  ];

  static final _statuses = ['pending', 'in_progress', 'completed', 'cancelled'];

  /// Generate a single mock job
  static JobModel generateJob(int index) {
    final name = _names[_random.nextInt(_names.length)];
    final address = _addresses[_random.nextInt(_addresses.length)];

    return JobModel(
      id: 'job_$index',
      name: name,
      address: address,
      dateTime: DateTime.now()
          .subtract(Duration(days: _random.nextInt(14)))
          .millisecondsSinceEpoch,
      status: _statuses[_random.nextInt(_statuses.length)],
      documentUrl: _random.nextBool()
          ? _documentUrls[_random.nextInt(_documentUrls.length)]
          : null,
    );
  }

  /// Generate a list of mock jobs
  static List<JobModel> generateJobs({int count = 50}) {
    return List.generate(count, (index) => generateJob(index));
  }
}
