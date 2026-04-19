import "package:image_picker/image_picker.dart";

abstract class ImagePickerDataSource {
  Future<XFile?> getGalleryImage();
  Future<XFile?> getCameraImage();
}

class ImagePickerDataSourceImpl implements ImagePickerDataSource {
  @override
  Future<XFile?> getGalleryImage() async {
    XFile? image;
    ImagePicker imgPicker = ImagePicker();
    image = await imgPicker.pickImage(source: ImageSource.gallery);
    print("returneddd $image");
    return image;
  }

  @override
  Future<XFile?> getCameraImage() async {
    XFile? image;
    ImagePicker imgPicker = ImagePicker();
    image = await imgPicker.pickImage(source: ImageSource.camera);
    print("returneddd $image");
    return image;
  }
}
