{
  fetchurl,
  makeSetupHook,
  writeText,
}:
let
  packageFormat2Xsd = fetchurl {
    url = "http://download.ros.org/schema/package_format2.xsd";
    hash = "sha256-pzKK8IWbPxWuTwSRLYRqWO3GZk2x5pr/BhsilAwZQwQ=";
  };
  packageFormat3Xsd = fetchurl {
    url = "http://download.ros.org/schema/package_format3.xsd";
    hash = "sha256-WFIBgJy/jIHsWk19hNgn9Gdt1ipLwKgS2npIXeoq1Do=";
  };

  rosPackageCatalog = writeText "ros-packages-catalog.xml" ''
    <?xml version="1.0"?>
    <!DOCTYPE catalog PUBLIC "-//OASIS//DTD XML Catalogs V1.1//EN" "http://www.oasis-open.org/committees/entity/release/1.1/catalog.dtd">
    <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
      <uri name="http://download.ros.org/schema/package_format2.xsd" uri="${packageFormat2Xsd}"/>
      <uri name="http://download.ros.org/schema/package_format3.xsd" uri="${packageFormat3Xsd}"/>
    </catalog>
  '';
in
makeSetupHook
  {
    name = "xmllint-package-format-xsd-hook";
    substitutions = {
      inherit rosPackageCatalog;
    };
  }
  (
    writeText "xmllint-package-format-xsd-hook.sh" ''
      _xmllintPackageHook() {
        export XML_CATALOG_FILES=@rosPackageCatalog@
      }

      preCheckHooks+=(_xmllintPackageHook)
    ''
  )
