(* Check if string is palindrome *)

class Str {
  (* A function called to check if string is palindrome *)
  palindrome(str : String) : Bool {
  	(* Check for the case where empty string ot string with length 1 is given *)
  	if str.length() = 0 then true else
  		if str.length() = 1 then true else
  			(* Now check recursively, if first and last letter matches. *)
  			if str.substr(0, 1) = str.substr(str.length() - 1, 1) then palindrome(str.substr(1, str.length() - 1))
  				else false
  			fi
  		fi
  	fi
  };
};

class Main inherits IO {
	str_in : String;

	main() : Object {
		{
			out_string("Enter string: ");
			str_in <- in_string();
			if (new Str).palindrome(str_in) then out_string("It is a palindrome\n")
			else
				out_string("It is not a palindrome\n")
			fi;
		}
	};
};
