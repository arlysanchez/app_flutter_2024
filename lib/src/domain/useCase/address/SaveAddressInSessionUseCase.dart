import 'package:ecommerce_v2/src/domain/models/Address.dart';
import 'package:ecommerce_v2/src/domain/repository/AddressRepository.dart';

class SaveAddressInSessionUseCase {
  AddressRepository addressRepository;

  SaveAddressInSessionUseCase(this.addressRepository);

  run(Address address) => addressRepository.saveAddressInSession(address);
}
