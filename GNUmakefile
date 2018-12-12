all:
	@echo "Make file"
	@$(shell make test_all > current_log)
	@echo "Diff with reference"
	@diff output_test_reference current_log > current_diff
	@test -s current_diff && echo "Test feiled" && echo \
	 && cat current_diff && exit 1 || return 0
	@echo "Test passed. Remove test files..."
	@make clean

test_all: output_demo_full_help output_demo_full_run output_demo_light

output_demo_full_help:
	./demo_full help
	./demo_full help list
	./demo_full help myfunc1
	./demo_full help myfunc2_loop
	./demo_full help variable
	./demo_full help myfunc3 || return 0

output_demo_full_run:
	./demo_full myfunc1
	variable=new_value    ./demo_full myfunc1 first second
	variable2=other_value ./demo_full myfunc1 first second
	./demo_full myfunc2_loop first_line second_line
	./demo_full myfunc3

output_demo_light:
	./demo_light help || return 0

clean:
	rm current_log  || return 0
	rm current_diff || return 0