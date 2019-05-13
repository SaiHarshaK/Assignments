(*
    List class is for initialited an empty list construct.
    cons creats a non-empty list.
*)
(*
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
*)
(*
    Stack command class has various function to implement the required interpreter.
*)

class StackCommand inherits IO {

  stack : StackCommand;

  head : String;

  tail : StackCommand;

  count : Int <- 0;

  getCount() : Int { count };

  getHead() : String { head };

  getTail() : StackCommand { tail };

  add() : StackCommand {
    let arg1 : String <- getTail().getHead(),
        arg2 : String <- getTail().getTail().getHead() in
          let int1 : Int <- (new A2I).a2i(arg1),
              int2 : Int <- (new A2I).a2i(arg2) in {
                stack <- getTail().getTail().getTail();
                stack <- construct((new A2I).i2a(int1 + int2), stack);
                count <- count - 2;
                stack;
    }
  };

  swap() : StackCommand {
    let h1 : String <- getHead(), h2 : String <- getTail().getHead() in {
      stack <- construct(h1, getTail().getTail());
      stack <- construct(h2, stack);
      stack;
    }
  };

  eval() : StackCommand {
    if getHead() = "+" then
      add()
    else
      if getHead() = "s" then
        swap()
      else
        stack
      fi
    fi
  };

  push(c : String) : StackCommand {
    {
      stack <- construct(c, stack);
      count <- count + 1;
      stack;
    }
  };

  construct(new_c: String, rest : StackCommand) : StackCommand {
    {
      head <- new_c;
      tail <- rest;
      self;
    }
  };

};

class Main inherits IO {

  stack : StackCommand <- new StackCommand;

  display(stack_disp : StackCommand) : Object {
    out_string(stack.getTail().getHead())
    (*if stack_disp.getCount() = 0 then
      out_string("it died\n")
    else {
      out_string(stack_disp.getHead());
      out_string("\n");
      display(stack_disp.getTail());
    }
    fi*)
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
