import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder_practice/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hRead = ref.read(homeProvider);
    final hWatch = ref.watch(homeProvider);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/images.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 228,
          left: 110,
          right: 118,
          child: Visibility(
              visible: true,
              child: Container(
                decoration: BoxDecoration(
                    color: hRead.colorData[hWatch.indexSelected],
                    borderRadius: BorderRadius.circular(20.0)),
                height: 275,
              )),
        ),
        Positioned(
            top: 228,
            left: 160,
            right: 70,
            bottom: 245,
            child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  hWatch.text,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ))),
        Positioned(
          top: 173,
          left: 49,
          right: 118,
          child: Image.asset('assets/images/images.png'),
        ),
        Positioned(
          top: 550,
          left: 100,
          child: SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hRead.colorData.length,
              itemBuilder: (context, index) {
                var item = hRead.colorData[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      hRead.selectIndex(index);
                    },
                    child: CircleAvatar(
                      backgroundColor: item,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 620,
          left: 20,
          right: 20,
          child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                onChanged: (value) {
                  hRead.changeValue(value);
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              )),
        ),
      ],
    ));
  }
}
