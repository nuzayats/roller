<%@ include file="/taglibs.jsp" %><%@ include file="/theme/header.jsp" %>


<h3>
<jsp:useBean id="pageForm" scope="session" 
	class="org.roller.presentation.forms.PageForm"/>
Remove Page [<jsp:getProperty name="pageForm" property="name"/>]
</h3>

<p>Are you sure you want to remove this page?</p>
<p>
Page name = [<jsp:getProperty name="pageForm" property="name"/>]<br />
Page id = [<jsp:getProperty name="pageForm" property="id"/>]
</p>

<table>
<tr>
	<td>
		<html:form action="/editor/page" method="post">
			<html:submit value="Yes"/></input>
			<html:hidden property="method" value="remove"/></input>
			<html:hidden property="id" /></input>
		</html:form>
	</td>
	<td>
		<html:form action="/editor/page" method="post">
			<html:hidden name="user" property="userName" /></input>
			<html:submit value="No"/></input>
			<html:hidden property="method" value="cancel"/></input>
		</html:form>
	</td>
</tr>
</table>

<%@ include file="/theme/footer.jsp" %>
