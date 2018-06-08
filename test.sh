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

case x$1 in
  x) lua=lua;;
  *) lua=$1;;
esac
export lua

./test/driver.sh "$lua"

r='require "luarocks.loader"'
p='print(#(package.loaders or package.searchers))'
if "$lua" -e "$r" >/dev/null 2>&1
then
  # "$lua" -e "$p" -e "$r" -e "$p"
  ./test/driver.sh "$lua" -e "$r"
fi

rm -f test*.out
