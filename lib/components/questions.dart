class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What is the full name of qantas?",
    "options": [
      'Queensland and Northern Territory Aerial Service',
      'Queensland and Northern Territory Airline Service',
      'Queensland and Northern Territory Airplane Service',
      'Queensland and Northern Territory Airplanes'
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Who was the first pilot to fly across the Pacific Ocean?",
    "options": [
      'Charles Lindbergh',
      'Billy Bishop',
      'Kingsford Smith',
      'Henry Cobby'
    ],
    "answer_index": 2,
  },
];

const List bridge_data = [
  {
    "id": 1,
    "question": "When was the first permanent Victoria Bridge completed?",
    "options": ['1867', '1871', '1872', '1874'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "Who designed the second Victoria Bridge?",
    "options": [
      'Alfred Barton Brady',
      'John Bradfield',
      'Ralph Freeman',
      'George Anthony Hobson'
    ],
    "answer_index": 0,
  },
];

const List vehicle_data = [
  {
    "id": 1,
    "question": "What was holden's first car?",
    "options": ['FB Holden', 'FJ Holden', 'FX Holden', 'EJ Holden'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Which car company owns Holden",
    "options": [
      'Zhejiang Geely Holding Group (ZGH)',
      'Toyota',
      'Daimler AG',
      'General Motors Corporation (GM)'
    ],
    "answer_index": 3,
  },
];
