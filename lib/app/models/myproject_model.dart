class MyProjectModel {
  final String name;
  final String? appStoreURL;
  final String? playStoreURL;
  final String? githubURL;
  final String image;
  final String? hoverX1Img;
  final String? hoverX2Img;
  final String? hoverX3Img;
  final String? videoURL;
  final String topic;
  final int category;

  const MyProjectModel.withNetworkAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    this.hoverX1Img,
    this.hoverX2Img,
    this.hoverX3Img,
    this.videoURL,
    required this.topic,
    required this.category,
  }) : _isNetworkImage = true;

  const MyProjectModel.withLocalAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    this.hoverX1Img,
    this.hoverX2Img,
    this.hoverX3Img,
    this.videoURL,
    required this.topic,
    required this.category,
  }) : _isNetworkImage = false;

  final bool _isNetworkImage;
  bool get isNetworkImage => _isNetworkImage;
}

List<MyProjectModel> dummyDataFill() {
  // List of apps that will be listed on landing page.
  const apps = [
    MyProjectModel.withNetworkAsset(
      name: 'GOLGOL',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/GolGolMobilAppDesign/main/golgol_login.png',
      hoverX1Img:
          'https://raw.githubusercontent.com/harunayyildiz/GolGolMobilAppDesign/main/golgol_login.png',
      hoverX2Img:
          'https://raw.githubusercontent.com/harunayyildiz/GolGolMobilAppDesign/main/golgol_home.png',
      hoverX3Img:
          'https://raw.githubusercontent.com/harunayyildiz/GolGolMobilAppDesign/main/golgol_game.png',
      playStoreURL: 'https://play.google.com/store/apps/details?id=com.golgol',
      githubURL:
          'https://github.com/harunayyildiz/GolGolMobilAppDesign/tree/main',
      topic: 'Eğlence',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'MePlanner',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/meplanner/master/assets/me_planner_home.png',
      playStoreURL:
          'https://play.google.com/store/apps/details?id=com.meplanner&gl=TR',
      githubURL: 'https://github.com/harunayyildiz/meplanner',
      topic: 'Planlama',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'Naber',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/naber_home.png',
      playStoreURL:
          'https://play.google.com/store/apps/details?id=com.naber.nevisoftTR',
      githubURL: 'https://github.com/harunayyildiz/naber',
      topic: 'Eğlence & Okuma',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'Hemşire Eğitim',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/hemsire_egitim.png',
      playStoreURL:
          'https://play.google.com/store/apps/details?id=com.nevisoft.hemsire_local',
      appStoreURL:
          'https://apps.apple.com/tc/app/hem%C5%9Fire-e%C4%9Fitim-paketi/id1612252918',
      topic: 'Eğitim & Sağlık',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'SunCloud',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/sun_cloud_register.png',
      hoverX1Img:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/sun_cloud_home.png',
      hoverX2Img:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/sun_cloud_game1.png',
      hoverX3Img:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/sun_cloud_education.png',
      playStoreURL:
          'https://play.google.com/store/apps/details?id=com.sun.cloud',
      githubURL: 'https://github.com/harunayyildiz/sun_cloud_deploy',
      topic: 'Eğitim & Sağlık',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'SAY',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/say_home.png',
      playStoreURL:
          'https://play.google.com/store/apps/details?id=com.say.nevisoft',
      appStoreURL:
          'https://apps.apple.com/tc/app/say-stres-ve-anksiyete-y%C3%B6netim/id1536580851',
      topic: 'Eğitim & Sağlık',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'Theme Changed',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/theme_change/master/lib/theme_change.png',
      githubURL: 'https://github.com/harunayyildiz/theme_change',
      videoURL:
          'https://raw.githubusercontent.com/harunayyildiz/theme_change/master/lib/Theme_change_record.gif',
      topic: 'Development',
      category: 0,
    ),
    MyProjectModel.withNetworkAsset(
      name: 'Reporter Bitexen',
      image:
          'https://raw.githubusercontent.com/harunayyildiz/harunayyildiz/main/reporter_bitexen.png',
      videoURL:
          'https://drive.google.com/file/d/1cOfZZeBPNUU_jIsxwrdZxOHZi9y_H94s/view?usp=sharing',
      githubURL: 'https://github.com/harunayyildiz/reporter_bitexen',
      topic: 'Finans',
      category: 0,
    ),
    MyProjectModel.withLocalAsset(
      name: 'Portfolio',
      image: 'assets/images/portfolio_web_site.png',
      githubURL: 'https://github.com/harunayyildiz/flutter_portfolio',
      topic: 'Development',
      category: 1,
    ),
  ];
  return apps;
}
