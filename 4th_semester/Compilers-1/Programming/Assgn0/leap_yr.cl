class Num {
  remainder(a: Int, b: Int) : Int {
    a - ((a / b) * b)
  };
};

class Main inherits IO {
  year : Int;
  main() : Object {
    {
      (* Usage of if else for finding if a year is leap year or not. *)
      out_string("Enter Year: ");
      year <- in_int();
      if (new Num).remainder(year, 4) = 0 then {
        if (new Num).remainder(year, 100) = 0 then {
          if (new Num).remainder(year, 400) = 0 then {
            out_string("The given year is a leap year.\n");
            } else out_string("The given year is not a leap year.\n") fi;
        } else out_string("The given year is a leap year.\n") fi;
      } else out_string("The given year is not a leap year.\n") fi;
    }
  } ;
} ;
