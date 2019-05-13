class Node {

  next : Node;

  value : String;

  set(c : String, n : Node) : Node {
    {
      value <- c;
      next <- n;
      self;
    }
  };

  getValue() : String { value };

  setValue(c : String) : Object { value <- c };

  getNext() : Node { next };

  setNext(n : Node) : Object { next <- n };

};

class StackCommand inherits IO {

  head : Node;

  getHead() : String { head.getValue() };

  add() : Node {
    let arg1 : String <- head.getNext().getValue(),
        arg2 : String <- head.getNext().getNext().getValue() in
          let int1 : Int <- (new A2I).a2i(arg1),
              int2 : Int <- (new A2I).a2i(arg2),
              tempNode : Node in {
                tempNode <- head.getNext().getNext();
                tempNode.setValue((new A2I).i2a(int1 + int2));
                head <- tempNode;
                head;
    }
  };

  swap() : Node {
    let h_node : Node <- head.getNext(),
        next_node : Node <- head.getNext().getNext() in {
          h_node.setNext(next_node.getNext());
          next_node.setNext(h_node);
          head <- next_node;
          head;
    }
  };

  eval() : Node {
    if head.getValue() = "+" then
      add()
    else
      if head.getValue() = "s" then
        swap()
      else
        head
      fi
    fi
  };

  push(c : String) : Node {
    let tempNode : Node in {
      tempNode <- (new Node).set(c, head);
      head <- tempNode;
      head;
    }
  };

  display(curr_node : Node) : Object {
    {
      if isVoid curr_node then
        self
      else {
        out_string(curr_node.getValue());
        out_string("\n");
        display(curr_node.getNext());
      }
      fi;
    }
  };

};

class Main inherits IO {

  stack : StackCommand <- new StackCommand;
  head : Node <- new Node;

  main () : Object {
      let cmd : String in {
        out_string("> ");
        cmd <- in_string();
        while (not cmd = "x") loop {
          if cmd = "+" then head <- stack.push(cmd) else self fi;
          if cmd = "s" then head <- stack.push(cmd) else self fi;
          if cmd = "e" then head <- stack.eval() else self fi;
          if cmd = "d" then stack.display(head) else self fi;
          if cmd = "1" then head <- stack.push(cmd) else self fi;
          if cmd = "2" then head <- stack.push(cmd) else self fi;
          if cmd = "3" then head <- stack.push(cmd) else self fi;
          if cmd = "4" then head <- stack.push(cmd) else self fi;
          if cmd = "5" then head <- stack.push(cmd) else self fi;
          if cmd = "6" then head <- stack.push(cmd) else self fi;
          if cmd = "7" then head <- stack.push(cmd) else self fi;
          if cmd = "8" then head <- stack.push(cmd) else self fi;
          if cmd = "9" then head <- stack.push(cmd) else self fi;
          if cmd = "0" then head <- stack.push(cmd) else self fi;

          -- next command
          out_string("> ");
          cmd <- in_string();
        }
        pool;
      }
  } ;
} ;
