# GreenTech IT Infrastructure Lab - Project Review Checklist

## Purpose

This checklist was created to review the GreenTech IT Infrastructure Lab from the perspective of a recruiter, hiring manager, or junior IT/cybersecurity interviewer.

The goal is to confirm that the project is clear, well documented, technically realistic, and easy to understand from GitHub.

---

## 1. Repository Structure Review

| Check | Status | Notes |
|---|---|---|
| README exists | Completed | Main project overview is available in `README.md`. |
| Folder structure is organized | Completed | Documentation is separated into clear folders. |
| Active Directory documentation exists | Completed | Stored in `active-directory/`. |
| Linux documentation exists | Completed | Stored in `linux-server/`. |
| Docker documentation exists | Completed | Stored in `docker-stack/`. |
| Backup and logging documentation exists | Completed | Stored in `backup-logging/`. |
| Security documentation exists | Completed | Stored in `security-hardening/`. |
| Final report exists | Completed | Stored in `final-report/`. |
| Screenshots are included | Completed | Stored in `screenshots/`. |

---

## 2. README Review

| Check | Status | Notes |
|---|---|---|
| Project purpose is clear | Completed | README explains the lab objective. |
| Technologies are listed | Completed | Windows Server, AD, Linux, Docker, Nginx, UFW, GitHub, etc. |
| Architecture is explained | Completed | README includes a text-based architecture diagram. |
| Documentation links are included | Completed | Links point to detailed markdown files. |
| Screenshots are referenced | Completed | README includes screenshot links. |
| Skills demonstrated are listed | Completed | Skills section is included. |
| Current status is explained | Completed | Completed and future improvements are listed. |

---

## 3. Technical Implementation Review

| Area | Status | Evidence |
|---|---|---|
| Windows Server installed | Completed | `GT-DC01` documented. |
| Active Directory domain created | Completed | Domain: `greentech.local`. |
| OU structure created | Completed | Users, Groups, Computers, Service Accounts, Domain Controllers. |
| Users and groups created | Completed | Department users and security groups documented. |
| File shares configured | Completed | HR, Finance, Sales, IT shares documented. |
| Windows client joined to domain | Completed | `GT-CLIENT01` validation documented. |
| Ubuntu Server installed | Completed | `GT-LINUX01` documented. |
| Static Linux IP configured | Completed | `192.168.56.30`. |
| SSH configured | Completed | SSH access documented. |
| UFW firewall enabled | Completed | Firewall screenshot included. |
| Docker installed | Completed | Docker validation documented. |
| Nginx container deployed | Completed | `greentech-nginx` documented. |
| Custom web page created | Completed | GreenTech Internal IT Portal documented. |
| Backup script created | Completed | Backup script documented. |
| Restore test completed | Completed | Restore validation documented. |
| Logging and monitoring checked | Completed | Linux and Docker logs documented. |
| Incident response plan created | Completed | Recovery scenarios documented. |

---

## 4. Screenshot Review

Screenshots included:

- Active Directory OU structure
- Active Directory users
- Active Directory groups
- Windows client domain validation
- Windows shared folder access
- Server IP configuration
- Client IP configuration
- Linux network validation
- Linux firewall status
- Docker installation validation
- Nginx container validation
- Custom GreenTech web page validation
- Backup script validation
- Backup restore validation
- Logging and monitoring validation

Result:

Screenshots provide practical validation evidence that the lab was actually configured and tested.

---

## 5. Employer-Facing Strengths

This project demonstrates several practical junior IT and cybersecurity skills:

- Building a lab from scratch
- Windows Server administration
- Active Directory setup
- Domain user and group management
- Access control using groups and permissions
- Windows client domain joining
- Linux server setup
- SSH administration
- Firewall hardening
- Docker deployment
- Nginx web hosting
- Backup scripting
- Restore testing
- Logging and monitoring
- Incident response planning
- Technical documentation
- Git and GitHub workflow

---

## 6. Realistic Troubleshooting Evidence

The project also included realistic troubleshooting:

- VirtualBox internal network configuration
- Windows client domain join
- Linux Netplan YAML errors
- SSH port forwarding through NAT
- Docker permission setup
- UFW firewall rules
- Backup restore validation

These troubleshooting steps add value because they show practical problem-solving, not only step-by-step installation.

---

## 7. Areas to Improve Before Final Submission

| Improvement | Priority | Notes |
|---|---|---|
| Check all README image links | High | Make sure screenshots display correctly on GitHub. |
| Remove or rename duplicate screenshots | Medium | Keep screenshot names clean and professional. |
| Review spelling and formatting | High | Make README and report easy to read. |
| Add final project summary | High | Useful for recruiters. |
| Add LinkedIn/CV wording | Completed | Stored in `final-report/cv-linkedin-summary.md`. |
| Consider adding Docker Compose later | Medium | Future improvement. |
| Consider adding GPO/password policy later | Medium | Future improvement. |
| Consider adding cron backup schedule later | Medium | Future improvement. |

---

## 8. Final Review Result

The GreenTech IT Infrastructure Lab is suitable as a junior IT / cybersecurity portfolio project.

The project is strong because it includes:

- Infrastructure setup
- Identity and access management
- Linux administration
- Containerization
- Security hardening
- Backup and restore
- Monitoring
- Incident response
- Documentation and screenshots

The project shows practical hands-on ability and can be discussed in job interviews.