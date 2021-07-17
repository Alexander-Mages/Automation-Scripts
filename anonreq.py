from burp import IBurpExtender
from burp import IBurpExtenderCallbacks
from burp import IHttpService
from burp import IHttpRequestResponse
from burp import IHttpListener

HOST = "host.com"
NUMREP = 2

class BurpExtender(IBurpExtender, IHttpListener, IHttpService, IHttpRequestResponse):
	def registerExtenderCallbacks( self, callbacks):
		callbacks.setExtensionName("AnonReq")
		self._helpers = callbacks.getHelpers()
		callbacks.registerHttplistener(self)


		def processHttpMessage(self, toolFlag, messageIsRequest, messageInfo):
			if not messageIsRequest:
				return

			httpService = messageInfo.getHttpService()
			if (HOST == httpService.getHost()):
				messageInfo.setHttpService(self._helpers.buildHttpService(HOST,httpService.getPort(), httpService.getProtocol()))
			request = IHttpRequestResponse.getRequest()
			for i in range(NUMREP):
				IHttpRequestResponse.MakeHttpRequest(httpService, request)
