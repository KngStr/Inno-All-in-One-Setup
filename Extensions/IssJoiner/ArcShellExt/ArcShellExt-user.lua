-- This file uses UTF8 encoding without BOM

-- InnoSetup script extensions regexp
iss_extensions = "iss"
-- iss_extensions = ".*"   -- match any file


-- User-defined function that returns Right-Click Menu items for given filename(s)
--   filenames: array of UTF8-encoded filenames selected in Explorer
--   return value: array of menu items, each item is structure with the following fields:
--                   for commands: text, command, help
--                   for submenus: text, submenu, help (where submenu is, recursively, array of menu items)
register_menu_handler (function (filenames)
  menu = {}

  if #filenames>1 then
    filename   = ""
    all_isss   = true
    for _,f in ipairs(filenames) do
      nameext  = drop_dir(f)
      filename = filename.." "..quote(nameext)
      ext      = string.lower(get_ext(nameext))
      is_iss   = string.match(ext,"^"..iss_extensions.."$")
      all_isss = all_isss and is_iss
      if not (all_isss) then break end
    end

    if all_isss then
      menu = {{text = "Join scripts", command = joiner..filename, help = "Join InnoSetup scripts selected into one script joined.iss"}}
    end
  end
  return menu
end)
