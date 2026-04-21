class ImagesResponseModel<T> {
  final int currentPage;
  final int pageSize;
  final bool isNextPage;
  final List<T> dataResult;

  ImagesResponseModel({
    required this.currentPage,
    required this.pageSize,
    required this.isNextPage,
    required this.dataResult,
  });
}
