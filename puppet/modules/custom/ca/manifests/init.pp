
class ca (
  $name,
  $source
) {

  ca::trust::add { $name:
    source => $source,
  }

}