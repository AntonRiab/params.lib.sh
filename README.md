About
===============
Light replacement for getopts for writing scripts faster.

Sample of script demo_light
-----------------------
    #!/bin/sh
    myfunc1_help="It's help about myfunc1"
    myfunc1() {
       echo "inside myFunc1"
    }
    . ./params.lib.sh


Samples of valid shell calls
-----------------------
    $ ./demo_light help
    Current script does't contain global _help...Undefined!!!
    But you can try to use next advanced help peer values/function:
	    --myfunc1

    $ ./demo_light help myfunc1
    It's help about myfunc1

    $ ./demo_light --myfunc1
    inside myFunc1

Conception
===============
How usually large script burn: You make one or two lines. After some time you append new strings. The exists lines makes entity and you wrap it into a function.  
Every new entity needs external call. So it needs to have been added into the argument parses.  
**You have to edit argument parses everytime when you make or change entity? - the params.lib.sh solve it!**  
It work with arguments without your interventions.

All possibilities
===============
Accelerates your work with
* **function** call from params: function have to begin from start of line and first string of the function have to end with `{` like `myfunction () {`
* **argument** of function by params: it pass with in default into your function.
* **help** creation: just add variable with end **_help** in the name - it automatic will added to the help output.
* **loop** by arguments for function: add **_loop** to the end of name, and it call function by elements in array of arguments.

Recommendation and calls
===============
Make variable in you script like next `variable=${variable:="It's default"}`, it's will gave you opportunity to change it in envirement.
You can call it with variables changes `variable1=test ./scriptname function_in_script function_argv`

Status
===============
Stable. Tested on Ubuntu 16.04

Files
===============
* params.lib.sh - target library for include
* demo_full - sample how to use it
* demo_light - sample to test
* GNUmakefile - it's need only for self test
* output_test_reference - only for seld test


License
======
MIT License

Copyright (c) 2018 Ivan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
