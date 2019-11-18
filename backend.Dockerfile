FROM node:12.13-stretch

RUN apt update && apt upgrade -y -qq
RUN git clone https://github.com/magnumripper/JohnTheRipper /opt/jtr/JohnTheRipper && \
  cd /opt/jtr/JohnTheRipper/src && ./configure && make
RUN echo "#Password" >> /opt/jtr/wordlist.txt && \
  echo "blackbox.local\Administrator:500:AAD3B435B51404EEAAD3B435B51404EE:AB987CB169FB0FA623417DEBC88B9750:Disabled=False,Expired=False,PasswordNeverExpires=True,PasswordNotRequired=False,PasswordLastChanged=201910211025,LastLogonTimestamp=160101010000,IsAdministrator=True,IsDomainAdmin=True,IsEnterpriseAdmin=True::" >> /opt/jtr/passwd.txt
