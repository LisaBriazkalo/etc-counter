pipeline {
    agent {
        docker {
            image 'my-jenkins'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/LisaBriazkalo/etc-counter.git'
            }
        }
        stage('Download DEB package') {
            steps {
                sh '''
                    curl -L https://github.com/LisaBriazkalo/etc-counter/raw/main/packages/deb-package.deb -o /tmp/deb-package.deb
                '''
            }
        }
        stage('Install DEB') {
            steps {
                sh '''
                    sudo dpkg -i /tmp/deb-package.deb
                '''
            }
        }
        stage('Run script') {
            steps {
                sh '''
                    /usr/local/bin/count_files.sh
                '''
            }
        }
    }
}
