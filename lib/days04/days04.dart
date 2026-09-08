import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//
class Days04 extends StatefulWidget {
  const Days04({super.key});

  @override
  State<Days04> createState() => _Days04State();
}

class _Days04State extends State<Days04> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 7,
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hint: Text("Enter the name"),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Name is required";
                  } else if (val.length < 3 || val.length > 20) {
                    return "Name less then 3 character and more then 20 character";
                  }
                },
              ),
              TextFormField(
                controller: email,
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hint: Text("Enter the email"),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Email is required";
                  } else if (!val.contains('@')) {
                    return "Email missing @";
                  } else if (!val.contains('.')) {
                    return "Email missing .";
                  }
                },
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hint: Text("Enter the password"),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password is required";
                  } else if (val.length < 3 || val.length > 20) {
                    return "Password less then 3 character and more then 20 character";
                  }
                },
              ),
              TextFormField(
                controller: dob,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hint: Text("Enter the Date of birth"),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Date of Birth required";
                  } else if (val.length < 3 || val.length > 20) {
                    return "Invalid date of birth";
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
