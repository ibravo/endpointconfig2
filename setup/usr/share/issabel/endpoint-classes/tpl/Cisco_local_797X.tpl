<?xml version="1.0" encoding="UTF-8"?>
<device>
<fullConfig>true</fullConfig>
<deviceProtocol>SIP</deviceProtocol>

<sshUserId>cisco</sshUserId>
<sshPassword>cisco</sshPassword>

<devicePool>
	<dateTimeSetting>
		<dateTemplate>M-D-YYYYA</dateTemplate>
		<timeZone>Eastern Standard/Daylight Time</timeZone>
		<ntps>
			<ntp>
				<name>{{server_ip}}</name>
				<ntpMode>Unicast</ntpMode>
			</ntp>
		</ntps>
		</dateTimeSetting>

	<callManagerGroup>
		<members>
			<member priority="0">
				<callManager>
					<ports>
						<ethernetPhonePort>2000</ethernetPhonePort>
						<sipPort>5060</sipPort>
						<securedSipPort>5061</securedSipPort>
					</ports>
					<processNodeName>{{server_ip}}</processNodeName>
				</callManager>
			</member>
		</members>
	</callManagerGroup>
</devicePool>

<sipProfile>
	<sipProxies>
		<backupProxy></backupProxy>
		<backupProxyPort></backupProxyPort>
		<emergencyProxy></emergencyProxy>
		<emergencyProxyPort></emergencyProxyPort>
		<outboundProxy></outboundProxy>
		<outboundProxyPort></outboundProxyPort>
		<registerWithProxy>true</registerWithProxy>
	</sipProxies>

	<sipCallFeatures>
		<cnfJoinEnabled>true</cnfJoinEnabled>
		<callForwardURI>x-cisco-serviceuri-cfwdall</callForwardURI>
		<callPickupURI>x-cisco-serviceuri-pickup</callPickupURI>
		<callPickupListURI>x-cisco-serviceuri-opickup</callPickupListURI>
		<callPickupGroupURI>x-cisco-serviceuri-gpickup</callPickupGroupURI>
		<meetMeServiceURI>x-cisco-serviceuri-meetme</meetMeServiceURI>
		<abbreviatedDialURI>x-cisco-serviceuri-abbrdial</abbreviatedDialURI>
		<rfc2543Hold>false</rfc2543Hold>
		<callHoldRingback>1</callHoldRingback>
		<localCfwdEnable>true</localCfwdEnable>
		<semiAttendedTransfer>true</semiAttendedTransfer>
		<anonymousCallBlock>0</anonymousCallBlock>
		<callerIdBlocking>0</callerIdBlocking>
		<retainForwardInformation>false</retainForwardInformation>
		<dndControl>0</dndControl>
		<remoteCcEnable>true</remoteCcEnable>
	</sipCallFeatures>

	<sipStack>
		<sipInviteRetx>6</sipInviteRetx>
		<sipRetx>10</sipRetx>
		<timerInviteExpires>180</timerInviteExpires>
		<timerRegisterExpires>3600</timerRegisterExpires>
		<timerRegisterDelta>5</timerRegisterDelta>
		<timerKeepAliveExpires>120</timerKeepAliveExpires>
		<timerSubscribeExpires>120</timerSubscribeExpires>
		<timerSubscribeDelta>5</timerSubscribeDelta>
		<timerT1>500</timerT1>
		<timerT2>4000</timerT2>
		<maxRedirects>70</maxRedirects>
		<remotePartyID>true</remotePartyID>
		<userInfo>Phone</userInfo>
	</sipStack>

	<autoAnswerTimer>1</autoAnswerTimer>
	<autoAnswerAltBehavior>false</autoAnswerAltBehavior>
	<autoAnswerOverride>true</autoAnswerOverride>
	<transferOnhookEnabled>false</transferOnhookEnabled>
	<enableVad>false</enableVad>
	<preferredCodec>none</preferredCodec>
	<dtmfAvtPayload>101</dtmfAvtPayload>
	<dtmfDbLevel>3</dtmfDbLevel>
	<dtmfOutofBand>avt</dtmfOutofBand>
	<alwaysUsePrimeLine>false</alwaysUsePrimeLine>
	<alwaysUsePrimeLineVoiceMail>false</alwaysUsePrimeLineVoiceMail>
	<kpml>0</kpml>

	<natEnabled>false</natEnabled>
	<natReceivedProcessing>false</natReceivedProcessing>
	<natAddress></natAddress>

	<phoneLabel>CentroNia MD</phoneLabel>
	<stutterMsgWaiting>0</stutterMsgWaiting>
	<callStats>true</callStats>
	<offhookToFirstDigitTimer>15000</offhookToFirstDigitTimer>
	<silentPeriodBetweenCallWaitingBursts>10</silentPeriodBetweenCallWaitingBursts>
	<disableLocalSpeedDialConfig>false</disableLocalSpeedDialConfig>

	<startMediaPort>16384</startMediaPort>
	<stopMediaPort>20000</stopMediaPort>

	<sipLines>
	{{py:n = 1}}{{for extension in sip}}
  		<line button="{{n}}" lineindex="{{n}}">
			<featureID>9</featureID>
			<featureLabel>{{extension.extension}}</featureLabel>
			<proxy>USECALLMANAGER</proxy>
			<port>5060</port>
			<name>{{extension.extension}}</name>
			<displayName>{{extension.description}}</displayName>
			<autoAnswer>
	  			<autoAnswerEnabled>0</autoAnswerEnabled>
			</autoAnswer>
			<callWaiting>1</callWaiting>
			<authName>{{extension.account}}</authName>
			<authPassword>{{extension.secret}}</authPassword>
			<sharedLine>false</sharedLine>
			<messageWaitingLampPolicy>3</messageWaitingLampPolicy>
			<messageWaitingAMWI>0</messageWaitingAMWI>	
			<messagesNumber>*97</messagesNumber>
			<ringSettingIdle>4</ringSettingIdle>
			<ringSettingActive>5</ringSettingActive>
			<contact></contact>
			<forwardCallInfoDisplay>
				<callerName>true</callerName>
				<callerNumber>false</callerNumber>
				<redirectedNumber>false</redirectedNumber>
				<dialedNumber>true</dialedNumber>
			</forwardCallInfoDisplay>
		</line>
	{{py:n += 1}}{{endfor}}
	</sipLines>

	<voipControlPort>5060</voipControlPort>
	<dscpForAudio>184</dscpForAudio>
	<ringSettingBusyStationPolicy>0</ringSettingBusyStationPolicy>
	<dialTemplate>dialplan.xml</dialTemplate>

