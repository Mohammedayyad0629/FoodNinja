import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class PopularMenu extends StatelessWidget {
  const PopularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Popular Menu"),
            TextButton(onPressed: () {}, child: const Text("Viwe More"))
          ],
        ),
        // SizedBox( height: 3),
        SizedBox(
          height: 165,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 83, 232, 140),
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.asset(
                      ImageAsset.hamburger,
                      width: 150,
                    )),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Hamburger",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "Good Food",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              "12",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 83, 232, 140),
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.asset(
                      ImageAsset.hamburger,
                      width: 150,
                    )),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Hamburger",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "Good Food",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              "12",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 83, 232, 140),
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.asset(
                      ImageAsset.hamburger,
                      width: 150,
                    )),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Hamburger",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "Good Food",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              "12",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 83, 232, 140),
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.asset(
                      ImageAsset.hamburger,
                      width: 150,
                    )),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Hamburger",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "Good Food",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              "12",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
