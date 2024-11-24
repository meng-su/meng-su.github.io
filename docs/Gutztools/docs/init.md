---
title: Installation
date: 2024-09-20 18:11:23
permalink: /pages/6024be/
categories:
  - Gutztools
  - docs
tags:
  - Documentions
author: 
  name: Gutzaria
  link: https://github.com/Gutzaria

# sidebar: false
article: false
# comment: false
editLink: false
---

To install the Gutztools, you first need to clone the Gutztools from github:
```
git clone git@github.com:Gutzaria/Gutztools.git
```

We recommend to use anaconda to manage the python enviroment. To install the package, you may need to create a clean enviroment:

```
conda create -n Gutzaria python==3.10.13
```

After creating the enviroment, you need to install scipy and numpy first:
```
pip install numpy
pip install scipy
```

Then you can run the installation script:
```
python setup.py install
python setup.py build
```

To check the installation, you can 
```
python3 -c "import Gutztools; print(Gutztools.__version__)"
```

If it showed the right version of Gutztools, the installation is sucessfully. 