</sipProfile>

<commonProfile>
	<phonePassword></phonePassword>
	<backgroundImageAccess>true</backgroundImageAccess>
	<callLogBlfEnabled>2</callLogBlfEnabled>
</commonProfile>

<vendorConfig>
	<defaultWallpaperFile>IMAGE2.png</defaultWallpaperFile>
	<disableSpeaker>false</disableSpeaker>
	<disableSpeakerAndHeadset>false</disableSpeakerAndHeadset>
	<pcPort>0</pcPort>
	<settingsAccess>1</settingsAccess>
	<garp>0</garp>
	<voiceVlanAccess>0</voiceVlanAccess>
	<videoCapability>0</videoCapability>
	<autoSelectLineEnable>0</autoSelectLineEnable>
	<sshAccess>0</sshAccess>
	<sshPort>22</sshPort>
	<webAccess>0</webAccess>
	<daysDisplayNotActive>1,7</daysDisplayNotActive>
	<displayOnTime>08:00</displayOnTime>
	<displayOnDuration>10:00</displayOnDuration>
	<displayIdleTimeout>00:15</displayIdleTimeout>
	<spanToPCPort>1</spanToPCPort>
	<loggingDisplay>1</loggingDisplay>
	<loadServer></loadServer>
</vendorConfig>

<userLocale> 
	<name>America/Sao_Paulo</name> 
	<uid>1</uid> 
	<langCode>pt_BR</langCode> 
	<version>1.0.0.0-1</version> 
	<winCharSet>UTF-8</winCharSet> 
</userLocale> 

<networkLocale>America/Sao_Paulo</networkLocale>

<networkLocaleInfo>
	<name>America/Sao_Paulo</name>
	<version>5.0(2)</version>
</networkLocaleInfo>

<deviceSecurityMode>1</deviceSecurityMode>

<authenticationURL></authenticationURL>
<directoryURL></directoryURL>
<idleURL></idleURL>
<informationURL></informationURL>

<messagesURL></messagesURL>
<proxyServerURL></proxyServerURL>
<servicesURL></servicesURL>

<dscpForSCCPPhoneConfig>96</dscpForSCCPPhoneConfig>
<dscpForSCCPPhoneServices>0</dscpForSCCPPhoneServices>
<dscpForCm2Dvce>96</dscpForCm2Dvce>

<transportLayerProtocol>2</transportLayerProtocol>

<capfAuthMode>0</capfAuthMode>
<capfList>
	<capf>
	<phonePort>3804</phonePort>
	</capf>
</capfList>

<certHash></certHash>
<encrConfig>false</encrConfig>

</device>