var oArgs = WScript.Arguments;

if (oArgs.length == 0)
{
    WScript.Echo ("Usage : cscript xslt.js xml xsl");
    WScript.Quit();
}
xmlFile = oArgs(0) + ".xml";
xslFile = oArgs(1) + ".xsl";

var xsl = new ActiveXObject("MSXML2.DOMDOCUMENT.6.0");
var xml = new ActiveXObject("MSXML2.DOMDocument.6.0");
xml.validateOnParse = false;
xml.async = false;
xml.load(xmlFile);

if (xml.parseError.errorCode != 0)
    WScript.Echo ("XML Parse Error : " + xml.parseError.reason);

xsl.async = false;
xsl.load(xslFile);

if (xsl.parseError.errorCode != 0)
    WScript.Echo ("XSL Parse Error : " + xsl.parseError.reason);

try
{
	var html = xml.transformNode(xsl.documentElement);
    WScript.Echo (html);

	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var file = fso.CreateTextFile("index.html",true,true);
	file.Write(html);
	file.Close();
}
catch(err)
{
    WScript.Echo ("Transformation Error : " + err.number + "*" + err.description);
}

