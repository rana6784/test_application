import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('user');

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  late String docId;

  Future<void> updateUser() async {
    final data = {'name': _name.text.trim(), 'phone': _phone.text.trim()};
    await userCollection
        .doc(docId)
        .update(data)
        .then((value) => Navigator.pop(context));
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Update User',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTextField(label: 'Name', controller: _name),
                          Divider(),
                          _buildTextField(
                            label: 'Phone',
                            controller: _phone,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _dialogButton(
                          label: 'Cancel',
                          color: Colors.grey,
                          onPressed: () => Navigator.pop(context),
                        ),
                        _dialogButton(
                          label: 'Update',
                          color: Colors.lightBlue,
                          onPressed: () async {
                            if (_name.text.trim().isNotEmpty &&
                                _phone.text.trim().isNotEmpty) {
                              await updateUser();
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            '$label:',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your $label',
            ),
          ),
        ),
      ],
    );
  }

  Widget _dialogButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    _name.text = args['name'];
    _phone.text = args['phone'];
    docId = args['id']; // Use this ID for updating

    return Scaffold(
      appBar: AppBar(
        title: Text("User Update"),
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUpdateDialog(context),
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.edit),
      ),
    );
  }
}
