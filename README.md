SCAN-REPOS
==========

`scan-repos` is a small script utility that prints a brief summary of the state of your Git repositories.

You can run `scan-repos` using a specified Git directory, or specify a directory that contains Git directories. See *RUNNING* section for more details.

INSTALLING
----------

You can use `scan-repos` script as is, or install it using *autoconf*.

First run the *autoconf* tools:
``` {.bash}
aclocal
automake --add-missing
autoconf
./configure
```

Then run the tests:
``` {.bash}
make check
```

Finally install:
``` {.bash}
make install
```

For uninstalling:
``` {.bash}
make uninstall
```

RUNNING
-------

`scan-repos` works by analyzing a list of Git repositories or directories containing Git repositories.

You can run scan-repos from inside the current directory:
``` {.bash}
scan-repos .
```
Or inside any directory:
``` {.bash}
scan-repos /my/dir
```
You can also specify several directories:
``` {.bash}
scan-repos /my/dir1 /my/dir2
```
If no directory is specified on the command line, the `REPOSPATH` environment variable is used:
``` {.bash}
export REPOSPATH=$HOME/dev:$HOME/my/other/git/repos
scan-repos
```

Since scanning Git repositories can be quite long, a progress bar can be displayed:
``` {.bash}
scan-repos -p
```

Some of the most useful options are:

Option | Description
------ | -----------------------------
`-a`   | Push repositories whose current branch is ahead.
`-b`   | Pull repositories whose current branch is behind.
`-f`   | Fetch repositories, and thus allows to know which repository has its current branch behind.
`-s`   | Check also the states of submodules. Takes longer time.

To get a full list of options, run:
``` {.bash}
scan-repos -h
```

EXAMPLES
--------

 TODO
