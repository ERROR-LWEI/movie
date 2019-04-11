abstract class DynamicData extends StatisticsData {
  /// 内容信息
  String title;
  /// 统计相关数据
  Map<StatisticsData, String> statiss;
  String getTitle() {
    return title;
  }
  void setTitle(String title) {
    this.title;
  }
}

/// 统计相关数据
abstract class StatisticsData {
  String star; // 点赞数
  String discus; // 评论数
  String reprint; // 转载数
  String getStar() {
    return star;
  }
  void setStar(String star) {
    this.star = star;
  }
  String getDiscus() {
    return discus;
  }
  void setDiscus(String discus) {
    this.discus = discus;
  }
  String getReprint() {
    return reprint;
  }
  void setReprint(String reprint) {
    this.reprint = reprint;
  }
}