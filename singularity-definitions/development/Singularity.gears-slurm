BootStrap: debootstrap
OSVersion: xenial
MirrorURL: http://archive.ubuntu.com/ubuntu/
Include: bash

### #GEARS Lab SLURM submitter for Pronghorn.  
# TODO: Allow USER and HOSTNAME for SLURM to be modified

%post
  locale-gen en_US.UTF-8
  sed -i 's/main/main restricted universe/g' /etc/apt/sources.list
  echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | tee -a /etc/apt/sources.list
  gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
  gpg -a --export E084DAB9 | apt-key add -
  apt-get update

  # Install R, openmpi, misc. utilities:
  apt-get install -y libopenblas-dev r-base-core r-base-dev libcurl4-openssl-dev libopenmpi-dev openmpi-bin openmpi-common openmpi-doc openssh-client openssh-server libssh-dev wget vim git nano git cmake gfortran g++ curl wget python autoconf bzip2 libtool libtool-bin libxml2-dev 

# sacct     sattach  scancel   sgather  sprio    srun    strigger
# sacctmgr  sbatch   scontrol  sinfo    squeue   sshare  sview
# salloc    sbcast   sdiag     smap     sreport  sstat
  
  alias sacct="ssh $USER@$HOSTNAME sacct"
  alias sacctmgr="ssh $USER@$HOSTNAME sacctmgr"
  alias salloc="ssh $USER@$HOSTNAME salloc"
  alias sattach="ssh $USER@$HOSTNAME sattach"
  alias sbatch="ssh $USER@$HOSTNAME sbatch"
  alias scontrol="ssh $USER@$HOSTNAME scontrol"
  alias sdiag="ssh $USER@$HOSTNAME sdiag"
  alias sgather="ssh $USER@$HOSTNAME sgather"
  alias sinfo="ssh $USER@$HOSTNAME sinfo"
  alias smap="ssh $USER@$HOSTNAME smap"	
  alias sprio="ssh $USER@$HOSTNAME sprio"
  alias squeue="ssh $USER@$HOSTNAME squeue"
  alias sreport="ssh $USER@$HOSTNAME sreport"
  alias srun="ssh $USER@$HOSTNAME srun"
  alias sshare="ssh $USER@$HOSTNAME sshare"           
  alias sstat="ssh $USER@$HOSTNAME sstat"           
  alias strigger="ssh $USER@$HOSTNAME strigger"           
  alias sview="ssh $USER@$HOSTNAME sview"           
      