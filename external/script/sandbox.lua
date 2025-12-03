-- Ikemen Character Sandbox Mode
-- This script is loaded instead of system.lua when -sandbox flag is used.
-- 
-- Usage: Ikemen_GO.exe -sandbox -p1 chars/def.def -p2 chars/def.def -time -1
--
-- Command line flags handle character selection and match setup.
-- Just load the normal main system.

-- Load the main system
dofile("external/script/main.lua")

-- Enable the interactive console for sandbox mode
-- The lconsole module is loaded as part of external/mods initialization
if type(lconsole) == 'table' and type(toggleConsole) == 'function' then
  toggleConsole()  -- Turn on the console
  
  -- Hook lconsole into the update loop to ensure it gets called every frame
  local orig_update = update
  function update()
    if orig_update then
      orig_update()
    end
    -- Call lconsole.loop directly to ensure console input is processed
    if type(lconsole.loop) == 'function' then
      lconsole.loop()
    end
  end
else
  print("[Sandbox] Warning: lconsole module not available")
end








