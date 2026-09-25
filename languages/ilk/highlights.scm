[
  "@{"
  "}"
  "@<"
  "@>"
  "@["
  "@"
  "<"
  ">"
  "|"
  (block_close)
] @punctuation.special @ilk.punctuation.special

(label) @label @ilk.label

(escape) @string.escape @ilk.string.escape

(comment) @comment @ilk.comment

(number) @number @ilk.number

(quoted_atom) @string @ilk.string

(escape_sequence) @string.escape @ilk.string.escape

((atom) @constant @ilk.constant
  (#not-match? @constant "^[$?#]|[$?#]$"))

((atom) @variable @ilk.variable
  (#match? @variable "^[$?#]|[$?#]$"))

(functor) @function @ilk.function

[
  (symbol)
  (operator)
] @operator @ilk.operator

[
  "("
  ")"
] @punctuation.bracket @ilk.punctuation.bracket

[
  ","
  ";"
] @punctuation.delimiter @ilk.punctuation.delimiter
