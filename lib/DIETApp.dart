import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DIET",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.jpg"), // Replace with actual image
                      radius: 24,
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Raichura Rag Bakulbhai",
                          style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "9409257097 | 23010101217@darshan.ac.in",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBox("Branch", "CSE"),
                    _buildInfoBox("Sem", "4"),
                    _buildInfoBox("Division", "CSE-4A"),
                    _buildInfoBox("Roll No.", "145"),
                    _buildInfoBox("Batch", "3"),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Mentor Name :",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Mr. Rajkumar B Gondaliya",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.call, color: Colors.green),
                    SizedBox(width: 10),
                    Icon(Icons.email, color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return _buildGridItem(index);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("App Version: 5.63(63)", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white70, fontSize: 12)),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildGridItem(int index) {
    List<String> titles = [
      "Academic Calendar", "Timetable", "Attendance",
      "LMS", "Transport", "Exam Schedule",
      "Results", "Fees", "Feedback",
      "LMS Test Result", "Mentoring", "Punishment"
    ];
    List<IconData> icons = [
      Icons.calendar_today, Icons.schedule, Icons.checklist,
      Icons.menu_book, Icons.directions_bus, Icons.event,
      Icons.grading, Icons.account_balance_wallet, Icons.feedback,
      Icons.assignment_turned_in, Icons.group, Icons.gavel
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons[index], color: Colors.teal, size: 30),
          SizedBox(height: 8),
          Text(titles[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
