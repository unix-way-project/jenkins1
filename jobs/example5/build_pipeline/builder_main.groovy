
def testServiceStaticAnalyzer() {
  String projectName = "test_service_" + SERVICE + "_static_analizer"

  stage("Static code testing for service " + SERVICE) {
      build([
              job       : projectName,
              parameters: []
      ])
  }
}

def buildService(String version) {
  String projectName = "build_service_" + SERVICE

  stage("Build for service " + SERVICE) {
      build([
              job       : projectName,
              parameters: [
                      string(name: "VERSION", value: version),
              ]
      ])
  }
}

def testServiceUnit(String version) {
  String projectName = "test_service_" + SERVICE + "_unit"

  stage("Unit code testing for service " + SERVICE) {
      build([
              job       : projectName,
              parameters: [
                      string(name: "VERSION", value: version),
              ]
      ])
  }
}

def upgradeService(String version) {
  String projectName = "upgrade_service_" + SERVICE

  stage("Upgrade for service " + SERVICE) {
      build([
              job       : projectName,
              parameters: [
                      string(name: "VERSION", value: version),
              ]
      ])
  }
}

def testIntegrationUI() {
  String projectName = "test_integration_ui"

  stage("Running integration test for service " + SERVICE + ": UI") {
      build([
              job       : projectName,
              parameters: []
      ])
  }
}

def testIntegrationClient() {
  String projectName = "test_integration_client"

  stage("Running integration test for service " + SERVICE + ": Client") {
      build([
              job       : projectName,
              parameters: []
      ])
  }
}

def testIntegrationApi() {
  String projectName = "test_integration_api"

  stage("Running integration test for service " + SERVICE + ": Api") {
      build([
              job       : projectName,
              parameters: []
      ])
  }
}

def releaseService(String version) {
  String projectName = "release_service_" + SERVICE

  stage("Releasing service " + SERVICE + " to production") {
      build([
              job       : projectName,
              parameters: [
                      string(name: "VERSION", value: version),
              ]
      ])
  }
}

node("jenkins-slaves") {
    String version = BUILD_NUMBER

    testServiceStaticAnalyzer()
    buildService(version)
    testServiceUnit(version)

    parallel("ui": {
        testIntegrationUI()
    }, "client": {
        testIntegrationClient()
    }, "api": {
        testIntegrationApi()
    })

    releaseService(version)
}
