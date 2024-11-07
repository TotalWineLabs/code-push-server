def ver = versions.node("20.17.0")
stagingBuildNode(buildContainer: ver.buildContainer, nodeName: ver.nodeName, containerName: 'node') {
    stage('Checkout') {
        common.emptyDir()
        gitCheckout {}
    }
    stage('Build') {
        dockerImage.buildPush()
    }

}
