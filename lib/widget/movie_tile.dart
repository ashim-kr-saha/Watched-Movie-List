import 'package:flutter/material.dart';
import 'package:movie_app/screen/movie_screen.dart';
import 'package:movie_app/widget/movie_structure.dart';

class MovieTile extends StatefulWidget {
  final String movieName;
  final String director;
  final String posterImage;
  final int removalIndex;
  List<MovieStructure> movieList;
  final Null Function() onPressed;

  MovieTile({
    Key? key,
    required this.movieName,
    required this.director,
    required this.posterImage,
    required this.removalIndex,
    required this.movieList,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool imageFound = false;

  @override
  void initState() {
    super.initState();
    try {
      Image.asset(
        widget.posterImage,
        fit: BoxFit.contain,
        alignment: Alignment.center,
      );
    } catch (_) {
      imageFound = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          Expanded(
            child: imageFound
                ? Image.asset(
                    widget.posterImage,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  )
                : SizedBox(
                    height: 200,
                    width: 200,
                    child: Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar,
                        size: 100,
                        color: Colors.red[300]),
                  ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.movieName,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  widget.director,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black26,
                  ),
                ),
                const SizedBox(height: 40),
                IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.redAccent[500],
                    size: 40,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
