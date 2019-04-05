class Main inherits IO {
  a : Int;
  b : Int;
  choice : Int;
  main() : Object {
    {
      (* Based on user choice, compute the required arithmetic operations and show on screen *)
      out_string("Press : 0 for addition, 1 for subtraction, 2 for multiplication, 3 for division.");
      choice <- in_int();
      out_string("Enter A: ");
      a <- in_int();
      out_string("Enter B: ");
      b <- in_int();
      if choice = 0 then {
        out_string("The sum of given two numbers is: ");
        out_int(a + b);
      } else
        if choice = 1 then {
          out_string("A - B is: ");
          out_int(a - b);
        } else
          if choice = 2 then {
            out_string("A * B is: ");
            out_int(a * b);
          } else {
            out_string("A / B is: ");
            out_int(a / b);
          }
          fi
        fi
      fi;
      out_string("\n");
    }
  } ;
} ;
