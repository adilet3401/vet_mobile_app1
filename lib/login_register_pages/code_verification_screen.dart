// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vet_mobile_app/pages/menu_page.dart';

// class CodeVerificationScreen extends StatefulWidget {
//   final String verificationId;

//   const CodeVerificationScreen({super.key, required this.verificationId});

//   @override
//   State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
// }

// class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
//   final TextEditingController codeController = TextEditingController();

//   Future<void> verifyCode() async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: codeController.text.trim(),
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MenuPage()),
//       );
//       print('Phone number verified and signed in!');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             'Код туура эмес',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Кодду текшерүү')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: codeController,
//               decoration: InputDecoration(labelText: 'Кодду киргизиңиз'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(onPressed: verifyCode, child: Text('Текшерүү')),
//           ],
//         ),
//       ),
//     );
//   }
// }
