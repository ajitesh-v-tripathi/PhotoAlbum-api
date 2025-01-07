def call(String imageName, String tag) {
    echo "Pushing Docker image ${imageName}:${tag} to Docker Hub"
    sh "docker push ${imageName}:${tag}"
}
