(* true and false are case sensitive so True and False are not recognized as the boolean values.*)

class Main inherits IO {
	awesome : Bool;
	cool : Bool;
	main(): Object {
		{
			awesome <- True;
			cool <- False;
			out_string("true and false are case sensitive :(");
		}
	};
};
