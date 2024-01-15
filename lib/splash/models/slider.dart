
class SliderModel {
  String? image;
  String? title;
  String? description;

// Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image ?? '';
  }

  String getTitle() {
    return title ?? '';
  }

  String getDescription() {
    return description ?? '';
  }
}
