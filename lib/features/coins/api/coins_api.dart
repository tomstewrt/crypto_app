import '../../../core/network/dio_client.dart';
import '../../../core/network/endpoints.dart';

class CoinsApi {
  final DioClient _dioClient;

  CoinsApi(this._dioClient);

  Future<Map<String, dynamic>> fetchTopCoinsApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.topCoins);
      return res.data['coins'];
    } catch (e) {
      rethrow;
    }
  }
}
