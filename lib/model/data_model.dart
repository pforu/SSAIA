// {
// "_id": "68e6a0f075bacbac1f18b0fd",
// "title": "[전공포기] 학생자율설계전공(COSS형) 빅데이터전공 포기 방법 안내",
// "link": "https://bigdata.sookmyung.ac.kr:443/bbs/board.php?bo_table=notice&wr_id=81&page=1",
// "date": "2024-10-07",
// "content": "학생자율설계\n전공\n(COSS형) 빅데이터\n전공\n포기\n시 절차에 대해서 안내드립니다.\n현재 학생의 학기에 따라 신청 방법이 다르니 이점 유의하여 제출하시기 바랍니다.\n1. 8학기 이상 졸업예정자의 경우\n가. 포기 기간: 상시\n나. 제출 방법\n1) 학생자율설계전공 포기\n신청서(하단 링크)를 첨부파일(양식) 확인\nhttps://www.sookmyung.ac.kr/kr/university-life/document-form.do?mode=view&articleNo=90437&article.offset=0&articleLimit=10\n2) 개인정보 수집·이용 사항 고지 내용 및 포기 시 유의사항(※) 반드시 확인\n3) 날짜 기재 및 본인 서명하여 사업단 이메일로 제출\n4) 사업단에서 지도교수님 확인 후 학생에게 안내 예정\n5) 학생이 직접 학사팀 제출\n2. 3학기~7학기 학생의 경우\n가. 포기 기간:\n전공\n선택/\n포기\n기간(6월, 12월) 신청(*학교 홈페이지 학사공지 참고)\n나. 제출 방법\n1) 포털에서 전공 포기 신청 후 해당 전체 화면 캡쳐하여 사업단 이메일로 제출\n2) 사업단에서 포기 내용 확인 후 지도교수님께 승인 요청\n3. 학생자율설계\n전공\n포기\n시 유의사항\n- 포\n기한 학생자율설계\n전공\n이 유일한 추가\n전공\n이면서 제\n1\n전공\n을\n‘\n다\n전공\n(\n일반\n)\n과정\n’\n으로 이수중인 경우\n,\n다른 복수\n/\n부\n/\n연계\n전공\n을 선택하여 이수하거나 제\n1\n전공\n을 심화과정으로 이수하여야 졸업이 가능합니다.\n-\n향후에는 학생자율설계\n전공\n을 재신청할 수 없습니다.\n- 전공 포기 신청 후 포털에서 반영 여부를 확인하시기 바랍니다.\n4. 문의:\n빅데이터혁신융합사업단\np157499@sookmyung.ac.kr"
// },

class DataModel {
  String title;
  String link;
  String date;
  String contentText;
  List<AttachmentData> contentAttachment;
  List<TableRowData> contentTable;
  List<ImageData> contentImages;
  List<Period> periods;
  String site;

  DataModel(
    this.title,
    this.link,
    this.date,
    this.contentText,
    this.contentAttachment,
    this.contentTable,
    this.contentImages,
    this.periods,
    this.site,
  );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      json['title'] ?? '제목없음',
      json['link'] ?? '',
      json['date'] ?? '날짜없음',
      json['contentText'] ?? '내용없음',
      /*
      (json['contentAttachment'] as List<dynamic>?)
              ?.map((e) => AttachmentData.fromJson(e))
              .toList() ??
          [],
      (json['contentTable'] as List<dynamic>?)
          ?.expand((table) => (table as List<dynamic>)
          .map((row) => TableRowData.fromJson(row)))
          .toList() ??
          [],
      (json['contentImages'] as List<dynamic>?)
          ?.map((e) => ImageData(url: e))
          .toList() ??
          [],
       */
      (json['contentAttachment'] as List?)
          ?.map((e) => AttachmentData.fromJson(e))
          .toList() ??
          [],
      (json['contentTable'] as List?)
          ?.map((e) => TableRowData.fromJson(Map<String, dynamic>.from(e)))
          .toList() ??
          [],
      (json['contentImages'] as List?)
          ?.map((e) => ImageData.fromJson(Map<String, dynamic>.from(e)))
          .toList() ??
          [],
      (json['periods'] as Iterable).map((e) => Period.fromJson(e)).toList(),
      json['site'] ?? '',
    );
  }

  @override
  String toString() {
    return 'JsonModel{title:$title, link:$link, date:$date, contentText:$contentText, '
        'contentAttachment:$contentAttachment, contentTable:$contentTable, contentImages:$contentImages, site:$site}';
  }
}

class AttachmentData {
  String text;
  String url;

  AttachmentData({required this.text, required this.url});

  factory AttachmentData.fromJson(Map<String, dynamic> json) => AttachmentData(
    text: json['text'] ?? '',
    url: json['url'] ?? '',
  );
}

class TableRowData {
  Map<String, dynamic> row;

  TableRowData({required this.row});

  factory TableRowData.fromJson(Map<String, dynamic> json) =>
      TableRowData(row: json);

  @override
  String toString() => 'TableRowData($row)';
}

class ImageData {
  String url;

  ImageData({required this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(url: json['url'] ?? '');
  }

  @override
  String toString() => 'ImageData(url:$url)';
}

class Period {
  String startDate;
  String endDate;
  String type;

  Period(this.startDate, this.endDate, this.type);

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      json['startDate'] ?? '',
      json['endDate'] ?? '',
      json['type'] ?? '',
    );
  }

  @override
  String toString() {
    return 'JsonModel{startDate:$startDate, endDate:$endDate, type:$type}';
  }
}
