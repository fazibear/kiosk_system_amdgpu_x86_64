defmodule Example.MixProject do
  use Mix.Project

  System.put_env("MIX_TARGET", "x86_64")
  @target System.get_env("MIX_TARGET") || "host"

  def project do
    [
      app: :example,
      version: "0.1.0",
      elixir: "~> 1.4",
      target: @target,
      archives: [nerves_bootstrap: "~> 1.0-rc"],
      deps_path: "deps/#{@target}",
      build_path: "_build/#{@target}",
      lockfile: "mix.lock.#{@target}",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: ["loadconfig": [&bootstrap/1]],
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers,
      make_makefile: "mix.mk",
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application, do: application(@target)

  # Specify target specific application configurations
  # It is common that the application start function will start and supervise
  # applications which could cause the host to fail. Because of this, we only
  # invoke Example.start/2 when running on a target.
  def application("host") do
    [extra_applications: [:logger]]
  end

  def application(_target) do
    [mod: {Example.Application, []}, extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:nerves, "~> 1.0-rc", runtime: false},
      {:ring_logger, "~> 0.4"}
    ] ++ deps(@target)
  end

  # Specify target specific dependencies
  defp deps("host"), do: []

  defp deps(target) do
    [
      {:shoehorn, "~> 0.2"},
      {:nerves_runtime, "~> 0.4"},
      {:nerves_network, "~> 0.3"},
      {:nerves_init_gadget, "~> 0.1"},
      {:muontrap, "~> 0.2"}
    ] ++ system(target)
  end

  defp system("x86_64"), do: [{:kiosk_system_amdgpu_x86_64, path: "../", runtime: false}]
  defp system(target), do: Mix.raise "Unknown MIX_TARGET: #{target}"

end
