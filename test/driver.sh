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

"$@" dromozoa-amalgamate -o test1.out dromozoa-amalgamate
env LUA_PATH= LUA_CPATH= "$lua" test1.out
"$@" dromozoa-amalgamate -o test2.out test1.out
diff -u test1.out test2.out
"$@" test1.out -o test2.out dromozoa-amalgamate
diff -u test1.out test2.out
"$@" test1.out -o test2.out test1.out
diff -u test1.out test2.out

for i in test/test*.lua
do
  "$@" dromozoa-amalgamate -o test1.out test/test.lua
  env LUA_PATH= LUA_CPATH= "$lua" test1.out
  "$@" dromozoa-amalgamate -o test2.out test1.out
  diff -u test1.out test2.out
done
