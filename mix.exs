defmodule KioskSystemx8664.Mixfile do
  use Mix.Project

  @app :kiosk_system_amdgpu_x86_64
  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.trim

  provider =
    if System.get_env("CI") != nil do
      Nerves.Artifact.Providers.Local
    else
      Nerves.Artifact.Providers.Docker
    end

  @provider provider

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.4",
      compilers: Mix.compilers ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: ["loadconfig": [&bootstrap/1]]
    ]
  end

  def application do
    []
  end

  defp bootstrap(args) do
    System.put_env("MIX_TARGET", "x86_64")
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  defp nerves_package do
    [
      type: :system,
      # artifact_sites: [
      #   {:github_releases, "letoteteam/#{@app}"}
      # ],
      provider: @provider,
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.0-rc", runtime: false},
      {:nerves_system_br, "~> 1.0-rc", runtime: false},
      {:nerves_toolchain_x86_64_unknown_linux_gnu , "~> 1.0-rc", runtime: false},
      {:nerves_system_linter, "~> 0.3.0", runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - x86_64 Kiosk
    """
  end

  defp package do
    [
      maintainers: ["Justin Schneck", "Greg Mefford", "Jeff Smith"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/letoteteam/#{@app}"}
    ]
  end

  defp package_files do
    [
      "package",
      "patches",
      "priv",
      "rootfs_overlay",
      "CHANGELOG.md",
      "Config.in",
      "external.mk",
      "fwup-revert.conf",
      "fwup.conf",
      "grub.cfg",
      "LICENSE",
      "linux-4.13.defconfig",
      "mix.exs",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "README.md",
      "users_table.txt",
      "VERSION"
    ]
  end
end
