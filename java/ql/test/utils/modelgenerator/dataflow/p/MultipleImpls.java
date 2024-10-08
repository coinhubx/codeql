package p;

import java.util.concurrent.Callable;

public class MultipleImpls {

  public static interface Strategy {
    String doSomething(String value);
  }

  public static class Strat1 implements Strategy {
    // summary=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];ReturnValue;taint;df-generated
    // contentbased-summary=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];ReturnValue;value;df-generated
    public String doSomething(String value) {
      return value;
    }
  }

  // implements in different library should not count as impl
  public static class Strat3 implements Callable<String> {

    // neutral=p;MultipleImpls$Strat3;call;();summary;df-generated
    @Override
    public String call() throws Exception {
      return null;
    }
  }

  public static class Strat2 implements Strategy {
    private String foo;

    // summary=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];Argument[this];taint;df-generated
    // A field based model should not be lifted if the field pertains to the concrete
    // implementation.
    // SPURIOUS-contentbased-summary=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];Argument[this].SyntheticField[p.MultipleImpls$Strat2.foo];value;df-generated
    public String doSomething(String value) {
      this.foo = value;
      return "none";
    }

    // summary=p;MultipleImpls$Strat2;true;getValue;();;Argument[this];ReturnValue;taint;df-generated
    // A field based model should not be lifted if the field pertains to the concrete
    // implementation.
    // SPURIOUS-contentbased-summary=p;MultipleImpls$Strat2;true;getValue;();;Argument[this].SyntheticField[p.MultipleImpls$Strat2.foo];ReturnValue;value;df-generated
    public String getValue() {
      return this.foo;
    }
  }
}
