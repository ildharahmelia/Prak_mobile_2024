import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/update_book.dart';

class EditBookScreen extends StatefulWidget {
  final Book book;

  EditBookScreen({required this.book});

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String author;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.book.title;
    author = widget.book.author;
    description = widget.book.description;
  }

  Future<void> _updateBook() async {
    try {
      await updateBook(widget.book.id, title, author, description);
      Navigator.pop(context, true); // Mengembalikan nilai true untuk menyegarkan daftar buku
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui buku: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Buku', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(labelText: 'Judul', labelStyle: TextStyle(color: Colors.blueAccent)),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                initialValue: author,
                decoration: InputDecoration(labelText: 'Penulis', labelStyle: TextStyle(color: Colors.blueAccent)),
                onChanged: (value) {
                  setState(() {
                    author = value;
                  });
                },
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Deskripsi', labelStyle: TextStyle(color: Colors.blueAccent)),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _updateBook();
                  }
                },
                child: Text('Simpan Perubahan', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
