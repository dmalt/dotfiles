local iron = require('iron')

iron.core.add_repl_definitions {
  -- python = {
  --   mycustom = {
  --     command = {"mycmd"}
  --   }
  -- },
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  },
  matlab = {
    matlab_connect = {
      -- command = {"bash", "-c", "matlab -nodesktop -nosplash"}
      command = {"bash"}
      -- open = ":begin", -- multiline block begin
      -- close = {":end", ""} -- multiline block end with two lines
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein",
    sh = "zsh",
    matlab = "matlab"
  },
  repl_open_cmd = "botright vertical split"
}
