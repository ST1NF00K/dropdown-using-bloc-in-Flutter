import 'package:dropdown/repository.dart';
import 'package:dropdown/state_model.dart';
import 'package:rxdart/rxdart.dart';

class DropdownBloc {
  final _repository = Repository();
  final _selectedState$ = BehaviorSubject<StateModel>();
  final _selectedCity$ = BehaviorSubject<City>();

  Future<List<StateModel>> states;
  Observable<List<City>> cities;
  Observable<StateModel> get selectedState => _selectedState$;
  Observable<City> get selectedCity => _selectedCity$;
  void selectedStateEvent(StateModel state) => _selectedState$.add(state);
  void selectedCityEvent(City city) => _selectedCity$.add(city);

  DropdownBloc() {
    states = _repository.getStates();
    cities = _selectedState$.switchMap((d) =>
        Observable.fromFuture(_repository.getCities(d.id)).startWith(null))
        ..listen((e) => _selectedCity$.add(null));
  }

  void dispose() {
    _selectedCity$.close();
    _selectedState$.close();
  }
}
