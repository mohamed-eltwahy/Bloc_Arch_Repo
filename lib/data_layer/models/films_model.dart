class AllMoviesModel {
  String? id;
  Base? base;
  List<Filmography>? filmography;

  AllMoviesModel({id, base, filmography});

  AllMoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    base = json['base'] != null ? Base.fromJson(json['base']) : null;
    if (json['filmography'] != null) {
      filmography = <Filmography>[];
      json['filmography'].forEach((v) {
        filmography!.add(Filmography.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (base != null) {
      data['base'] = base!.toJson();
    }
    if (filmography != null) {
      data['filmography'] = filmography!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Base {
  String? type;
  List<String>? akas;
  String? id;
  Image? image;
  String? legacyNameText;
  String? name;

  Base({type, akas, id, image, legacyNameText, name});

  Base.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    akas = json['akas'].cast<String>();
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    legacyNameText = json['legacyNameText'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@type'] = type;
    data['akas'] = akas;
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['legacyNameText'] = legacyNameText;
    data['name'] = name;
    return data;
  }
}

class Image {
  int? height;
  String? id;
  String? url;
  int? width;

  Image({height, id, url, width});

  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}

class Filmography {
  String? category;
  String? id;
  Image? image;
  String? status;
  String? title;
  String? titleType;
  // List<String>? characters;
  List<Roles>? roles;
  int? year;
  int? billing;
  String? episodeAppearances;
  int? endYear;
  int? episodeCount;
  int? startYear;
  // List<Episodes>? episodes;
  int? seriesEndYear;
  int? seriesStartYear;
  String? as;
  // List<String>? attr;
  String? job;
  // List<EpisodeJobs>? episodeJobs;
  // List<String>? freeTextAttributes;

  Filmography(
      {category,
      id,
      image,
      status,
      title,
      titleType,
      characters,
      roles,
      year,
      billing,
      episodeAppearances,
      endYear,
      episodeCount,
      startYear,
      episodes,
      seriesEndYear,
      seriesStartYear,
      as,
      attr,
      job,
      episodeJobs,
      freeTextAttributes});

  Filmography.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    status = json['status'];
    title = json['title'];
    titleType = json['titleType'];
    // characters = json['characters'].cast<String>();
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    year = json['year'];
    billing = json['billing'];
    episodeAppearances = json['episodeAppearances'];
    endYear = json['endYear'];
    episodeCount = json['episodeCount'];
    startYear = json['startYear'];
    // if (json['episodes'] != null) {
    //   episodes = <Episodes>[];
    //   json['episodes'].forEach((v) {
    //     episodes!.add(Episodes.fromJson(v));
    //   });
    // }
    seriesEndYear = json['seriesEndYear'];
    seriesStartYear = json['seriesStartYear'];
    as = json['as'];
    // attr = json['attr'].cast<String>();
    job = json['job'];
    // if (json['episodeJobs'] != null) {
    //   episodeJobs = <EpisodeJobs>[];
    //   json['episodeJobs'].forEach((v) {
    //     episodeJobs!.add(EpisodeJobs.fromJson(v));
    //   });
    // }
    // freeTextAttributes = json['freeTextAttributes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['status'] = status;
    data['title'] = title;
    data['titleType'] = titleType;
    // data['characters'] = characters;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['year'] = year;
    data['billing'] = billing;
    data['episodeAppearances'] = episodeAppearances;
    data['endYear'] = endYear;
    data['episodeCount'] = episodeCount;
    data['startYear'] = startYear;
    // if (episodes != null) {
    //   data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    // }
    data['seriesEndYear'] = seriesEndYear;
    data['seriesStartYear'] = seriesStartYear;
    data['as'] = as;
    // data['attr'] = attr;
    // data['job'] = job;
    // if (episodeJobs != null) {
    //   data['episodeJobs'] = episodeJobs!.map((v) => v.toJson()).toList();
    // }
    // data['freeTextAttributes'] = freeTextAttributes;
    return data;
  }
}

class Roles {
  String? character;
  String? characterId;
  int? episodeCount;

  Roles({character, characterId, episodeCount});

  Roles.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    characterId = json['characterId'];
    episodeCount = json['episodeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['character'] = character;
    data['characterId'] = characterId;
    data['episodeCount'] = episodeCount;
    return data;
  }
}

class Episodes {
  List<String>? attr;
  String? category;
  List<String>? characters;
  List<Roles>? roles;
  String? id;
  Image? image;
  String? status;
  String? title;
  String? titleType;
  int? year;
  int? episodeNumber;
  String? releaseDate;
  int? seasonNumber;
  int? billing;
  String? as;
  String? job;

  Episodes(
      {attr,
      category,
      characters,
      roles,
      id,
      image,
      status,
      title,
      titleType,
      year,
      episodeNumber,
      releaseDate,
      seasonNumber,
      billing,
      as,
      job});

  Episodes.fromJson(Map<String, dynamic> json) {
    attr = json['attr'].cast<dynamic>();
    category = json['category'];
    characters = json['characters'].cast<String>();
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    status = json['status'];
    title = json['title'];
    titleType = json['titleType'];
    year = json['year'];
    episodeNumber = json['episodeNumber'];
    releaseDate = json['releaseDate'];
    seasonNumber = json['seasonNumber'];
    billing = json['billing'];
    as = json['as'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attr'] = attr;
    data['category'] = category;
    data['characters'] = characters;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['status'] = status;
    data['title'] = title;
    data['titleType'] = titleType;
    data['year'] = year;
    data['episodeNumber'] = episodeNumber;
    data['releaseDate'] = releaseDate;
    data['seasonNumber'] = seasonNumber;
    data['billing'] = billing;
    data['as'] = as;
    data['job'] = job;
    return data;
  }
}

class EpisodeJobs {
  int? endYear;
  int? episodes;
  String? job;
  int? startYear;

  EpisodeJobs({endYear, episodes, job, startYear});

  EpisodeJobs.fromJson(Map<String, dynamic> json) {
    endYear = json['endYear'];
    episodes = json['episodes'];
    job = json['job'];
    startYear = json['startYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['endYear'] = endYear;
    data['episodes'] = episodes;
    data['job'] = job;
    data['startYear'] = startYear;
    return data;
  }
}
