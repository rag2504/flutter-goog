import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.teal.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Matrimony App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This app helps users find their perfect match. Users can register, browse profiles, and mark favorites. Our goal is to provide a seamless and enjoyable experience in finding your life partner.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                'Features:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
              SizedBox(height: 10),
              _buildFeatureItem(Icons.person_add, 'Register and create your profile'),
              _buildFeatureItem(Icons.search, 'Search and browse profiles'),
              _buildFeatureItem(Icons.favorite, 'Mark profiles as favorites'),
              _buildFeatureItem(Icons.message, 'Send messages to connect'),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Developed by Rag Raichura',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal.shade800),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.teal.shade800),
            ),
          ),
        ],
      ),
    );
  }
}