#!/bin/bash
#
## blog
#
# This script creates a temporary file with [trofaf][] header data and
# opens it with an editor. When this is saved and closed, the file is
# moved to a particular directory with a title given either as the
# first argument, or read on the command line after completion.
#
# Once the file has been successfully renamed to markdown, if REGENDIR
# is set, the static site is regenerated with 'trofaf -g'.
#
#   [trofaf]: https://github.com/PuerkitoBio/trofaf
#

#############
# VARIABLES #
#############

AUTHOR="Luke Evers"
LANG="en"
EDITOR="emacs"
OUTDIR="$HOME/blog/posts"

REGENDIR="$HOME/blog"

##################
# SANE DEFAUALTS #
##################

REGENERATE="trofaf -g"

SUFFIX="md"
FILENAME="$1"

TEMPFILE="$(tempfile -p blog-)"

#############
# FUNCTIONS #
#############

# Check flags parses the the argument list for flags, and if it finds
# any, ceases normal execution.
check_flags() {
	CURFLAG="$1"
	if [ "$CURFLAG" == "-r" ]; then
		echo "Regenerating..."
		regenerate
		exit 0
	fi
}

regenerate() {
	cd "$REGENDIR"
	$REGENERATE -n "Luke Evers" -b http://blog.lukevers.com
}

generate_template() {
	echo "---
Title:
Description:
Author: $AUTHOR
Date: $(date '+%Y-%m-%d %H:%M')
Lang: $LANG
---
" > "$1"
}

compose() {
	# While $FILENAME is length 0, edit the tempfile, ask for a
	# filename, and read it into $FILENAME.
	while [ -z "$FILENAME" ]; do
		$EDITOR "$TEMPFILE"

		echo -n "Enter post filename: "
		read FILENAME
	done
}

add_post() {
	mv "$1" "$OUTDIR/$2.$SUFFIX"
	if [ ! -z "$REGENDIR" ]; then
		echo "Regenerating..."
		regenerate
	fi
}

exit_unfinished() {
	echo "\nAbandoning blogpost $TEMPFILE"
	exit 1
}

########
# MAIN #
########

# If the routine is interrupted, show the path of the tempfile and
# exit.
trap exit_unfinished INT

check_flags $*

generate_template "$TEMPFILE"
compose
add_post "$TEMPFILE" "$FILENAME"
