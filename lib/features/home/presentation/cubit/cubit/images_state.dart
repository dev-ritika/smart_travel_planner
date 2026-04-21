part of 'images_cubit.dart';

final class ImagesState extends Equatable {
  final bool isNextPage;
  final int currentPage;
  final List<ImagesResult> imagesList;
  final bool isInitialLoading;
  final bool isPaginationLoading;

  const ImagesState({
    required this.imagesList,
    required this.isNextPage,
    required this.currentPage,
    required this.isInitialLoading,
    required this.isPaginationLoading,
  });

  @override
  List<Object> get props => [
    imagesList,
    isNextPage,
    currentPage,
    isInitialLoading,
    isPaginationLoading,
  ];

  factory ImagesState.initial() {
    return ImagesState(
      currentPage: 1,
      imagesList: [],
      isInitialLoading: false,
      isPaginationLoading: false,
      isNextPage: true,
    );
  }

  ImagesState copyWith({
    bool? isNextPage,
    int? currentPage,
    List<ImagesResult>? imagesList,
    bool? isInitialLoading,
    bool? isPaginationLoading,
  }) {
    return ImagesState(
      currentPage: currentPage ?? this.currentPage,
      imagesList: imagesList ?? this.imagesList,
      isInitialLoading: isInitialLoading ?? this.isInitialLoading,
      isNextPage: isNextPage ?? this.isNextPage,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
    );
  }
}
