pipeline {
    agent any
    environment {
        GIT_REPO = 'https://github.com/CodeWithVedang/DevopsMini.git'
        LOCAL_DIR = 'D:\\Vedang\\SEM_2_MCA\\Mini Project\\DO\\DEVMIN\\medical_management_system'
        IMAGE_NAME = 'medical-app:latest'
        WSL_ANSIBLE_SCRIPT = '/home/jenkins/devopsprjv1/devopsdeploy.yml'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker-compose -f "%LOCAL_DIR%\\docker-compose.yml" build'
                }
            }
        }
        stage('Copy Playbook to WSL') {
            steps {
                script {
                    bat 'wsl -d Ubuntu mkdir -p /home/jenkins/devopsprjv1'
                    bat 'wsl -d Ubuntu cp /mnt/d/Vedang/SEM_2_MCA/Mini_Project/DO/DEVMIN/medical_management_system/devopsdeploy.yml /home/jenkins/devopsprjv1/'
                }
            }
        }
        stage('Deploy with Ansible on WSL') {
            steps {
                script {
                    bat 'wsl -d Ubuntu ansible-playbook %WSL_ANSIBLE_SCRIPT%'
                }
            }
        }
    }
}