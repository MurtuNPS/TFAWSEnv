<powershell>
Set-DnsClientServerAddress -InterfaceIndex 3 -ServerAddresses ("127.0.0.1","172.29.0.2")
Remove-DnsServerForwarder -IPAddress 172.28.0.2 -Force
Add-DnsServerForwarder -IPAddress 172.29.0.2

Remove-DnsServerZone -Name "ec2.eu-west-2.amazonaws.com" -Force
Remove-DnsServerZone -Name "ec2messages.eu-west-2.amazonaws.com" -Force
Remove-DnsServerZone -Name "s3.eu-west-2.amazonaws.com" -Force
Remove-DnsServerZone -Name "ssm.eu-west-2.amazonaws.com" -Force
Remove-DnsServerZone -Name "ssmmessages.eu-west-2.amazonaws.com" -Force

Add-DnsServerConditionalForwarderZone -MasterServers "172.29.0.2" -Name "ec2.eu-west-2.amazonaws.com" -ReplicationScope Forest
Add-DnsServerConditionalForwarderZone -MasterServers "172.29.0.2" -Name "ec2messages.eu-west-2.amazonaws.com" -ReplicationScope Forest
Add-DnsServerConditionalForwarderZone -MasterServers "172.29.0.2" -Name "s3.eu-west-2.amazonaws.com" -ReplicationScope Forest
Add-DnsServerConditionalForwarderZone -MasterServers "172.29.0.2" -Name "ssm.eu-west-2.amazonaws.com" -ReplicationScope Forest
Add-DnsServerConditionalForwarderZone -MasterServers "172.29.0.2" -Name "ssmmessages.eu-west-2.amazonaws.com" -ReplicationScope Forest

$DNSZone = "SSPP.local" 

Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_test" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_CSP-i" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_External_APIs" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "mockIAM" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_dmz_PSN-A" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_dmz" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_post_auth" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_PSN-A_Whiteboard" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_WhiteBoard" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_test" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "web_Interfaces" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-apa" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-asm" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-bus" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-cen" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-com" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-csp-w" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-cus" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-dom" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-fra" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-geo" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-map" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-mir" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-mir-rs" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-not" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-not-pf" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-pol" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-pol-m" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-pvq" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-rad" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-sec" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-sec-pf" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-sod" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-txt" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-udd" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-udd-pf" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-udd_tip" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-uni" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-uni-gpa" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-pol-test" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "Apache_Poleflow" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-pol-pf" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-sod-pf" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "athenawebhelp_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "cdn_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "custody_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-tsr" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-tsw" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gem_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gemcvlists_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gemdocument_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-ggs" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gemimageservlet_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gemlogin_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-sod" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "gemtimeservlet_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "con-com" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "geowebcache_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "poleui_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "SGrid" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "shared_web" -RRType "A" -Force
Remove-DnsServerResourceRecord -ZoneName $DNSZone -Name "uniface_web" -RRType "A" -Force

Add-DnsServerResourceRecordA -Name "web_test"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.220" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_CSP-i"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.221" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_External_APIs"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.222" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "mockIAM"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.223" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_dmz_PSN-A"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.224" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_dmz"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.225" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_post_auth"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.226" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_PSN-A_Whiteboard"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.227" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_WhiteBoard"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.228" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_test"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.220" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "web_Interfaces"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.1.230" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-apa"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.2.110" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-asm"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.10" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-bus"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.11" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-cen"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.12" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-com"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.13" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-csp-w"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.14" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-cus"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.15" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-dom"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.16" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-fra"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.17" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-geo"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.18" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-map"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.19" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-mir"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.20" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-mir-rs"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.21" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-not"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.22" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-not-pf"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.23" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-pol"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.24" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-pol-m"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.25" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-pvq"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.26" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-rad"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.27" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-sec"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.28" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-sec-pf"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.29" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-sod"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.30" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-txt"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.32" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-udd"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.201" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-udd-pf"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.35" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-udd_tip"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.34" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-uni"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.36" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-uni-gpa"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.37" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-pol-test"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.38" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "Apache_Poleflow"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.39" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-pol-pf"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.40" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-sod-pf"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.43" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "athenawebhelp_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.44" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "cdn_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.45" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "custody_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.46" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-tsr"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.47" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-tsw"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.48" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gem_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.49" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gemcvlists_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.50" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gemdocument_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.51" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-ggs"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.52" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gemimageservlet_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.54" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gemlogin_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.55" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-sod"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.30" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "gemtimeservlet_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.57" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "con-com"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.13" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "geowebcache_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.59" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "poleui_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.60" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "SGrid"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.62" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "shared_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.63" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "uniface_web"-ZoneName $DNSZone -AllowUpdateAny -IPv4Address "172.29.4.64" -TimeToLive 01:00:00

dnscmd /zonedelete "1.28.172.in-addr.arpa" /dsdel -f
dnscmd /zonedelete "2.28.172.in-addr.arpa" /dsdel -f
dnscmd /zonedelete "3.28.172.in-addr.arpa" /dsdel -f
dnscmd /zonedelete "4.28.172.in-addr.arpa" /dsdel -f

dnscmd /ZoneAdd "1.29.172.in-addr.arpa" /DsPrimary
dnscmd /ZoneAdd "2.29.172.in-addr.arpa" /DsPrimary
dnscmd /ZoneAdd "3.29.172.in-addr.arpa" /DsPrimary
dnscmd /ZoneAdd "4.29.172.in-addr.arpa" /DsPrimary

Rename-Computer -NewName "SSPP-AD-DC" -Force -Restart

</powershell>