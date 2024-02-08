local M = {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")
    local extras = require("luasnip.extras")
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local conds = require("luasnip.extras.expand_conditions")
    local postfix = require("luasnip.extras.postfix").postfix
    local types = require("luasnip.util.types")
    local parse = require("luasnip.util.parser").parse_snippet
    local ms = ls.multi_snippet

    ls.config.set_config({
      history = false,
      enable_autosnippets = true,
    })

    ls.add_snippets("lua", {
      s(
        {
          trig = "lzplg",
        },
        {
          t({ "local M = {", "" }),
          t({ "\t\"" }), i(1), t({ "\",", "" }),
          t({ "\tevent = " }), i(2), t({ "\"\",", "" }),
          t({ "\tconfig = function ()", "" }),
          i(3),
          t({ "\tend,", "" }),
          t({ "}", "", "" }),
          t({ "return M" }),
        }
      ),
    })

    ls.add_snippets("typescript", {
      s(
        {
          trig = "trpc",
        },
        {
          t({ "import { z } from 'zod'", "" }),
          t({ "import { TRPCError } from '@trpc/server';", "" }),
          t({ "import { createTRPCRouter } from '~/server/trpc/trpc';", "", "" }),
          t({ "export const " }), i(1), t({ " = createTRPCRouter({", "" }),
          t({ "\t" }), i(2), t({ ": " }), i(3), t({ ",", "" }),
          t({ "});"}),
        }
      ),
    })

    ls.add_snippets("vue", {
      s(
        {
          trig = "v2tsc",
        },
        {
          t({ "<template>", "" }),
          t({ "</template>", "", "" }),
          t({ "<script lang=\"ts\">", "" }),
          t({ "import { defineComponent } from '@vue/composition-api';", "", "" }),
          t({ "export default defineComponent({", "" }),
          t({ "\tname: '" }), i(1), t({ "',", "" }),
          t({ "\tcomponents: {},", "" }),
          t({ "\tprops: {},", "" }),
          t({ "\tsetup(props) {", "" }),
          t({ "\t\treturn {};", "" }),
          t({ "\t},", "" }),
          t({ "});", "" }),
          t({ "</script>", "", "" }),
          t({ "<style lang=\"sass\" scoped>", "" }),
          t({ "</style>" }),
        }
      ),
    })

    ls.add_snippets("vue", {
      s(
        {
          trig = "v3tsc",
        },
        {
          t({ "<script setup lang=\"ts\">", "" }),
          t({ "</script>", "", "" }),
          t({ "<template>", "" }),
          t({ "</template>", "", "" }),
          t({ "<style scoped>", "" }),
          t({ "</style>" }),
        }
      ),
    })

    require("luasnip.loaders.from_vscode").load()
  end,
}

return M
