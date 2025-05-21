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
        stage('Setup Python Environment in WSL') {
            steps {
                script {
                    bat 'wsl -d Ubuntu python3 -m venv /home/vedang/ansible_venv || echo "Virtual environment creation failed"'
                    bat 'wsl -d Ubuntu /home/vedang/ansible_venv/bin/pip install docker ansible || echo "Module installation failed"'
                    bat 'wsl -d Ubuntu /home/vedang/ansible_venv/bin/ansible-galaxy collection install community.docker || echo "Collection installation failed"'
                }
            }
        }
        stage('Copy Files to WSL') {
            steps {
                script {
                    bat 'wsl -d Ubuntu pwd'
                    bat 'wsl -d Ubuntu ls'
                    bat 'wsl -d Ubuntu sudo mkdir -p /home/jenkins/devopsprjv1 || echo "Directory creation failed"'
                    bat 'wsl -d Ubuntu sudo chown vedang:vedang /home/jenkins/devopsprjv1 || echo "Chown failed"'
                    bat 'wsl -d Ubuntu sudo cp -r /mnt/c/ProgramData/Jenkins/.jenkins/workspace/medical_management_pipeline/* /home/jenkins/devopsprjv1/ || echo "Copy failed"'
                }
            }
        }
        stage('Deploy with Ansible on WSL') {
            steps {
                script {
                    bat 'wsl -d Ubuntu /home/vedang/ansible_venv/bin/ansible-playbook %WSL_ANSIBLE_SCRIPT%'
                }
            }
        }
    }
}