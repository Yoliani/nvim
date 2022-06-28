local util = require 'lspconfig.util'

local bin_name = 'tailwindcss-language-server'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

return {
  -- filetypes copied and adjusted from tailwindcss-intellisense
  filetypes = {
    -- html
    'aspnetcorerazor',
    'astro',
    'astro-markdown',
    'blade',
    'django-html',
    'htmldjango',
    'edge',
    'eelixir', -- vim ft
    'ejs',
    'erb',
    'eruby', -- vim ft
    'gohtml',
    'haml',
    'handlebars',
    'hbs',
    'html',
    -- 'HTML (Eex)',
    -- 'HTML (EEx)',
    'html-eex',
    'heex',
    'jade',
    'leaf',
    'liquid',
    'markdown',
    'mdx',
    'mustache',
    'njk',
    'nunjucks',
    'php',
    'razor',
    'slim',
    'twig',
    -- css
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    'stylus',
    'sugarss',
    -- js
    'javascript',
    'javascriptreact',
    'reason',
    'rescript',
    'typescript',
    'typescriptreact',
    -- mixed
    'vue',
    'svelte',
  },
  init_options = {
    userLanguages = {
      eelixir = 'html-eex',
      eruby = 'erb',
    },
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className',
        'classList',
        'ngClass',
      },
    },
  },
  root_dir = function(fname)
    return util.root_pattern('tailwind.config.js', 'tailwind.config.ts')(fname)
        or util.root_pattern('postcss.config.js', 'postcss.config.ts')(fname)
        or util.find_package_json_ancestor(fname)
        or util.find_node_modules_ancestor(fname)
        or util.find_git_ancestor(fname)
  end,
}
