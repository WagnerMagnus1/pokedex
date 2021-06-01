// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsPageStore on _DetailsPageStoreBase, Store {
  final _$currentPokemonAtom =
      Atom(name: '_DetailsPageStoreBase.currentPokemon');

  @override
  PokemonModel get currentPokemon {
    _$currentPokemonAtom.reportRead();
    return super.currentPokemon;
  }

  @override
  set currentPokemon(PokemonModel value) {
    _$currentPokemonAtom.reportWrite(value, super.currentPokemon, () {
      super.currentPokemon = value;
    });
  }

  final _$_DetailsPageStoreBaseActionController =
      ActionController(name: '_DetailsPageStoreBase');

  @override
  void changeCurrentPokemon(PokemonModel pokemonModel) {
    final _$actionInfo = _$_DetailsPageStoreBaseActionController.startAction(
        name: '_DetailsPageStoreBase.changeCurrentPokemon');
    try {
      return super.changeCurrentPokemon(pokemonModel);
    } finally {
      _$_DetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPokemon: ${currentPokemon}
    ''';
  }
}
