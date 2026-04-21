import 'package:dio/dio.dart';
import 'package:integrated_todo/core/network/core_dio.dart';
import 'package:integrated_todo/features/home/data/data_model/images_datamodel.dart';
import 'package:integrated_todo/features/home/data/data_model/images_response_model.dart';

class ImagesRepository {
  Future<ImagesResponseModel<ImagesResult>> fetchImages({
    required int page,
    required int pageSize,
  }) async {
    try {
      Map<String, dynamic> queryParam = {
        "q": "mountain",
        "page_size": pageSize,
        "page": page,
      };
      final Response response = await CoreDio().getApi(
        apiUrl: "v1/images/",
        queryParam: queryParam,
      );

      final data = UserImages.fromJson(response.data);

      final bool isNextPage = data.page < data.pageCount;

      final ImagesResponseModel<ImagesResult> imagesResponseData =
          ImagesResponseModel<ImagesResult>(
            currentPage: data.page,
            pageSize: data.pageSize,
            isNextPage: isNextPage,
            dataResult: data.results,
          );

      return imagesResponseData;
    } catch (e) {
      rethrow;
    }
  }
}
