import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({super.key});

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShimmerWidget(
                      height: 60,
                      width: 60,
                      shape: BoxShape.circle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ShimmerWidget(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.15,
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 0,
                );
              },
              itemCount: 4,
            ),
          ),
          SizedBox(
            height: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                ShimmerWidget(
                  height: 30,
                  width: 140,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerWidget(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ShimmerWidget(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ShimmerWidget(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                ShimmerWidget(
                  height: 30,
                  width: 140,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerWidget(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ShimmerWidget(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ShimmerWidget(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  int height;
  double width;
  BoxShape shape;

  ShimmerWidget({
    Key? key,
    required this.height,
    required this.width,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: height.toDouble(),
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: shape,
        ),
      ),
    );
  }
}
