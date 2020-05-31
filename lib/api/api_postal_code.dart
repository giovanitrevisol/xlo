import 'package:dio/dio.dart';
import 'package:xlo/models/address.dart';
import 'package:xlo/repositories/api_eror.dart';
import 'package:xlo/repositories/api_response.dart';

Future<ApiResponse> getAddressFromApi(String postalCode) async {
  //Veja que o replace all serve apenas para remover os pontos e traco da string
  final String endpoint =
      "http://viacep.com.br/ws/${postalCode.replaceAll('.', '').replaceAll('-', '')}/json/";

  try {
    final Response response = await Dio().get<Map>(endpoint);

    if (response.data.containsKey('erro') && response.data['erro']) {
      return ApiResponse.error(
        error: ApiError(-1, 'CEP invádido'),
      );
    }
    //caso seja sucesso
    final Address adress = Address(
      place: response.data['logradouro'],
      district: response.data['bairro'],
      city: response.data['localidade'],
      postalCode: response.data['cep'],
      federativeUnit: response.data['uf'],
    );
    return ApiResponse.success(result: adress);
  } on DioError catch (e) {
    return ApiResponse.error(
      error: ApiError(-1, 'Falha ao contactar VIACEP'),
    );
  }
}
