 String BASE_URL({required String categoryType}) {
  return "https://newsapi.org/v2/top-headlines?country=eg&category=${categoryType}$apiKeyEndPoint";
}

const String apiKeyEndPoint = '&apiKey=2a774b30f4754f2ebaf04223f71a9a5b';
