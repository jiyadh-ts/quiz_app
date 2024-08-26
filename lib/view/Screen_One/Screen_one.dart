import 'package:flutter/material.dart';
import 'package:quiz_app/Dummydb.dart';
import 'package:quiz_app/view/home_screen/quiz_screen.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {
        'title': 'History',
        'image':
            'https://th.bing.com/th/id/OIP.AbR-FKMa6pEP3XNeVROorwHaD4?w=286&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        'questions': Dummydb.answers,
      },
      {
        'title': 'Science',
        'image':
            'https://th.bing.com/th/id/OIP.6UtQSo6KlGDbsV8KoTKzQwAAAA?w=184&h=239&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        'questions': Dummydb.science,
      },
      {
        'title': 'Math',
        'image':
            'https://th.bing.com/th/id/OIP.jyJUSW49vMvSIloQKRV02wHaLm?w=184&h=288&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        'questions': Dummydb.mathematics,
      },
      {
        'title': 'Geography',
        'image':
            'https://th.bing.com/th/id/OIP.Mbij4jS8TFLLSFo-GUjDHQHaLG?w=184&h=276&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        'questions': Dummydb.geography,
      },
      {
        'title': 'Literature',
        'image':
            'https://th.bing.com/th/id/OIP.OaCxVAbKxvo3m4x0CyCt6wAAAA?w=184&h=260&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        'questions': Dummydb.literature,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hi John",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Let's make your time productive",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/OIP.nvhoWpN6T15Q2oMyx7Yg2gAAAA?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors
                            .transparent, // Set to transparent to avoid any background color issues
                        child: ClipOval(
                          child: Image.network(
                            "https://th.bing.com/th/id/OIP.tV04qL3Bd_AsvFsRElZ6CwHaHX?w=181&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                            fit: BoxFit.cover,
                            width: 70, // double the radius for proper fit
                            height: 70,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ranking",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "1432",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 60,
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors
                            .transparent, // Set to transparent to avoid any background color issues
                        child: ClipOval(
                          child: Image.network(
                            "https://th.bing.com/th/id/OIP.VMHVWizwcfT0kB07CZAFwwHaH_?w=156&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                            fit: BoxFit.cover,
                            width: 70, // double the radius for proper fit
                            height: 70,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "points",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "1432",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(questions: subject['questions']),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              subject['image'],
                              height: 100,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              subject['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
