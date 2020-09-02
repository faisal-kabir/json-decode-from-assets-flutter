class Data {
  String date;
  String tradeCode;
  String high;
  String low;
  String open;
  String close;
  String volume;

  Data(
      {this.date,
        this.tradeCode,
        this.high,
        this.low,
        this.open,
        this.close,
        this.volume});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    tradeCode = json['trade_code'];
    high = json['high'];
    low = json['low'];
    open = json['open'];
    close = json['close'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['trade_code'] = this.tradeCode;
    data['high'] = this.high;
    data['low'] = this.low;
    data['open'] = this.open;
    data['close'] = this.close;
    data['volume'] = this.volume;
    return data;
  }
}
