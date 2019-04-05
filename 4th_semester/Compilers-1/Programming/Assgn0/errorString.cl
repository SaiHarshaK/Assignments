(* A non-escaped newline character may not appear in a string *)

class Main inherits IO {
	str_c : String;
	str_nc : String;

	main() : Object {
		{
			str_c <- "I am Awesome.\n";
			str_nc <- "I am not
			 						Cool.";
			out_string(str_c);
			out_string(str_nc);
		}
	};
};
