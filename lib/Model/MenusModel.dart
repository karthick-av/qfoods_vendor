class MenusModel {
  int? menuId;
  String? menuName;
  int? position;
  int? visible;
  int? status;
  String? restaurantId;

  MenusModel(
      {this.menuId,
      this.menuName,
      this.position,
      this.visible,
      this.status,
      this.restaurantId});

  MenusModel.fromJson(Map<String, dynamic> json) {
    menuId = json['menu_id'];
    menuName = json['menu_name'];
    position = json['position'];
    visible = json['visible'];
    status = json['status'];
    restaurantId = json['restaurant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id'] = this.menuId;
    data['menu_name'] = this.menuName;
    data['position'] = this.position;
    data['visible'] = this.visible;
    data['status'] = this.status;
    data['restaurant_id'] = this.restaurantId;
    return data;
  }
}
