return {
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      local tailwind_prefixs = {
        "bg-",
        "text-",
        "decoration-",
        "border-",
        "outline-",
        "shadow-",
        "inset-shadow-",
        "ring-",
        "inset-ring-",
        "accent-",
        "caret-",
        "fill-",
        "stroke-",
      }

      local tailwind_colors = {
        "red",
        "orange",
        "amber",
        "yellow",
        "lime",
        "green",
        "emerald",
        "teal",
        "cyan",
        "sky",
        "blue",
        "indigo",
        "violet",
        "purple",
        "fuchsia",
        "pink",
        "rose",
        "slate",
        "gray",
        "zinc",
        "neutral",
        "stone",
      }

      local tailwind_shades = {
        "50",
        "100",
        "200",
        "300",
        "400",
        "500",
        "600",
        "700",
        "800",
        "900",
        "950",
      }

      local function generate_tailwind_classes()
        local classes = {}
        for _, prefix in ipairs(tailwind_prefixs) do
          for _, color in ipairs(tailwind_colors) do
            for _, shade in ipairs(tailwind_shades) do
              table.insert(classes, prefix .. color .. "-" .. shade)
            end
          end
        end
        return classes
      end
      table.remove(opts.groups.default, 2)
      opts.groups.typescript = vim.list_extend(opts.groups.typescript, {
        augend.constant.new({ elements = { "function", "export default function", "export function" } }),
        augend.constant.new({
          elements = generate_tailwind_classes(),
          word = true,
          cyclic = true,
        }),
      })
    end,
  },
  -- {
  -- 	"monaqa/dial.nvim",
  --    -- stylua: ignore
  --    keys = {
  --      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
  --      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
  --    },
  -- 	config = function()
  -- 		local augend = require("dial.augend")
  -- 		require("dial.config").augends:register_group({
  -- 			default = {
  -- 				augend.integer.alias.decimal,
  -- 				augend.integer.alias.hex,
  -- 				augend.date.alias["%Y/%m/%d"],
  -- 				augend.constant.alias.bool,
  -- 				augend.semver.alias.semver,
  -- 				augend.constant.new({ elements = { "let", "const" } }),
  -- 			},
  -- 		})
  -- 	end,
  -- }
}
