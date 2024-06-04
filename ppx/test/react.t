Demonstrate how to use the React JSX PPX

  $ cat > dune-project <<EOF
  > (lang dune 3.8)
  > (using melange 0.1)
  > EOF

  $ cat > dune <<EOF
  > (melange.emit
  >  (target output)
  >  (alias mel)
  >  (compile_flags :standard -w -20)
  >  (emit_stdlib false)
  >  (libraries reason-react melange.belt)
  >  (preprocess (pps melange.ppx reason-react-ppx)))
  > EOF

  $ cat > x.re <<EOF
  > module App = {
  >   [@react.component]
  >   let make = () =>
  >     ["Hello!", "This is React!"]
  >     ->Belt.List.map(greeting => <h1> greeting->React.string </h1>)
  >     ->Belt.List.toArray
  >     ->React.array;
  > };
  > let () =
  >   Js.log2("Here's two:", 2);
  >   ignore(<App />)
  > EOF

  $ dune build @mel

  $ cat _build/default/output/x.js
  // Generated by Melange
  'use strict';
  
  const Belt__Belt_List = require("melange.belt/belt_List.js");
  const JsxRuntime = require("react/jsx-runtime");
  
  function X$App(Props) {
    return Belt__Belt_List.toArray(Belt__Belt_List.map({
                    hd: "Hello!",
                    tl: {
                      hd: "This is React!",
                      tl: /* [] */0
                    }
                  }, (function (greeting) {
                      return JsxRuntime.jsx("h1", {
                                  children: greeting
                                });
                    })));
  }
  
  const App = {
    make: X$App
  };
  
  console.log("Here's two:", 2);
  
  JsxRuntime.jsx(X$App, {});
  
  exports.App = App;
  /*  Not a pure module */
