class Sermon{
  String _title;
  String _date;
  String _speaker;
  String _summary;
  String _graphicLink;

  Sermon(this._title, this._date, this._speaker, this._summary,
      this._graphicLink);

  String get graphicLink => _graphicLink;

  set graphicLink(String value) {
    _graphicLink = value;
  }

  String get summary => _summary;

  set summary(String value) {
    _summary = value;
  }

  String get speaker => _speaker;

  set speaker(String value) {
    _speaker = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }


}