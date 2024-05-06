{ lib
, buildPythonPackage
, fetchPypi
, fastcore
, traitlets
, ipython
, pythonOlder
}:

buildPythonPackage rec {
  pname = "execnb";
  version = "0.1.6";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-KJ2XEHqFY0SxbAiVPWBFO0cyC0EWgGDso8wt7lBLTgU=";
  };

  propagatedBuildInputs = [ fastcore traitlets ipython ];

  # no real tests
  doCheck = false;
  pythonImportsCheck = [ "execnb" ];

  meta = with lib; {
    description = "Execute a jupyter notebook, fast, without needing jupyter";
    homepage = "https://github.com/fastai/execnb";
    changelog = "https://github.com/fastai/execnb/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ rxiao ];
    mainProgram = "exec_nb";
  };
}
