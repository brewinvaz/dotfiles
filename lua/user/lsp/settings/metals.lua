local status_ok, metals = pcall(require, "metals")
if not status_ok then
	return
end

metals_config = metals.bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  -- excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
