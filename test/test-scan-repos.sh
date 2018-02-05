#!/bin/bash
# vi: fdm=marker

# Constants {{{1
################################################################

SCRIPT_PATH=$(dirname $BASH_SOURCE)
SCANREPOS=$SCRIPT_PATH/../scan-repos

# Test version {{{1
################################################################

function test_version {

	local arg=$1

	for arg in -v --version ; do
		local version=$($SCANREPOS $arg)
		[ $? -eq 0 ] || return 1
		expect_str_re "$version" '^[0-9]\+\.[0-9]\+\.[0-9]\+$' || return 1
	done
}

# Main {{{1
################################################################

test_context "Testing scan-repos"

test_that "Version is printed correctly." test_version

test_report
