class Num {
  (* A function called recursively to compute a number's factorial *)
  fact(num : Int) : Int {
      if num = 1 then 1 else
        num * fact(num - 1)
      fi
  };
};

class Main inherits IO {
  a : Int;
  main() : Object {
    {
      out_string("Enter number: ");
      a <- in_int();
      out_string("The factorial of given number is: ");
      (* call the function *)
      out_int((new Num).fact(a));
      out_string("\n");
    }
  } ;
} ;
