## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK diagram](Diagrams/ELK.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible-playbook file may be used to install only certain pieces of it, such as [Filebeat](https://github.com/apal-cyber/project_13/blob/b9571a961c72b4d3a2cfc199535d1df5166d68b4/Ansible/filebeat-playbook.yml).

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure, in addition to restricting access to the network. Moreover, a load balancer can detect and drop denial-of-service (DDoS) traffic before it gets to a website.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web1     | Server   | 10.0.0.5   | Linux            |
| Web2     | Server   | 10.0.0.7   | Linux            |
| ELK      | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 138.91.172.192 or any other whitelisted IP addresses.

Machines within the network can only be accessed by docker container within Jump Box.
- 10.0.0.4 

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses |
|-------------|---------------------|----------------------|
| Jump Box    |     NO              | 138.91.172.192       |
| WEB 1       |     NO              | 10.0.0.4             |
| WEB 2       |     NO              | 10.0.0.4             |
| ELK         |     NO              | 10.0.0.4             |
|Load Balancer|     YES             | ANY                  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because multiple machines can be configured at once.


The playbook implements the following tasks:

- Configure Elk VM with Docker.
- Install docker.io.
- Install python3-pip.
- Install Docker module.
- Increase virtual memory.
- Download and launch a docker elk container.
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker-ps](Diagrams/Elk_container.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- web 1 (10.0.0.5) and Web 2 (10.0.0.7).

We have installed the following Beats on these machines:
- Metricbeat and Filebeat.

These Beats allow us to collect the following information from each machine:
- Metricbeat periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

- Filebeat is for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.



### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the playbook file to /etc/ansible.
- Update the host file to include:
 [webservers]
 10.0.0.5 ansible_python_interpreter=/usr/bin/python3
 10.0.0.6 ansible_python_interpreter=/usr/bin/python3
 [elk]
 10.1.0.4 ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to Kibana server (13.64.61.54:5601) to check that the installation worked as expected.
