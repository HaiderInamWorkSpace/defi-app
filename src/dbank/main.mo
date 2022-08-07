import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

  // Creating a stable variable (Orthogonal Persistence).
  stable var currentValue: Float = 300;
  
  // Reassigning a variable.
  currentValue := 300;

  // Creating a constant.
  let id = 200;

  // Output a constant
  Debug.print(debug_show(currentValue));

  // Output "Hello"
  Debug.print("Hello");

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  

  public func topUp(amount: Float) {

    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };


  // Function which takes amount as an input, and data type for amount is Float
  public func withdraw(amount: Float) {

    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue)); 
    } else {
      Debug.print("Not sufficient Funds!");
    }
  };

  // Function which returns a value with Float data type.
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNanoSeconds = currentTime - startTime;
    let timeElapsedSeconds = timeElapsedNanoSeconds / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedSeconds));
    startTime := currentTime;
  }

}