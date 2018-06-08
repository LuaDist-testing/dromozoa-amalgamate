#! /usr/bin/env lua

-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-amalgamate.
--
-- dromozoa-amalgamate is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-amalgamate is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-amalgamate.  If not, see <http://www.gnu.org/licenses/>.

local test1 = require "test1"
local test2 = require "test2"
local test3 = require "test3"
local test4 = require "test4"

assert(test1 == 1)
assert(test2 == 2)
assert(test3 == 3)
assert(test4 == 4)
assert(arg[1] == nil)
os.exit(0)
