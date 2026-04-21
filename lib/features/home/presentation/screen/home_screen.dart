import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';
import 'package:integrated_todo/features/home/presentation/cubit/cubit/images_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController gridScroller = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        await context.read<ImagesCubit>().getAndSetImages();
      }
    });

    gridScroller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20),

              Expanded(
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    final cubit = context.read<ImagesCubit>();
                    final state = cubit.state;

                    if (gridScroller.position.pixels >=
                            gridScroller.position.maxScrollExtent - 200 &&
                        !state.isPaginationLoading &&
                        !state.isInitialLoading &&
                        !cubit.isFetching &&
                        state.isNextPage) {
                      cubit.getAndSetImages(isPaginating: true);
                    }
                    return false;
                  },
                  child: GridView.builder(
                    //  physics: ClampingScrollPhysics(),
                    controller: gridScroller,
                    padding: EdgeInsets.only(top: 20, bottom: 160),
                    itemCount: state.imagesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridTile(
                          footer: Container(
                            color: ColorConsts.secondaryColor.withAlpha(150),
                            child: Text(
                              state.imagesList[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              //  style: TextStyle(color: ColorConsts.whiteColor),
                            ),
                          ),
                          child: Image.network(
                            state.imagesList[index].url,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.error, size: 100),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                // Image has finished loading
                                return child;
                              }

                              return SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            // frameBuilder:
                            //     (context, child, frame, wasSynchronouslyLoaded) =>
                            //         CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Visibility(
                visible: state.isPaginationLoading,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(strokeWidth: 10),
                ),
              ),

              SizedBox(height: state.isPaginationLoading ? 120 : 0),
            ],
          );
        },
      ),
    );
  }
}
