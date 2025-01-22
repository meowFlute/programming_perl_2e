# Chapter 1: An Overview of Perl

This chapter intends to give an intro to Perl that is neither comprehensive nor a paced tutorial. 
The writing style is one of someone who got their start on the "normal" or "human" side of things
outside of a programming environment, and then later learned how to write an interpreter. 

## Main ideas
### Variable types
The variable types are defined based on plurality:
- singular variables get a `$` at the front
- arrays get an `@` at the front

The rest of the types they present in this chapter are summarized in this table, but I generally like
the idea of singular and plural nouns like a language

| Type     | Character | Example  | Is a name for:                         |
| -------- | --------- | -------- | -------------------------------------  |
| Scalar   | $         | $cents   | An individual value (number or string) |
| Array    | @         | @large   | A list of values, keyed by number      |
| Hash     | %         | %homes   | A list of values, keyed by string      |
| Handle   | &         | &how     | A callable chunk of Perl code          |
| Typeglob | *         | \*struck | Everything named struck                |

### Assignment rules
#### Scalar variables
The way you can assign something is a lot like the unix shell, here are some examples

```perl
$answer = 42;                    # an integer
$pi = 3.14159265;                # a 'real' number
$avogadro = 6.02e23;             # scientific notation
$pet = "Camel";                  # string
$sign = "I love my $pet";        # string with interpolation
$cost = 'it costs $100';         # string without interpolation
$thence = $whence;               # another variable
$x = $moles * $avogadro;         # an expression
$cwd = `pwd`;                    # string output from a command
$exit = system("vi $x");         # numeric status of a command
$fido = new Camel "Fido";        # an object
```

stuff can be converted on the fly -- I'm not sure how I feel about that, but it'll convert between strings, 
numbers, etc as needed

#### Arrays
This looks a lot like list / tuples in python.

```perl
# arrays on either side of the assignment look the same
@home = ("couch", "chair", "table", "stove");
($potato, $lift, $tennis, $pipe) = @home;

# you can use this to swap variables in parallel
($first, $second) = ($second, $first)

# these are indexed by zero and the symbol becomes a $ if you index a single variable
$home[0] = "couch";
```

you can also do things on arrays like `push` and `pop`

#### Hashes
These can be assigned in something that resembles a list or by using the much more intuitive `=>` operator

```perl
%longday = ("Sun", "Sunday", "Mon", "Monday");

# use the => operator if you want it to be more readable
%longday = (
    "Sun" => "Sunday",
    "Mon" => "Monday",
);
```

hashes are indexed by string, like `$longday{"Mon"}`

## Running a Perl program
Just use a shebang and make it executable. The `-w` flag turns on helpful warnings

```perl
#!/usr/bin/perl -w
```

## Filehandles
A filehandle is a stream, and you can open them not just for reading or writing, but piping and such.
`STDOUT`, `STDIN`, and `STDERR` are all there as expected, but you can create others like so

```perl
open(SESAME, "filename");              # read from existing file (implicit)
open(SESAME, "<filename");             # read from existing file (explicit)
open(SESAME, ">filename");             # create file and write to it
open(SESAME, ">>filename");            # append to existing file
open(SESAME, "| output-pipe-command"); # set up an output filter
open(SESAME, "input-pipe-command |");  # set up an input filter
```

you read a line with the `<HANDLE>` operator `<>`, for example (`chop` removes the last character which ends up being a newline)

```perl
print STDOUT "Enter a number: ";
chop($number = <STDIN>);
print STDOUT "The number is $number\n"
```

## Operators
All the normal stuff except `**` is exponentiation, `.` does string concatentation. `x` does string multiplication

```perl
$a = 123;
$b = 456;
$c = 3;
print $a + $b; # prints 579
print $a . $b; # prints 123456
print $a * $c; # prints 369
print $a x $c; # prints 123123123
```

autoincrement and autodecrement `++` and `--` are alive and well

logical operators can be written as the `C` way or the `python` way of writing `and`, `or`, `not` explicitly

There is a comparison operator `<=>` for booleans

File testing looks a lot like `bash` stuff

Regular expressions are used heavily
