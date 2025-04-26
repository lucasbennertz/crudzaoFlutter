class InsertValidators {
  String? validarNome(String? nome){
    if(nome == null){
      return "O nome não pode ser nulo";
    }else if(nome.length <= 3){
      return "O nome deve ser maior que 3 letras";
    }else{
      return null;
    }
  }
  String? validarValor(String? valor){
    if(valor == ""){
      "O valor não pode ser nulo";
    }
      valor = valor!.replaceAll(",", ".");
      try{
        double.parse(valor);
        return null;
      }catch(e){
        return "O valor não é um numero valido";
    }
  }
}