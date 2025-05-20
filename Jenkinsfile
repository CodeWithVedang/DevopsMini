pipeline {
    agent any
    environment {
        GIT_REPO = 'https://github.com/CodeWithVedang/DevopsMini.git'
        LOCAL_DIR = 'D:\\Vedang\\SEM_2_MCA\\Mini Project\\DO\\DEVMIN\\medical_management_system'
        IMAGE_NAME = 'medical-app:latest'
        WSL_ANSIBLE_SCRIPT = '/mnt/d/Vedang/SEM_2_MCA/Mini Project/DO/DEVMIN/medical_management_system/devopsdeploy.yml'
    }
    stages {
        stage('Test WSL') {
            steps {
                script {
                    bat 'wsl bash -c "ls /mnt/d"'
                }
            }
        }
    }
}