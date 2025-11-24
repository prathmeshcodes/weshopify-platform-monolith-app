pipeline{
    agent any
    stages{
        stage('pull the source code'){
            steps{
                echo 'pulling the source code'
                git branch: 'app-deployment-files', url: 'https://github.com/prathmeshcodes/weshopify-platform-monolith-app.git'
                echo '==============================='
                echo 'source code pulling completed'
                echo '==============================='
            }
        }
        stage('copying the k8s manifest files to ansible'){
            steps{
                echo 'copying the k8s manifest files'
                sshagent(['Ansible-Machine']){
                    sh 'scp db-manifest-files/*.* ansbile-admin@192.168.0.132:/home/ansbile-admin/ci-cd-files/k8s-db-files'
                    sh 'scp app-manifest-files/*.* ansbile-admin@192.168.0.132:/home/ansbile-admin/ci-cd-files/k8s-app-files'
                    sh 'scp k8s-deployment-playbook.yml ansbile-admin@192.168.0.132:/home/ansbile-admin/ci-cd-files'
                    
                    // sh '''
                    //   ssh -tt ansible-admin@172.31.0.173 << EOF
                    //   ansible-playbook  ci-cd-files/k8s-deployment-playbook.yml
                    //   rm -f ./ci-cd-files/k8s-db-files/*.*
                    //   rm -f ./ci-cd-files/k8s-app-files/*.*
                    //   exit
                    //  EOF
                    // '''
                }
            }
        }//CD is completed
        
    }
}
