class Fib {
  (* A function called recursively to compute the nth fibonacci *)
  fibof(num : Int) : Int {
      (* The base conditions and recursive formulae *)
      if num = 0 then 0 else
        if num = 1 then 1 else fibof(num - 1) + fibof(num - 2) fi
      fi
  };
};

class Main inherits IO {
  a : Int;
  main() : Object {
    {
      out_string("Enter number: ");
      a <- in_int();
      out_string("The nth fibonacci is: ");
      out_int((new Fib).fibof(a));
      out_string("\n");
    }
  } ;
} ;
