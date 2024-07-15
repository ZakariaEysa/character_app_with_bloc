class QuotesModel{

  final String quote;

  QuotesModel({required this.quote});


 factory QuotesModel.fromJson(Map<String, dynamic> json)
  {
    return QuotesModel(quote: json['quote']);
  }




}