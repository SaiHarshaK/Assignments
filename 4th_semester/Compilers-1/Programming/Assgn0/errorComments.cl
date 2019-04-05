(* Takes in a (*number*) and prints it -- irregular nesting of (* and *) is not allowed

class Main inherits IO {
	x : Int;
	main(): Object {
		{
      x <- in_int();
      out_int(x);
		}
	};
};
