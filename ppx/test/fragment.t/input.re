let fragment = foo => [@bla] <> foo </>;

let just_one_child = foo => <> bar </>;
let poly_children_fragment = (foo, bar) => <> foo bar </>;
let nested_fragment = (foo, bar, baz) => <> foo <> bar baz </> </>;

let nested_fragment_with_lower = foo => <> <div> foo </div> </>;
