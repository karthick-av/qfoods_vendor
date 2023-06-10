class VendorDashboardModel {
  int? totalOrders;
  int? todayOrders;
  int? todayProfit;
  int? totalProfit;

  VendorDashboardModel(
      {this.totalOrders, this.todayOrders, this.todayProfit, this.totalProfit});

  VendorDashboardModel.fromJson(Map<String, dynamic> json) {
    totalOrders = json['total_orders'];
    todayOrders = json['today_orders'];
    todayProfit = json['today_profit'];
    totalProfit = json['total_profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_orders'] = this.totalOrders;
    data['today_orders'] = this.todayOrders;
    data['today_profit'] = this.todayProfit;
    data['total_profit'] = this.totalProfit;
    return data;
  }
}
