import 'package:flutter/material.dart';
import 'package:movie_app/screen/movie_screen.dart';
import 'package:movie_app/widget/movie_structure.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  String movie = '';
  String director = '';
  String image = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 30),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Movie Name',
                ),
                maxLines: 1,
                onChanged: (value) {
                  movie = value;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Director Name',
                ),
                onChanged: (value) {
                  director = value;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Image URL',
                ),
                onChanged: (value) {
                  image = value;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    movieList.add(
                      MovieStructure(
                        movie: movie,
                        director: director,
                        image: image,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
