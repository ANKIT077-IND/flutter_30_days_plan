import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days05/provider/countor_provider.dart';
import 'package:provider/provider.dart';

class Days05 extends StatefulWidget {
  const Days05({super.key});

  @override
  State<Days05> createState() => _Days05State();
}

class _Days05State extends State<Days05> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CountorProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Text(
                provider.count.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountorProvider>().increaseCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
