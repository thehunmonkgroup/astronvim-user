util = require("user.util")

return {
    settings = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "warning",
                },
                typeCheckingMode = "off",
            },
        },
        pyright = {
            disableOrganizeImports = true,
        },
    },
    python = {
        linting = {
            flake8Enabled = true,
            flake8Path = util.get_mason_package_install_path("flake8") .. "/venv/bin/flake8",
        },
    },
}


