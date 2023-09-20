//wwe add events and emmit states in the form of response

//multi level inheritance
abstract class InternetEvent {}


class InternetLostEvent extends InternetEvent{


}

class InternetGainedEvent extends InternetEvent{

}