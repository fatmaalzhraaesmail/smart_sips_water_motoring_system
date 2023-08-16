class Result {
  double? Calcium;
  double? Carbonate;
  double? Chloride;
  double? EC;
  double? Magnesium;
  double? Potability;
  double? Potassium;
  double? Sodium;
  double? Sulphate;
  double? TDS;
  double? TH;
  double? WQI;
  double? pH;

  Result(
      {this.Calcium,
      this.Carbonate,
      this.Chloride,
      this.EC,
      this.Magnesium,
      this.Potability,
      this.Potassium,
      this.Sodium,
      this.Sulphate,
      this.TDS,
      this.TH,
      this.WQI,
      this.pH});

  Result.fromJson(Map<String, dynamic> json) {
    Calcium = json['Calcium'];
    Carbonate = json['Carbonate'];
    Chloride = json['Chloride'];
    EC = json['EC'];
    Magnesium = json['Magnesium'];
    Potability = json['Potability'];
    Potassium = json['Potassium'];
    Sodium = json['Sodium'];
    Sulphate = json['Sulphate'];
    TDS = json['TDS'];
    TH = json['TH'];
    WQI = json['WQI'];
    pH = json['pH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Calcium'] = Calcium;
    data['Carbonate'] = Carbonate;
    data['Chloride'] = Chloride;
    data['EC'] = EC;
    data['Magnesium'] = Magnesium;
    data['Potassium'] = Potassium;
    data['Sodium'] = Sodium;
    data['Sulphate'] = Sulphate;
    data['TDS'] = TDS;
    data['TH'] = TH;
    data['WQI'] = WQI;
    data['pH'] = pH;

    return data;
  }
}
