// class MockJobsData {
//   static final _random = Random();

//   static final _names = [
//     'Alice Johnson',
//     'Bob Smith',
//     'Charlie Davis',
//     'Diana Moore',
//     'Ethan Brown',
//     'Fiona White',
//     'George Clark',
//     'Hannah Lewis',
//     'Ian Walker',
//     'Julia Hall',
//   ];
//   static final _businessAddress = [
//     'Service inquiries',
//     'Follow up',
//     'Spam calls',
//     'Emergency lockouts',
//     'After-hours calls',
//   ];
//   static final _avatars = [
//     'https://i.pravatar.cc/150?img=1',
//     'https://i.pravatar.cc/150?img=2',
//     'https://i.pravatar.cc/150?img=3',
//     'https://i.pravatar.cc/150?img=4',
//     'https://i.pravatar.cc/150?img=5',
//     'https://i.pravatar.cc/150?img=6',
//     'https://i.pravatar.cc/150?img=7',
//     'https://i.pravatar.cc/150?img=8',
//     'https://i.pravatar.cc/150?img=9',
//     'https://i.pravatar.cc/150?img=10',
//   ];

//   static String _generatePhoneNumber() {
//     final area = 555; // fixed for realism
//     final prefix = 100 + _random.nextInt(900); // 100–999
//     final line = 1000 + _random.nextInt(9000); // 1000–9999

//     return '+1 ($area) $prefix-$line';
//   }

//   static final _callTypes = CallType.values;

//   /// Generate a single random call
//   static CallModel generateCall(int index) {
//     final name = _names[_random.nextInt(_names.length)];
//     final avatar = _avatars[_random.nextInt(_avatars.length)];
//     final type = _callTypes[_random.nextInt(_callTypes.length)];
//     final number = _generatePhoneNumber();

//     final description = _descriptions[_random.nextInt(_descriptions.length)];
//     // Generate a call time within the last 30 days
//     final now = DateTime.now();
//     final callTime = now
//         .subtract(
//           Duration(
//             days: _random.nextInt(30),
//             hours: _random.nextInt(24),
//             minutes: _random.nextInt(60),
//           ),
//         )
//         .millisecondsSinceEpoch;

//     // Duration between 30 sec and 1 hour
//     final duration = type != CallType.missed
//         ? _random.nextInt(3600 - 30) + 30
//         : 0;

//     return JobModel(
//       id: 'call_$index',
//       callerName: name,
//       callerNumber: number,
//       callerAvatarUrl: avatar,
//       callType: type,
//       callTime: callTime,
//       description: description,
//       callTimeOut: callTime + duration * 1000,
//       callDuration: duration,
//     );
//   }

//   /// Generate a list of mock calls
//   static List<CallModel> generateCalls({int count = 50}) {
//     return List.generate(count, (index) => generateCall(index));
//   }
// }
