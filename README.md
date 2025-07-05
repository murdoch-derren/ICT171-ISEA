# ICT171_BRDG
## Lab 1
First, a new Github account was created with a new repository (this one) for documentation purposes.
<img width="940" alt="1 - github repo initial commit" src="https://github.com/user-attachments/assets/b01f9061-28f1-408e-b639-70a8bd541dae" />

VMware Workstation Pro was installed along with a Ubuntu 24.04.02 LTS Server VM for the purposes of the lab.
<img width="959" alt="5 - post installation" src="https://github.com/user-attachments/assets/bfe80db3-e970-4107-be41-7582ffc2c5a4" />
<img width="667" alt="25 - post reboot" src="https://github.com/user-attachments/assets/7b673876-2488-4e5c-8c97-3be344bd856e" />

### CLI Familiarisation

The `top` command on the left shows a dynamic list of processes currently running on the system, while the `ps -e` command on the right shows a static list of processes running on the system.

<img width="647" alt="top vs ps -e" src="https://github.com/user-attachments/assets/62456529-99cd-480c-8db2-d8dfb068db65" />

`lsusb` lists the USB devices currently connected to the system.

![image](https://github.com/user-attachments/assets/0d1e5c9b-9ecf-4315-9490-61966bee1c8e)

`lspci` lists the PCI buses and devices currently connected to the system and their PCI bus, device, and function number of the PCI device.

![image](https://github.com/user-attachments/assets/bffca522-9047-43eb-a51a-6191c771c233)

`cat /proc/cpuinfo` lists the CPU of the system along with the number of cores. Increasing the VM cores increases the number of cores shown by this command. 

![image](https://github.com/user-attachments/assets/331316d5-0715-40e9-be03-be7cf5291d3f)

Building from source is more involved than getting the application from an app store or through `apt`, but in a sense can be more secure if person building the executable is able to review and vet the code before running it. Building from source is also very useful for developers since the code can be tweaked before building. 

Installing `openssh-server` with `apt`: 

<img width="652" alt="image" src="https://github.com/user-attachments/assets/336aa0af-53e6-4439-b924-77177c811551" />

Checking IP of VM with `ip a`: 

<img width="485" alt="image" src="https://github.com/user-attachments/assets/ab8d137e-359e-4dc7-b5c6-823c63e37684" />

Enabling of `ufw` firewall and allowing access to SSH. 

![image](https://github.com/user-attachments/assets/6bfe300e-a30f-46c9-af4e-f5c1a9087228)

SSH into VM from host machine: 

![image](https://github.com/user-attachments/assets/e1ff846c-611e-4c7c-adb9-c5b81eaad7c8)

Bulk downloading the top 10 books from Gutenberg - collect links into a text file on the server.

![image](https://github.com/user-attachments/assets/03a6ba11-a7e1-4e66-bb21-80f187306692)

```
mkdir books
cd books
cat ../booklist | xargs wget
```

![image](https://github.com/user-attachments/assets/95126658-47e9-4d3e-9bac-60a19c86278c)

Compress all of them and use the host computer to download them through `scp`: 

```
tar cjvf books.tar.bz2 books/
```

![image](https://github.com/user-attachments/assets/83599641-f52b-4763-b012-394dbc3a68c1)

On host computer: 

```
scp derren@192.168.xx.xx:books.tar.bz2 ./desktop
```

![image](https://github.com/user-attachments/assets/b8178ae0-2c78-4da5-8042-8b41904045cb)

## Lab 2 - TCO Calculation

Assumptions: 
1. All costs in USD 
2. Both printers within the same brand
3. Printer paper to be the same, multipurpose paper for both inkjets and laserjets
4. Two stacks of printer paper (1000 sheets total) to be used every month, i.e. 33 pages per day regardless of weekdays or weekends
6. Both printers to be turned on 24 hours per day, 7 days a week over a 5 year period, with the printer being active 40 hours per week. Remaining time to be on standby
7. Servicing costs to be included within the purchase (warranty services over 5 years)

Selected materials: 
1. Entry level printer - [HP Envy 6155e AIO Printer](https://www.hp.com/us-en/shop/pdp/hp-envy-6155e-all-in-one-printer) @ $149.99
2. Enterprise level printer - [HP Color LaserJet Pro MFP Wireless Printer](https://www.hp.com/us-en/shop/pdp/hp-color-laserjet-pro-mfp-4301fdw-printer) @ $629.00
3. Paper - [HP Multipurpose Paper (500 sheets)](https://www.hp.com/us-en/shop/pdp/hp-multipurpose-paper-500-sht-letter-85-x-11-in) @ $10.99
4. Cartridge (entry level printer) - [HP 68 Tri-color Original Ink Cartridge](https://www.hp.com/us-en/shop/pdp/hp-68-tri-color-original-ink-cartridge) @ $24.99 per 120 pages
5. Toner (enterprise printer) - uses CMYK, total per ~1900 pages is about $505.96:

    a. Magenta - [HP 210A Magenta Original Toner](https://www.hp.com/us-en/shop/pdp/hp-210a-magenta-original-laserjet-toner-cartridge) @ $131.99 per 1800 pages

    b. Cyan - [HP 210A Cyan Original Toner](https://www.hp.com/us-en/shop/pdp/hp-210a-cyan-original-laserjet-toner-cartridge) @ $131.99 per 1800 pages

    c. Yellow - [HP 210A Yellow Original Toner](https://www.hp.com/us-en/shop/pdp/hp-210a-yellow-original-laserjet-toner-cartridge) @ $131.99 per 1800 pages

    d. Black - [HP 210A Black Original Toner](https://www.hp.com/us-en/shop/pdp/hp-210a-black-original-laserjet-toner-cartridge) @ $109.99 per 2000 pages

[Link to TCO Calculation (Google Sheets)](https://docs.google.com/spreadsheets/d/1d8-g6-2SBrAAydVy7lcLdUa6933p5Q2tsStrWfljlNQ/edit?usp=sharing)

Reflections: 
1. Based on TCO the entry level printer is more cost effective.
2. However, the cost per year of the enterprise printer is only $1000 more than the entry level printer.
3. The enterprise printer is also likely to be a lot more resilient than the entry level printer given the amount of pages printed per month thus reducing printer downtime.
4. The recommendation in this case for heavy duty printing would be to go for the enterprise level printer.

## Lab 2 - Spinning Up Cloud VM on AWS

Instance: 
![image](https://github.com/user-attachments/assets/22e3cdf3-e593-4cb6-a654-b364ef578fb1)

SSH to instance with private key: 
![image](https://github.com/user-attachments/assets/dba9628c-ebfc-472b-a652-39dd0d05a0b0)

Security group: 
![image](https://github.com/user-attachments/assets/aec23eba-808f-4022-80a1-4c8200642b5a)

Accessing apache web server: 
![image](https://github.com/user-attachments/assets/82061d6a-d988-4a42-88f8-cd03b58c27c6)

## Lab 2 - Scripting

Bash scripting: 

<img width="428" alt="bash resource monitoring" src="https://github.com/user-attachments/assets/9697c007-97df-40fa-adaa-fc5600d766c1" />

<img width="599" alt="bash resource monitoring sample run" src="https://github.com/user-attachments/assets/15c56dc4-452a-48a7-a5a8-21079bd49cb4" />

PowerShell scripting: 

<img width="405" alt="pwsh compression" src="https://github.com/user-attachments/assets/ab2b42a6-38d5-4e0c-b01b-9d7351099ada" />

Extra for Powershell: 

![image](https://github.com/user-attachments/assets/cff80b5e-78ac-42b0-9155-b80b32088891)

Regex: 
```bash
log_line='111.111.111.111 - - [29/Jun/2025:16:24:00 +0800] "GET /api/v1 HTTP/2.0" 200 408 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"'
regex='^([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) ([^ ]+) ([^ ]+) \[([^]]+)\] \"([A-Z]+) ([^\"]+) (HTTP\/[0-9.]+)\" ([0-9]{3}) ([0-9]+) \"([^\"]*)\" \"(.*)\"$'


if [[ $log_line =~ $regex ]]; then
    echo "IP: ${BASH_REMATCH[1]}"
    echo "Remote User: ${BASH_REMATCH[3]}"
    echo "Timestamp: ${BASH_REMATCH[4]}"
    echo "HTTP Method: ${BASH_REMATCH[5]}"
    echo "Path: ${BASH_REMATCH[6]}"
    echo "HTTP Version: ${BASH_REMATCH[7]}"
    echo "HTTP Response: ${BASH_REMATCH[8]}"
    echo "Bytes: ${BASH_REMATCH[9]}"
    echo "Referrer: ${BASH_REMATCH[10]}"
    echo "User Agent: ${BASH_REMATCH[11]}"
else
    echo "No match..."
fi
```

Note: done on personal AWS server

![image](https://github.com/user-attachments/assets/0a6f64d4-2c2b-44a5-b174-1c786b854fed)

# Lab 3 - DNS

Creation of new security group: 

![image](https://github.com/user-attachments/assets/22d763d1-c00b-4ebd-9e51-f7e2c674e083)

Creation of new EC2 instance, attaching the new security group: 

![image](https://github.com/user-attachments/assets/42bfd468-ab34-44c6-8f83-3bcd09139406)

Using IONOS as domain name provider since it's cheap: 

![image](https://github.com/user-attachments/assets/4fd15835-c6a7-47e8-9d69-a3b24ff699fe)

Registering a new domain - ict171-lab.com

![image](https://github.com/user-attachments/assets/f9a4148e-a2b6-4a73-af9a-549a1cdb2f72)

Instance details: 

![image](https://github.com/user-attachments/assets/44afd3d5-bc10-4395-b6a9-4710c83d2baa)

Edit A record to point to AWS instance: 

![image](https://github.com/user-attachments/assets/392c20e6-b594-429b-b61a-32e61df5098b)

DNS propagation: 

![image](https://github.com/user-attachments/assets/4de69d81-04e3-492f-ae77-007c8aa775a4)

Able to access server through DNS name: 

![image](https://github.com/user-attachments/assets/68c5c0e0-c00a-4aa7-bf3f-7163b9badc46)

![image](https://github.com/user-attachments/assets/b3f0ca9e-864f-462e-a035-143360c736c2)

Certbot: 

![image](https://github.com/user-attachments/assets/9f447ec1-e926-42fe-b9bd-99b72bbf8bee)

Certificate request and enabling SSL:

![image](https://github.com/user-attachments/assets/3827d50a-b35f-4639-8828-e4f0803aea14)

Testing with openssl s_client -connect: 

![image](https://github.com/user-attachments/assets/0c1615e8-b740-4a0a-98a5-d4f3a2d94e27)

Certificate details (from browser): 

![image](https://github.com/user-attachments/assets/ebdc5a82-a5d9-4e6b-b159-5606234850d9)

Auto renewal cron file: 

![image](https://github.com/user-attachments/assets/83536849-a8e2-4635-ac12-550ba59372d8)

Contents of cron file: 

![image](https://github.com/user-attachments/assets/a6ca1c59-37f0-4be5-a8dd-51cc000527ed)

Adding a subdomain to point to another host (personal server): 

![image](https://github.com/user-attachments/assets/cc74e226-4a12-4ea5-9619-edab08764ae5)

Dig to verify propagation: 

![image](https://github.com/user-attachments/assets/e8dca609-8c91-4589-944d-52df9749243e)

Accessing the site (the site already has an SSL certificate so an SSL mismatch warning will be presented): 

![image](https://github.com/user-attachments/assets/65d592df-4a09-428b-8e5a-d470924a9a93)

![image](https://github.com/user-attachments/assets/b2dec7a8-a7f5-439d-80bf-cde342baed69)

# Lab 4 - More Scripting

Enhanced script
