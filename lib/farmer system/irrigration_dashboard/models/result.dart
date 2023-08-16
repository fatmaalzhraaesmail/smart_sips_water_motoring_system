//{"EC":1045.0,"IWQI":63.379762,"KR":0.5,"MH":39.8,"Na":33.6,
//"PI":59.2,"RSC":0.12,"SAR":1.8,"SSP":33.3,"USABLE":1.0}

class Result {
  double? EC;
  double? IWQI;
  double? KR;
 
  double? MH;
  double? Na;
  double? PI;
  double? RSC;
  double? SAR;
  double? SSP;
  double? USABLE;


  Result(
      {this.EC,
      this.IWQI,
      this.KR,
      this.MH,
      this.Na,
      this.PI,
      this.RSC,
      this.SAR,
      this.SSP,
      this.USABLE,
    });

  Result.fromJson(Map<String, dynamic> json) {
    EC = json['EC'];
    IWQI = json['IWQI'];
    KR = json['KR'];
    MH = json['MH'];
    Na = json['Na'];
    PI = json['PI'];
    RSC = json['RSC'];
    SAR = json['SAR'];
    SSP = json['SSP'];
    USABLE = json['USABLE'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['EC'] = EC;
    data['IWQI'] = IWQI;
    data['KR'] = KR;
    data['MH'] = MH;
    data['Na'] = Na;
    data['PI'] = PI;
    data['RSC'] = RSC;
    data['SAR'] = SAR;
    data['SSP'] = SSP;
    data['USABLE'] = USABLE;

    return data;
  }
}
