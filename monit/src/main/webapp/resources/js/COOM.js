//[oyh] Chrome browser should clear cache after update



function reload()
{
	console.log("reload");
	location.reload();
}


function html_port(port)
{
var str =`
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
<td><label>Port : <input type="text" name="port" disabled style="height:30px;width:200px" value=` + port +  ` ></label></td>
<td><button onclick="reload();"  name="action" value="reload"  style="height:30px;width:100px">Reload</button></td>
</table>`;
return str;
}


function html_topmenu(flag)
{
var str = `
<div style="max-width:900;margin:auto;">
<table border="0" align="center" cellpadding="2" cellspacing="1" BGCOLOR="#ffffff" >
  <td><img src="/resources/img/Web_home_Header.jpg" style="width:100%;" /></td>
</table>
`;

var carr = ['#cccccc', '#cccccc', '#cccccc', '#cccccc', '#cccccc']; 
carr[flag] = '#ffffff';

var menu = "";
{
menu =`
<table height="60" border="0" align="center" cellpadding="2" cellspacing="0" BGCOLOR="#599cc6">
  <tr>
<form action="dashboard" method="post">
    <td><input type="text" name="sp" style="width:10%;visibility:hidden" /></td>
    <td><button name="action" style="height:30px;width:100%;border:solid 0px;background-color:#599cc6;color:`+ carr[0] +`;font-size:15px;font-family:verdana;text-shadow:1px 1px #000000" value="TAB_DASHBOARD" type="submit">DASHBOARD</button></td>
</form>
<form action="stmonitor" method="post">
    <td><input type="text" name="sp" style="width:10%;visibility:hidden" /></td>
    <td><button name="action" style="height:30px;width:100%;border:solid 0px;background-color:#599cc6;color:`+ carr[1] +`;font-size:15px;font-family:verdana;text-shadow:1px 1px #000000" value="TAB_MONITOR" type="submit">MONITOR</button></td>
</form>
<form action="history" method="post">
    <td><input type="text" name="sp" style="width:10%;visibility:hidden" /></td>
    <td><button name="action" style="height:30px;width:100%;border:solid 0px;background-color:#599cc6;color:`+ carr[2] +`;font-size:15px;font-family:verdana;text-shadow:1px 1px #000000" value="TAB_HISTORY" type="submit">History</button></td>
</form>
<form action="read" method="post">
    <td><input type="text" name="sp" style="width:100%;visibility:hidden" /></td>
    <td><button name="action" style="height:30px;width:100%;border:solid 0px;background-color:#599cc6;color:`+ carr[3] +`;font-size:15px;font-family:verdana;text-shadow:1px 1px #000000" value="TAB_READ" type="submit">READ</button></td>
</form>
<form action="write" method="post">
    <td><input type="text" name="sp" style="width:10%;visibility:hidden" /></td>
    <td><button name="action" style="height:30px;width:100%;border:solid 0px;background-color:#599cc6;color:`+ carr[4] +`;font-size:15px;font-family:verdana;text-shadow:1px 1px #000000" value="TAB_WRITE" type="submit">WRITE</button></td>
</form>
    <td><input type="text" name="sp" style="width:100%;visibility:hidden" /></td>
  </tr>
</table>
</div>
`;
}
	return str + menu;
}



function isDeviceID(id)
{
	if(id.length == 16 && id.indexOf("ND") == 0)
		return true;
	else
		return false;
}
function getPort()
{
	return smdinfo['PORT'];
}



