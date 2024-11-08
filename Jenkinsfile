def ver = versions.node("20.17.0")
stagingBuildNode(buildContainer: ver.buildContainer, nodeName: ver.nodeName, containerName: 'node') {
    stage('Checkout') {
        common.emptyDir()
        gitCheckout {}
    }
    stage('Build Server') {
        dockerImage.buildPush()
    }
    stage('Build Client') {
       sh """
            set +x
            git config remote.origin.url https://${GITHUB_AUTH}@github.com/totalwinelabs/${common.project}
            git config --global user.name svc-twm
            git config --global user.email "svc-twm@totalwine.com"
            npm config set @totalwinelabs:registry https://npm.pkg.github.com
            echo "${GITHUB_AUTH}" | xargs echo //npm.pkg.github.com/:_authToken=>> ~/.npmrc
            set -x
            cd cli
            npm install
            npm build
            npm publish bin/script
        """
    }
}
