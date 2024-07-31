FROM jenkins/jenkins:lts-jdk17

# Switch to root user to install additional packages
USER root

# Update package lists and install lsb-release
RUN apt-get update && apt-get install -y lsb-release

# Add Docker’s official GPG key
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

# Set up the Docker repository
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update package lists and install Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli
RUN groupadd -g 1001 docker && usermod -aG docker jenkins
# RUN chown root:docker /var/run/docker.sock
USER jenkins


##################### Removed auto installation of plugins ###############################

# # Copy plugin installation script and plugins.txt
# COPY plugins.sh /usr/local/bin/plugins.sh
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# # Run plugin installation script
# RUN /usr/local/bin/plugins.sh

# Switch back to the jenkins user
# USER jenkins
# docker run --hostname=8786f8fd1cf1 --user=jenkins --env=PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=LANG=C.UTF-8 --env=JENKINS_HOME=/var/jenkins_home --env=JENKINS_SLAVE_AGENT_PORT=50000 --env=REF=/usr/share/jenkins/ref --env=JENKINS_VERSION=2.452.3 --env=JENKINS_UC=https://updates.jenkins.io --env=JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental --env=JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals --env=COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log --env=JAVA_HOME=/opt/java/openjdk --volume=/var/run/docker.sock:/var/run/docker.sock:rw --volume=/var/jenkins_home --network=infra_default -p 50000:50000 -p 8080:8080 --restart=no --label='com.docker.compose.config-hash=ba10b5bac50d68c5ede49ffae55c10309730551ffeaa82299bfdc7e3e61afb86' --label='com.docker.compose.container-number=1' --label='com.docker.compose.depends_on=mysql:service_started:false' --label='com.docker.compose.image=sha256:0ba31a374e9c2b9c8db94a55323a33a3ab738ef8c45cdce16b82717c072b4e57' --label='com.docker.compose.oneoff=False' --label='com.docker.compose.project=infra' --label='com.docker.compose.project.config_files=/mnt/c/Users/musta/OneDrive/Desktop/infra/infra/docker-compose.yml' --label='com.docker.compose.project.working_dir=/mnt/c/Users/musta/OneDrive/Desktop/infra/infra' --label='com.docker.compose.service=jenkins' --label='com.docker.compose.version=2.27.1' --label='desktop.docker.io/wsl-distro=Ubuntu' --label='org.opencontainers.image.description=The Jenkins Continuous Integration and Delivery server' --label='org.opencontainers.image.licenses=MIT' --label='org.opencontainers.image.revision=9fba54713675c711138675b4aaaff6268c14d31a' --label='org.opencontainers.image.source=https://github.com/jenkinsci/docker' --label='org.opencontainers.image.title=Official Jenkins Docker image' --label='org.opencontainers.image.url=https://www.jenkins.io/' --label='org.opencontainers.image.vendor=Jenkins project' --label='org.opencontainers.image.version=2.452.3' --runtime=runc -d infra-jenkins