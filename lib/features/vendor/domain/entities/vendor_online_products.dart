import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';

class VendorOnlineProducts {
  final String nextPage;
  final List<VendorProduct> products;

  VendorOnlineProducts({@required this.nextPage, @required this.products});
}
