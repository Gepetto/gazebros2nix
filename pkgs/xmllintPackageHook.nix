{
  fetchurl,
  makeSetupHook,
  writeText,
}:
let
  packageFormat3Xsd = fetchurl {
    url = "http://download.ros.org/schema/package_format3.xsd";
    hash = "sha256-WFIBgJy/jIHsWk19hNgn9Gdt1ipLwKgS2npIXeoq1Do=";
  };
in
makeSetupHook
  {
    name = "xmllint-package-format3-xsd-hook";
    substitutions = {
      inherit packageFormat3Xsd;
    };
  }
  (
    writeText "xmllint-package-format3-xsd-hook.sh" ''
      _xmllintPackageHook() {
        if [ -f "../package.xml" ]; then
          substituteInPlace "../package.xml" --replace-fail \
            "http://download.ros.org/schema/package_format3.xsd" \
            "@packageFormat3Xsd@"
        fi
      }

      preCheckHooks+=(_xmllintPackageHook)
    ''
  )
