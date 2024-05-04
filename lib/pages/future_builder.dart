import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FutureBuilderApp extends StatefulWidget {
  const FutureBuilderApp({Key? key}) : super(key: key);

  @override
  State<FutureBuilderApp> createState() => _FutureBuilderAppState();
}

class _FutureBuilderAppState extends State<FutureBuilderApp> {
  Future<Map<String, dynamic>>? _fetchDataFuture;
  Logger logger = Logger();
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users/2'));
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse['data'] as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      logger.i('An error occurred: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _fetchDataFuture == null
                ? const Text('No data')
                : FutureBuilder<Map<String, dynamic>>(
                    future: _fetchDataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Column(
                          children: <Widget>[
                            Text('First Name: ${snapshot.data!['first_name']}'),
                            Text('Last Name: ${snapshot.data!['last_name']}'),
                            Text('Email: ${snapshot.data!['email']}'),
                            Image.network(snapshot.data!['avatar']),
                          ],
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _fetchDataFuture = fetchData();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
