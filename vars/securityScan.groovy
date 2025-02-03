def call(String dockerImage, String dockerTag) {
    echo "Starting security scan for image: ${dockerImage}:${dockerTag}"

    sh "docker scan ${dockerImage}:${dockerTag}"
    // Or use another security scanning tool, depending on your requirements.
}
