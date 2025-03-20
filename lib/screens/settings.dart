import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/screens/search.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';





class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _username = 'User123';
  bool _enableOfflineAccess = false;
  bool _saveSearchHistory = false;
  int fetchSizePerTrip = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ikenna O.',type: 0),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Toggle for Notifications
          ListTile(
            title: const Text('Enable Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),

          // Toggle for offline access
          ListTile(
            title: const Text('Enable Offline Access'),
            trailing: Switch(
              value: _enableOfflineAccess,
              onChanged: (value) {
                setState(() {
                  _enableOfflineAccess = value;
                });
              },
            ),
          ),
          const Divider(),
         // Toggle for search history persistence
          ListTile(
            title: const Text('Save search history'),
            trailing: Switch(
              value: _saveSearchHistory,
              onChanged: (value) {
                setState(() {
                  _saveSearchHistory = value;
                });
              },
            ),
          ),
          const Divider(),

          // Increment/Decrement for Fetch size
          ListTile(
            title: const Text('Fetch size per trip to server'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (fetchSizePerTrip > 0) fetchSizePerTrip--;
                    });
                  },
                ),
                Text('$fetchSizePerTrip'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (fetchSizePerTrip < 100) fetchSizePerTrip++;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),

          // Text Input for Username
          ListTile(
            title: const Text('Edit Username'),
            trailing: SizedBox(
              width: 150,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                controller: TextEditingController(text: _username),
              ),
            ),
          ),
        ],
      ),
        bottomNavigationBar: CustomAppBar(title: 'Ikenna O.',type: 1)
    );
  }
}