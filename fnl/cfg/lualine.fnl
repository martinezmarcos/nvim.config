(match (pcall require :lualine)
  (false _) (lua "return")
  (true lualine)
  (let [branch 
         {1 "branch"
         :icons_enabled true
         :icon ""}
         
         filetype
         {1 "filetype"
         :icons_enabled false
         :icon nil}
         diff
         {1 "diff"
         :colored false
         :symbols {:added " " :modified "" :removed ""}
         :cond (fn []
                 (> (vim.fn.winwidth 0) 80))}]

    (fn progress []
      (local current-line (vim.fn.line "."))
      (local total-lines (vim.fn.line "$"))
      (local chars ["__" "▁▁" "▂▂" "▃▃" "▄▄" "▅▅" "▆▆" "▇▇" "██"])
      (local line-ratio (/ current-line total-lines))
      (local index (math.ceil (* line-ratio (length chars))))
      (. chars index))

    (lualine.setup
      {
      :options {
      :icons_enabled true
      :theme :auto
      :component_separators {:left "" :right ""}
      :section_separators {:left "" :right ""}
      :disable_filetypes [:dashboard :NvimTree :Outline]}
      :always_divide_middle true
      :sections {
      :lualine_a ["mode"]
      :lualine_b [branch]
      :lualine_c []
      :lualine_x [diff :encoding filetype]
      :lualine_y [:location]
      :lualine_z [progress]}
      :inactive_sections {
      :lualine_a []
      :lualine_b []
      :lualine_c [:filename]
      :lualine_x [:location]
      :lualine_y []
      :lualine_z []
      :tabline [] 
      }})))

{}
