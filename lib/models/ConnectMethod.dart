class ConnectMethod {
  String _methodName;
  String _urlLink;
  String _graphicLink;

  ConnectMethod(this._methodName,this._urlLink, this._graphicLink);

  String get graphicLink => _graphicLink;

  void setGraphicLink(String value) {
    _graphicLink = value;
  }

  String get urlLink => _urlLink;

  void setUrlLink(String value) {
    _urlLink = value;
  }

  String get methodName => _methodName;

  void setMethodName(String value) {
    _methodName = value;
  }
}
