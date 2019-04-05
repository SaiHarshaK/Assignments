class Main inherits IO {
	(*object identifiers begin with a lower case letter*)
	A : Int;
	(*Type identifiers begin with a capital letter*)
	b : int;

	add() : Int { A + b };

	main() : Object{
		{
			out_string("Enter A: ");
			A <- in_int();
			out_string("Enter B: ");
			b <- in_int();
			out_int(add());
			out_string("\n");
		}
	};
};
