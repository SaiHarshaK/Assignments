(*
    List class is for initialited an empty list construct.
    cons creats a non-empty list.
*)

class List inherits IO {

   isNil() : Bool { true };

   head()  : String { { abort(); ""; } };

   tail()  : List { { abort(); self; } };

   cons(i : String) : List {
      (new Cons).init(i, self)
   };

};

(*
    Cons inherits from List for cons while others are redefined.
    Cons is non-empty list, so return false.
    head returns the head of the string.
    tail returns the rest of the string after head.
    c is char serves as head here, rest is the the prev list to which c will be added(to start)
*)

class Cons inherits List {

  h   : String; -- The element in this list cell
  h_follow : List;  -- The rest of the list after head

  isNil() : Bool { false };

  head()  : String { h };

  tail()  : List { h_follow };

  init(c : String, rest : List) : List {
    {
      h <- c;
      h_follow <- rest;
      self;
    }
  };

};

(*
    Stack command class has various function to implement the required interpreter.
*)

class StackCommand inherits Cons {

  stack : List;

  add() : List {
    let arg1 : String <- stack.tail().head(),
        arg2 : String <- stack.tail().tail().head() in
          let int1 : Int <- (new A2I).a2i(arg1),
              int2 : Int <- (new A2I).a2i(arg2) in {
                stack <- stack.tail().tail().tail();
                stack <- (new Cons).init((new A2I).i2a(int1 + int2), stack);
                stack;
    }
  };

  swap() : List {
    let h1 : String <- stack.head(), h2 : String <- stack.tail().head() in {
      stack <- (new Cons).init(h1, stack.tail().tail());
      stack <- (new Cons).init(h2, stack);
      stack;
    }
  };

  eval() : List {
    {
    out_string("hihi\n");
    out_string(stack.head());
    if stack.head() = "+" then
      add()
    else
      if stack.head() = "s" then
        swap()
      else
        stack
      fi
    fi;
    }
  };

  push(c : String) : List {
    {
      stack <- (new Cons).init(c, stack);
      stack;
    }
  };

};

class Main inherits IO {

  stack : StackCommand;

  display(stack_disp : List) : Object {
    if stack_disp.isNil() then
      out_string("it died\n")
    else {
      out_string(stack_disp.head());
      out_string("\n");
      display(stack_disp.tail());
    }
    fi
  };

  main () : Object {
      let cmd : String in {
        out_string("> ");
        cmd <- in_string();
        while (not cmd = "x") loop {
          if cmd = "+" then stack <- stack.push(cmd) else self fi;
          if cmd = "s" then stack <- stack.push(cmd) else self fi;
          if cmd = "e" then stack <- stack.eval() else self fi;
          if cmd = "d" then display(stack) else self fi;
          if cmd = "1" then stack <- stack.push(cmd) else self fi;
          if cmd = "2" then stack <- stack.push(cmd) else self fi;
          if cmd = "3" then stack <- stack.push(cmd) else self fi;
          if cmd = "4" then stack <- stack.push(cmd) else self fi;
          if cmd = "5" then stack <- stack.push(cmd) else self fi;
          if cmd = "6" then stack <- stack.push(cmd) else self fi;
          if cmd = "7" then stack <- stack.push(cmd) else self fi;
          if cmd = "8" then stack <- stack.push(cmd) else self fi;
          if cmd = "9" then stack <- stack.push(cmd) else self fi;
          if cmd = "0" then stack <- stack.push(cmd) else self fi;

          -- next command
          out_string("> ");
          cmd <- in_string();
        }
        pool;
      }
  } ;
} ;
