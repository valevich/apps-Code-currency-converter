library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import '../model/currency_base_data.dart';
import '../model/currency_base_model.dart';
import '../model/currency_converter_model.dart';
import '../model/currency_rete_model_result.dart';
import '../model/cc_rates.dart';

part 'cc_serializers.g.dart';

@SerializersFor(const [
  CurrencyRateModelResult,
  Rates,
  //CurrencyConverter model
  CurrencyConverterModel,
  //currencyBase model
  CurrencyBaseModel,
  CurrencyBaseData,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
