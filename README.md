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
    This module is licensed under the BSD license.

    Copyright (c) 2015-2017, by Anton Riabchevskiy (AntonRiab) <riab765@gmail.com>
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
