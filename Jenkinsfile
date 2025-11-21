pipeline{
    agent any
    tools {
        maven "weshopify-platform-maven"
    }
    stages{
        stage('pull the source code'){
            steps{
                echo 'pulling the source code'
                git branch: 'security', url: 'https://github.com/prathmeshcodes/weshopify-platform-monolith-app'
                echo '==============================='
                echo 'source code pulling completed'
                echo '==============================='
            }
        }
        stage('building the source code'){
            steps{
                echo 'starting the code build'
                sh 'mvn clean deploy -DskipTests=true'
            }
        }

        stage('copying the docker and jfrog files to ansible'){
            steps{
                echo 'copying the docker and jfrog files'
                sshagent(['Ansible-Machine']){
                    sh 'scp jfrog-server-conn.sh ansbile-admin@192.168.0.132:/home/ansbile-admin/ci-cd-files'
                    sh 'scp Dockerfile ansbile-admin@192.168.0.132:/home/ansbile-admin/ci-cd-files'
                    // sh 'scp docker-playbook.yml ansible-admin@192.168.0.131:/home/ansbile-admin/ci-cd-files'
                    
                    // sh '''
                    //  ssh -tt ansible-admin@192.168.0.131 << EOF
                    //   ansible-playbook  ci-cd-files/docker-playbook.yml
                    //  exit
                    //  EOF
                    // '''
                }
            }
        }//CI Completed

      //   //CD will trigger
      //   stage("trigger application deploy job"){
      //     steps{
      //         build job: 'weshopify-platform-app-continous-deployment'
      //     }
      // }
    }
}
