@Library("jenkins-pipeline-templates@DEVOPS-1792-optional-directory")
def ver = versions.node("20.17.0")
stagingBuildNode(buildContainer: ver.buildContainer, nodeName: ver.nodeName, containerName: 'node') {
    stage('Checkout') {
        common.emptyDir()
        gitCheckout {}
    }
    stage('Build Server') {
        dockerImage.buildPush()
    }
}
stage('Deploy Client'){
    publishNodePackage{
        buildDir = 'bin/script'
        packageDir = 'cli'
    }
}
