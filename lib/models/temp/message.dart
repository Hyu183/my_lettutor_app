//Temp Data Class
class Message {
  final String id = '';
  final String imageUrl = '';
  final bool isActive;
  final String name;
  final String latestMessage;
  final DateTime date;
  Message({
    required this.isActive,
    required this.name,
    required this.latestMessage,
    required this.date,
  });
}

List<Message> messages = [
  Message(
    isActive: true,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
  Message(
    isActive: true,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
  Message(
    isActive: false,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
  Message(
    isActive: false,
    name: 'April Corpuz',
    latestMessage: 'Lorem ipsum dolo',
    date: DateTime.now(),
  ),
  Message(
    isActive: true,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
  Message(
    isActive: true,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
  Message(
    isActive: false,
    name: 'April Corpuz',
    latestMessage:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
    date: DateTime.now(),
  ),
];
