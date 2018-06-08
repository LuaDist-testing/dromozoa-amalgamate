#! /bin/sh -e

# Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
#
# This file is part of dromozoa-amalgamate.
#
# dromozoa-amalgamate is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# dromozoa-amalgamate is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dromozoa-amalgamate.  If not, see <http://www.gnu.org/licenses/>.

case x$TMPDIR in
  x) TMPDIR=/tmp;;
esac
tmp=`(umask 077 && mktemp -d "$TMPDIR/dromozoa-XXXXXX" 2>/dev/null || :)`
case x$tmp in
  x) tmp=$TMPDIR/dromozoa-$$-$RANDOM; (umask 077 && mkdir "$tmp");;
esac
tmp=`(cd "$tmp" && pwd)`
trap "(cd / && rm -f -r '$tmp')" 0

"$@" -s dromozoa-amalgamate >"$tmp/dromozoa-amalgamate"
diff -u dromozoa-amalgamate "$tmp/dromozoa-amalgamate"

"$@" -s test.lua >"$tmp/test1.lua"
env LUA_PATH= LUA_CPATH= lua "$tmp/test1.lua"
"$@" -s "$tmp/test1.lua" >"$tmp/test2.lua"
diff -u "$tmp/test1.lua" "$tmp/test2.lua"
