return {
  name = "crescent-starter",
  version = "1.0.0",
  description = "Application starter for Crescent Framework",
  tags = { "web", "application", "crescent" },
  license = "MIT",

  dependencies = {
    "luvit/luvit@2.18.1",
  },

  files = {
    "**.lua",
    "!logs/**",
  }
}