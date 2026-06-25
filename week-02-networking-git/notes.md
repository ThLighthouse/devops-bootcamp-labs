# WEEK 2 - Environment Variables, Networking, SSH, Git

## 1. Environment Variables

### Commands
- `printenv` — display all environment variables
- `printenv USER` — display a specific environment variable
- `unset VARIABLE` — delete the variable
- `source ~/.bashrc` — reload shell configuration and apply new variables

### Key concepts
- Environment variables are stored as `KEY=value` pairs.
- They provide configuration to programs without changing source code.
- By convention, variable names use UPPERCASE letters.
- `~/.bashrc` contains user-specific shell settings loaded for interactive shells.
- `/etc/environment` contains global environment variables for all users.

### Question
- Не совсем очевидно, для чего вообще нужны переменные окружения.
  - Ответ: environment variables позволяют передавать настройки программам извне, без изменения кода.

---

## 2. Networking

### Commands
- `ip a` / `ip addr` — show IP addresses of network interfaces
- `ip route` — show routing table and default gateway
- `ss -tuln` — show active listening connections
- `nslookup <domain>` / `dig <domain>` — resolve DNS names
- `ping <host>` — test host availability with ICMP
- `curl <url>` — test HTTP/HTTPS services
- `nc -zv <host> <port>` — check if a TCP port is open

### Key concepts
- LAN — collection of devices connected in a local network.
- Each device has a unique IP address.
- Switch connects devices within the LAN.
- Router connects the LAN to other networks (WAN) and provides a gateway.
- Subnet is a logical subdivision of a network.
- CIDR is Classless Inter-Domain Routing.
- NAT (Network Address Translation) allows private network IPs to use a public IP.
- Firewall is a set of rules that controls network traffic.
- DNS translates domain names to IP addresses.

### DNS structure
- `com` — top-level domain (TLD)
- `mycompany` — domain name
- `api` — subdomain

### Troubleshooting flow
1. Is there an IP address? — `ip a`
   - If not, there may be an issue with the interface, DHCP, or network configuration.
2. Is the gateway configured? — `ip route`
   - If no default route appears, the host cannot reach external networks.
3. Does raw network connectivity work? — `ping 8.8.8.8`
   - If ping fails, the issue may be network connectivity or firewall rules.
4. Does DNS work? — `nslookup google.com` or `ping google.com`
   - If ping by IP works but DNS lookup fails, the issue is DNS-related.
5. Does the service work? — `curl http://localhost:3000` or `nc -zv localhost 3000`
   - If the port is closed, the problem may be the application, firewall, or bind address.

### Notes
- Subdomains are used to separate applications or services within a domain.

---

## 3. SSH

### Commands
- `ssh root@server_ip` — connect to a remote host
- `ssh-keygen -t rsa` — generate a new SSH key pair
- `scp` — secure copy files and directories between hosts
- `nc -zv server_ip 22` — check if SSH port 22 is open
- `ssh -v user@server_ip` — connect with verbose debug output

### SSH files
- `~/.ssh/known_hosts` — remote host fingerprints stored by SSH
- `~/.ssh/authorized_keys` — public keys allowed to connect to the user account

### Key concepts
- Authentication methods:
  1. username and password
  2. SSH key pair
- Private key is secret and stored securely on the client.
- Public key can be shared with a remote server.
- SSH authentication happens after the TCP connection is established.

---

## 4. Git

### Commands
- `git init` — initialize a repository
- `git clone <url>` — clone a repository locally
- `git stash` — temporarily save uncommitted changes
- `git stash pop` — restore stashed changes
- `git revert <commit>` — create a new commit that undoes an earlier commit
- `git reset <commit>` — reset HEAD to a previous commit (`--soft` keeps changes staged, `--hard` discards them)
- `git merge` — combine branches
- `ssh -T git@github.com` — verify GitHub SSH access
- `git remote add origin <repo_URL>` — add remote repository
- `git push -u origin main` — push local branch to remote
- `git rm -r --cached <file>` — stop tracking a file without deleting it locally
- `git grep -n "<text>"` — search text in tracked files

### Key concepts
- A merge conflict occurs when Git cannot automatically combine changes from different branches.
- Best practice: pull and push frequently to avoid large, conflicting merges.
- `git revert` is a safe way to undo a bad commit in shared history.
- `git reset --hard` can remove commits locally, but should be used carefully.

### Workflow overview
Working directory → staging area → local repository → remote repository
- `git add` adds changes to the staging area
- `git commit` saves changes to the local repository
- `git push` sends commits to the remote repository
- `git pull` updates the local repository from remote

### Branching practices
- Create a branch for each feature or fix.
- `main` is typically the production-ready branch.
- `develop` can be used for ongoing work, but some teams prefer trunk-based development with only `main`.

### DevOps context
- Git is essential for tracking infrastructure as code, CI/CD pipelines, and deployment automation.
- Repositories store configuration, scripts, manifests, and pipeline definitions.

### Question
- Как происходит откат по коммиту и зачем он нужен?
  - `git revert <commit>` создает новый коммит, который отменяет изменения из указанного коммита. Это безопасно для совместной работы.
  - `git reset --hard HEAD~1` откатывает локальную ветку на один коммит и удаляет изменения из рабочего дерева.



