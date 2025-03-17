
abstract class FormStates{}


class InitialState extends FormStates{}
class LoadingState extends FormStates{}
class FormErrorState extends FormStates{
  final String errorMessage;

  FormErrorState(this.errorMessage);
}

class FormSuccessFillState extends FormStates{}