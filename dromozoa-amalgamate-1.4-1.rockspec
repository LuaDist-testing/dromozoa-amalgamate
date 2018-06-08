-- This file was automatically generated for the LuaDist project.

package = "dromozoa-amalgamate"
version = "1.4-1"
-- LuaDist source
source = {
  tag = "1.4-1",
  url = "git://github.com/LuaDist-testing/dromozoa-amalgamate.git"
}
-- Original source
-- source = {
--   url = "https://github.com/dromozoa/dromozoa-amalgamate/archive/v1.4.tar.gz";
--   file = "dromozoa-amalgamate-1.4.tar.gz";
-- }
description = {
  summary = "Amalgamation of Lua modules and scripts";
  license = "GPL-3";
  homepage = "https://github.com/dromozoa/dromozoa-amalgamate/";
  maintainer = "Tomoyuki Fujimori <moyu@dromozoa.com>";
}
dependencies = {
  "dromozoa-commons";
}
build = {
  type = "builtin";
  modules = {
    ["dromozoa.amalgamate"] = "dromozoa/amalgamate.lua";
  };
  install = {
    bin = {
      ["dromozoa-amalgamate"] = "dromozoa-amalgamate";
    };
  };
}