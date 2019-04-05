class Main inherits IO {
  str : String;
  str_len : Int;
  it : Int;
  word_count : Int;
  character_count : Int;
  at_word : Bool;
  blank : String;
  temp : String;

  main() : Object {
    {
      out_string("Enter the sentence: ");
      str <- in_string();
      (* Iterate over string to check for any spaces *)
      (* Initialize iterator *)
      it <- 0;
      word_count <- 0;
      character_count <- 0;
      at_word <- false;
      blank <- " ";
      temp <- " ";
      temp <- temp.concat(str);
      str_len <- str.length();

      (* Print all the words, maintain word count and char count *)
      while not it = str_len + 1
      loop
      {
        if temp.substr(it, 1) = blank then at_word <- false else {
          character_count <- character_count + 1;
          if at_word = false then {
            word_count <- word_count + 1;
            out_string("\n");
          }else 0 fi;
          out_string(temp.substr(it, 1));
          at_word <- true;
        } fi;
        it <- it + 1;
      }
      pool;
      out_string("\n");
      out_string("The number of words: ");
      out_int(word_count);
      out_string("\n");
      out_string("The number of characters: ");
      out_int(character_count);
      out_string("\n");
    }
  } ;
} ;
