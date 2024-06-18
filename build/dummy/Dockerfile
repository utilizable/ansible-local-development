FROM debian:bookworm

RUN apt-get update

# Create the SSH directory and set up necessary files
RUN mkdir /var/run/sshd

# Install SSH server
RUN apt-get install -y ssh

# Set root password (change 'yourpassword' to your desired password)
ARG TARGET_PASS 
RUN echo "root:${TARGET_PASS}" | chpasswd

# Allow root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D", "-e" ]
