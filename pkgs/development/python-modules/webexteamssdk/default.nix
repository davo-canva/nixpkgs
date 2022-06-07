{ lib
, buildPythonPackage
, fetchFromGitHub
, future
, pyjwt
, requests
, requests-toolbelt
}:

buildPythonPackage rec {
  pname = "webexteamssdk";
  version = "1.6.1";

  src = fetchFromGitHub {
    owner = "CiscoDevNet";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-xlkmXl4tVm48drXmkUijv9GNXzJcDnfSKbOMciPIRRo=";
  };

  propagatedBuildInputs = [
    future
    pyjwt
    requests
    requests-toolbelt
  ];

  # Tests require a Webex Teams test domain
  doCheck = false;
  pythonImportsCheck = [ "webexteamssdk" ];

  meta = with lib; {
    description = "Python module for Webex Teams APIs";
    homepage = "https://github.com/CiscoDevNet/webexteamssdk";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
