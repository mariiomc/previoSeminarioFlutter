import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  TitleSection({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'holaaaaaa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // #enddocregion Icon
        ],
      ),
    );
  }
}