class GenerateController < ApplicationController
  def client

    autorest_version ='0.17.0-Nightly20160724'
    spec_url = 'https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-compute/2016-03-30/swagger/compute.json'
    add_credentials = true
    client_name = "ClientName"
    code_generator = "Ruby"
    header = "MICROSOFT_MIT"
    modeler = "Swagger"
    namespace = "Namespace"
    package_name = "PackageName"
    package_version = "0.1.0"
    payload_flattening_threshold = 2
    validation_level = "3"

    cmd_line_arguments = {
        '-Input': spec_url,
        '-Namespace': namespace,
        '-OutputDirectory': '.',
        '-CodeGenerator': code_generator,
        '-Modeler': modeler,
        '-ClientName': client_name,
        '-PaylodFlatteningThreshold': payload_flattening_threshold,
        '-Header': header,
        '-AddCredentials': add_credentials,
        '-OutputFileName': '',
        '-pn': package_name,
        '-pv': package_version
    }
    GenerateHelper.execute_autorest(autorest_version, cmd_line_arguments)
  end
end
