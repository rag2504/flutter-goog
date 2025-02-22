import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../database/database_helper.dart';
import '../models/user_model.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _dbHelper = DatabaseHelper();
  List<User> _favorites = [];

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    List<User> users = await _dbHelper.getFavoriteUsers();
    setState(() {
      _favorites = users;
    });
  }

  void _removeFromFavorites(User user) async {
    await _dbHelper.toggleFavorite(user.id!);
    setState(() {
      user.isFavorite = 0;
      _favorites.remove(user); // Remove only the unfavored user
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User marked as unfavorite!'),
        duration: Duration(seconds: 2), // Reduced duration
      ),
    );
  }

  void _showUserDetails(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(user.name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (user.profileImagePath != null)
                  Image.file(File(user.profileImagePath!)),
                Text('Email: ${user.email}'),
                Text('Mobile: ${user.mobile}'),
                Text('Date of Birth: ${DateFormat('dd/MM/yyyy').format(DateTime.now().subtract(Duration(days: 365 * user.age)))}'),
                Text('City: ${user.city}'),
                Text('Gender: ${user.gender}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _favorites.isEmpty
            ? Center(
          child: Text(
            'No favorite users yet',
            style: TextStyle(color: Colors.white),
          ),
        )
            : ListView.builder(
          itemCount: _favorites.length,
          itemBuilder: (context, index) {
            User user = _favorites[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  backgroundImage: user.profileImagePath != null
                      ? FileImage(File(user.profileImagePath!))
                      : null,
                  child: user.profileImagePath == null
                      ? Text(user.name[0])
                      : null,
                ),
                title: Text(user.name),
                subtitle: Text('${user.age} years old, ${user.city}'),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => _removeFromFavorites(user),
                ),
                onTap: () => _showUserDetails(user), // Show user details on tap
              ),
            );
          },
        ),
      ),
    );
  }
}