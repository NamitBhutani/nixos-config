{ ... }:
{
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    model = "opencode/muse-spark-1.3-contributor-free";
  };
}
