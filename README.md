# sublime
sublime for ubuntu14.04  ppa 

1. 安装打包需要的软件环境  
`# sudo apt-get install packaging-dev build-essential dh-make`

2. 创建自己的GPG key  
`# gpg --gen-key`  
将key的公共部分上传到key server，这样全世界的开发者就可以根据你的key来识别你的信息和文件  
`gpg --send-keys --keyserver keyserver.ubuntu.com <pub KEY ID>`

3. 创建你的ssh key  
`ssh-keygen -t rsa`

4. 创建pbuilder  
系统版本是Ubuntu 14.04 (代号 trusty)，所以执行如下命令  
`pbuilder-dist trusty create`

5. 创建Launchpad账户  
```
上传GPG key到Launchpad，通过如下指令查看自己的GPG key：
gpg --fingerprint
运行如下指令提交你的key到Ubuntu keyserver：
gpg --keyserver keyserver.ubuntu.com --send-keys <pub KEY ID>
```

登录OpenPGP keys  
```
将Key fingerprint拷贝到文本框，点击 “Import Key”.
  如果导入成功，系统会发送一封邮件到你的邮箱，用来对导入的key进行验证
  其中邮件的内容为不可读的,需要编译,内容类似于：
  -----BEGIN PGP MESSAGE-----
  Version: GnuPG v1.4.3 (GNU/Linux)
  hQIOA0THhKozD+K5EAf9F3PcOL2iU6onH2YsvB6IKDXNxbK0NBVy6ppxcNq8hoTe
  cuHvzWLFfh1ehhSNe1V6xpuFnt5sJoeA4qEEOxez3HmY80tKIKMPLyhC/8JiSIW9
  fwuxj4C0F6pdyrpvGbQAzfPEFk/P1AtIHXm4WLXduhBT7YEpmUk/I4A/KlSrKoiP
  J5vBtbroUyp2jvIhDUmY7ToU+ifrDe3+VP1ZzSEJzOOXec9oPbcbvf5NptXA7Hbp
  S0ElBAcLjKpAu7VKotCwFZIsVXDHT/mxf2qm88bGIrlXS5uTzvmyhQps1KmyNiCz
  I0i5kSVvHZWyVZ+8FrROLqYAqqnEIMg9hUnbFAervgf/YiYs0xxWLYf9e14eoMZA
  ranGT72q/JHmBNBYenOijaquFNi1TH5J8Udtt2RfdyRUlmGilxRvtIYL8gpnuNpS
  +GHOoBWUN2f4nawaDeqgrf6Nt3qQWWLO4iJPgieejFP2FP6zkLme1t7dXo+z1ary
  EZuxSLtKIWkOFEZ8Gcn02hBgOhJZucnkF6BmVW9dr1C4QEAmGM631uqfsp5PapAn
  yjHbEU1L2R9i7vPtJNRr6ubFLWg1Yhfv63ByxSx/WQHMMqlrbL+moXBGED3L2hM8
  7FP9eapBRgmS+Bda9ArcGMUElTOkWoUYIOPyLOYmo15LvbxHOVaXjn7+fDgr2S1J
  R9LArwHycmdKKelRww+ZvylHIfq8xy10atRQIYawchh9A1myXD1TlWbrrIkodQJF
  iEpO2i1LKvqwZHOx3szT4hF+44tNFzQIL1j+zF5Hrt2WOTnS5WXGgGRtfEd8F7fN
  khQZOAdhwrnlY+yknruC8Y8Jm8vM57+KnPgBfvxuxzLX1XFTfTZCHXeUmwwu3mga
  m+6WzckeBGBDHKK6GqwFoOAykTwjyqOZaty7DPHeoINc0tLMVr9Ks64DScf8bgh4
  MkNonA0YhMQbkmwRc33APw441+/iLw5gqndQdX44kKqC71dG6LqanAOjD29Xj3JV
  ZBsjg95Jrx7Sx+i/V0PUeaU9QjCT0Q1jEy1Bcs8NYtTJnpG+4oHYJ0pyiGxIquQH
  V9E+hW6Qehx5DbsIXEvfeaBBHOfAHHOhUH14WK4bsJWm8wZ50XiYBZrNFOqzsm13
  2STcY4VIoJp3Uw2qNyvZXQUhpndlfgQGO14CMSadzDn6Vts=
  =hTe6
  -----END PGP MESSAGE-----
  将邮件中这些内容拷贝到一个文件中，例如：file.txt，然后执行如下命令：
  gpg --decrypt file.txt
  此时会提示你输入之前设置的key密码，验证成功后，会有如下提示：
  Please go here to finish adding the key to your Launchpad account:
  [[https://launchpad.net/token/bP56TDKg8HXQbBs6LsN0]]
  点击该链接，选择continue , 完成GPG key 上传
```

6. 上传 ssh key  
```
打开~/.ssh/id_rsa.pub文件,将其中的内容拷贝到帐号的add ssh key文本框中，选择导入后完成上传 
```

7. 配置 Bazzar  
```
(一个版本控制软件,可以储存代码)
首先告诉Bazzar你是谁:
bzr whoami "shurrik <vissky1@163.com>"
bzr launchpad-login ixjx（我的Launchpad账户id）
```

8. 配置你的shell环境变量  
```
打开~/.bashrc 文件,在文件开头加上如下内容
export DEBFULLNAME="shurrik"
export DEBEMAIL="vissky1@163.com"
然后执行:$source ~/.bashrc
```

9. 下载源码

10. 开始打包  
```
a. 根据模板生成配置文件
   bzr dh-make sublime 3.0 sublime3.0.tar.gz
b. 修改配置文件
c. 将修改提交到打包分支
   bzr commit -m "Initial commit of Debian packaging."
d. 在当前环境中编译软件包
   bzr builddeb -- -us -uc
e. 检测软件包是否存在bug
   lintian sublime3.0*.dsc
f. 给软件包签名(需要输入之前设置的密码)
   debuild -S -k<pub key ID>
```

12. 上传软件包  
```
a. 编辑~/.dput.cf
  通过上面的一系列流程，我们生成了一组经过数字签名的文件，最后需要做的是将这些文件上传到ppa官方的ftp，
  此时会用到一个叫dput的软件，要使用dput，首先要编辑文件~/.dput.cf，没有就创建.
  在这个文件里面定义要上传的Launchpad账号。我的~/.dput.cf文件内容如下：
  [sublime3.0]
  fqdn = ppa.launchpad.net
  method = ftp
  incoming = ~ixjx/ubuntu/sublime
  login = anonymous
  allow_unsigned_uploads = 0
  
b. 执行上传
  dput ppa:ixjx/sublime sublime3.0_source.changes
  上传成功后会收到一封ppa发来的邮件，内容如下：
  Accepted:
  ***
  You are receiving this email because you are the uploader of the above
  PPA package.
  接下来就静待官方编译吧~
  编译完成后，就可以通过ppa源进行安装了
```
