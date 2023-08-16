class Reading {
  late double Calcium;
  late double Carbonate;
  late double Chloride;
  late double EC;
  late double Magnesium;
  late double Potability;
  late double Potassium;
  late double Sodium;
  late double Sulphate;
  late double TDS;
  late double TH;
  late double WQI;
  late double pH;


  Reading(
      {required this.Calcium,
      required this.Carbonate,
      required this.Chloride,
      required this.Magnesium,
      required this.Potability,
      required this.Potassium,
      required this.Sodium,
      required this.Sulphate,
      required this.TDS,
      required this.TH,
      required this.WQI,
      required this.pH});

  factory Reading.fromJson(Map<double, dynamic> json) {
    return Reading(
        Calcium: json['Calcium'],
        Carbonate: json['Carbonate'],
        Chloride: json['Chloride'],
        Magnesium: json['Magnesium'],
        Potability: json['Potability'],
        Potassium: json['Potassium'],
        Sodium: json['Sodium'],
        Sulphate: json['Sulphate'],
        TDS: json['TDS'],
        TH: json['TH'],
        WQI: json['WQI'],
        pH: json['pH'],
        );
  }
}