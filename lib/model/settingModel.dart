class SettingGroupModel {
  final String title;
  final String asset;
  final List<SettingModel> settings;
  final List<String> subTexts;

  const SettingGroupModel({
    this.title,
    this.asset,
    this.settings,
    this.subTexts,
  });
}

class SettingModel {
  final String name;
  final String routeName;
  bool agree;

  SettingModel({
    this.name,
    this.routeName,
    this.agree,
  });
}
