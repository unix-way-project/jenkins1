
/////

def backupService(String serviceName) {
    String projectName = "backup_service_" + serviceName

    stage("Backup for " + serviceName) {
        build([
                job       : projectName,
                parameters: [
                        string(name: "TIMEOUT", value: TIMEOUT),
                ]
        ])
    }
}

def backupAll() {
    parallel("alpha": {
        backupService("alpha")
    }, "beta": {
        backupService("beta")
    })
}

node("jenkins-slaves") {
    backupAll()
}
