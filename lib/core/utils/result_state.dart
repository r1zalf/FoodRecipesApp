
enum ResultState { init, loading, hasData, noData, error }

extension ResultStateValidator on ResultState {
  bool get isInit => this == ResultState.init;
  bool get isLoading => this == ResultState.loading;
  bool get isHasData => this == ResultState.hasData;
  bool get isError => this == ResultState.error;
}
