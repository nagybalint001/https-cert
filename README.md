# Let's encrypt dns challenge in docker

Create wildcard HTTPS cert for your domain (the cert will contain two domains: the base one and the wildcard one).

Run the following command in powershell (set the domain and email variable according to your needs). You will be asked to set some DNS TXT records for your domain. At the end it will ask for a password to export the cert in pfx format.

```powershell
docker-compose build
$env:currentdir = $pwd.Path.ToLower(); $env:domain = "my.domain.com"; $env:email = "info@$($env:domain)"; docker-compose run certbot
```

After successfully running the command, the cert files will be in the out directory:
```
https-cert/
└── out/
    └── my.domain.com/
        └── 2021-12-23/
            ├── cert.pem
            ├── cert.pfx
            ├── fullchain.pem
            └── privkey.pem
```