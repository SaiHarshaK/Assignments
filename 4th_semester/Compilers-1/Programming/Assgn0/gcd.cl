class Main inherits IO {
  a : Int;
  b : Int;
  main() : Object {
    {
      out_string("Enter number A: ");
      a <- in_int();
      out_string("Enter number B: ");
      b <- in_int();
      (* loop until a = b, eulers formulae *)
      while not a = b
      loop
        if not a <= b then a <- a - b else b <- b - a fi
      pool;
      out_int(a);
      out_string("\n");
    }
  } ;
} ;
