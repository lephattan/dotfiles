local M = {}

local islist = vim.islist or vim.tbl_islist


local function get_spec(opts)
  local ret = opts.spec or {}
  return ret and type(ret) == "table" and islist(ret) and ret or { ret }
end

function M.extend(defaults, opts)
  local spec = {}
  vim.list_extend(spec, get_spec(defaults))
  vim.list_extend(spec, get_spec(opts))
  return vim.tbl_deep_extend("force", defaults, opts, { spec = spec })
end

---@class ProjectConfig
M.defaults = {
  config_file = "nvim.config.lua",
  ---@class ProjectOptions
  project = {
    auto_format = true,
  },
}

---@class ProjectConfig
M.options = M.defaults

function M.setup(opts)
  if type(opts) == "table" then
    M.options = M.extend(M.options, opts)
  end

  local project_conf_file = vim.fn.getcwd() .. "/" .. M.options.config_file
  local ok, project_module = pcall(dofile, project_conf_file)
  if not ok then
    return
  end
  print("Project config loaded from " .. M.options.config_file)

  if type(project_module.config) == "function" then
    local project_conf = project_module.config()
    M.options.project = M.extend(M.defaults.project, project_conf)
  end
end

return M
