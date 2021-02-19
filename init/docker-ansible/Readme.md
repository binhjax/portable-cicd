

sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf


/run/systemd/resolve/resolv.conf
nameserver 8.8.8.8


 docker build -t vnpay-ansible ./
