# Shell library sourced instead of ./test-lib.sh by tests that need
# to run under Bash; primarily intended for tests of the completion
# script.

if test -n "$BASH" && test -z "$POSIXLY_CORRECT"; then
	# we are in full-on bash mode
	true
elif type bash >/dev/null 2>&1; then
	# execute in full-on bash mode
	unset POSIXLY_CORRECT
	exec bash "$0" "$@"
else
	echo '1..0 #SKIP skipping bash completion tests; bash not available'
	exit 0
fi

ps1_expansion_enable () { shopt -s promptvars; }
ps1_expansion_disable () { shopt -u promptvars; }

. ./test-lib.sh
