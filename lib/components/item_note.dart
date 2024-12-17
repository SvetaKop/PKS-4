import 'package:flutter/material.dart';
import 'package:hello_app/pages/note_page.dart';
import 'package:hello_app/model/note.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.tea});

  final Tea tea;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CatalogPaga(tea: tea),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(tea.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16.0)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.black.withOpacity(0.5),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  tea.name,
                  style: const TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Serif" ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white12, width: 3)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatalogPage(tea: tea,)),
                    );
                  },
                  child: const Text('Подробнее', style: TextStyle(fontSize: 20, color: Colors.white70),),
                ),
                const SizedBox(height: 50),

              ],
            ),
          ),
        ]),
      ));
  }

  CatalogPaga({required Tea tea}) {}
}