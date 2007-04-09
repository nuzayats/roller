<%@ include file="/taglibs.jsp" %><%@ include file="/theme/header.jsp" %>

<%-- JavaScript for categories table --%> 
<script type="text/javascript">
<!-- 
function setChecked(val) 
{
    len = document.categoriesForm.elements.length;
    var i=0;
    for( i=0 ; i<len ; i++) 
    {
        document.categoriesForm.elements[i].checked=val;
    }
}
function onMove() 
{
    if ( confirm("Move selected categories?") ) 
    {
        document.categoriesForm.method.value = "moveSelected";
        document.categoriesForm.submit();
    }
}
//-->
</script>

<h1>
    <fmt:message key="categoriesForm.parent" />:&nbsp;
    <c:if test="${empty category}">
        <fmt:message key="categoriesForm.root" />
    </c:if>
    <c:if test="${!(empty category)}">
        <c:out value="${category.name}" />
    </c:if>
</h1>

<%-- Category path --%>

<p>
<b><fmt:message key="categoriesForm.path" /></b>:

<c:if test="${empty categoryPath}">
   /
   <roller:link page="/editor/categories.do">
       <roller:linkparam id="method" value="selectCategory" />
       <fmt:message key="categoriesForm.root" />
   </roller:link>
</c:if>

<c:if test="${!(empty categoryPath)}">
    <c:forEach var="category" items="${categoryPath}">
        /
        <roller:link page="/editor/categories.do">
            <roller:linkparam id="method" value="selectCategory" />
            <roller:linkparam 
                id="<%= RollerRequest.WEBLOGCATEGORYID_KEY %>" 
                name="category" property="id" />
            <c:out value="${category.name}" />
        </roller:link>
    </c:forEach>
    <br />
</c:if>
</p>

<%-- Form is a table of categories each with checkbox --%>

<html:form action="/editor/categories" method="post">
<input type="hidden" name="method" /> 
<html:hidden property="parentId" /> 

<p>
<%-- Add Category link --%>
<img src='<c:url value="/images/FolderNew16.png"/>' border="0"alt="icon" />
<roller:link page="/editor/categoryEdit.do">
    <roller:linkparam id="<%= RollerRequest.PARENTID_KEY %>"
         name="category" property="id" />
    <fmt:message key="categoriesForm.addCategory" />
</roller:link>
</p>

<p>
<%-- Select-all button --%>
<input type="button" value="<fmt:message key='categoriesForm.checkAll' />" 
   onclick="setChecked(1)" /></input>

<%-- Select-none button --%>
<input type="button" value="<fmt:message key='categoriesForm.checkNone' />" 
   onclick="setChecked(0)" /></input>

</td>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%-- Move-selected button --%>
<input type="button" value="<fmt:message key='categoriesForm.move' />"   
   onclick="onMove()"/></input>

<%-- Move-to combo-box --%>
<html:select property="moveToCategoryId" size="1">
    <html:options collection="allCategories" 
        property="id" labelProperty="path"/>
</html:select>
</p>

<table class="rollertable">

    <tr class="rollertable">
        <th class="rollertable" width="5%">&nbsp;</td>
        <th class="rollertable" width="5%">&nbsp;</td>
        <th class="rollertable" width="30%"><fmt:message key="categoriesForm.name" /></td>
        <th class="rollertable" width="45%"><fmt:message key="categoriesForm.description" /></td>
        <th class="rollertable" width="5%"><fmt:message key="categoriesForm.edit" /></td>
        <th class="rollertable" width="5%"><fmt:message key="categoriesForm.remove" /></td>
    </tr>

    <%-- Categories --%>
    <c:forEach var="category" items="${categories}" >
        <roller:row oddStyleClass="rollertable_odd" evenStyleClass="rollertable_even">

            <td class="rollertable">
                <html:multibox property="selectedCategories">
                    <c:out value="${category.id}" />
                </html:multibox>
            </td>


            <td class="rollertable" align="center"><img src='<c:url value="/images/Folder16.png"/>' alt="icon" /></td>
            
            <td class="rollertable">
               <roller:link page="/editor/categories.do">
                   <roller:linkparam id="method" value="selectCategory" />
                   <roller:linkparam 
                       id="<%= RollerRequest.WEBLOGCATEGORYID_KEY %>" 
                       name="category" property="id" />
                   <str:truncateNicely lower="15" upper="20" ><c:out value="${category.name}" /></str:truncateNicely>
               </roller:link>
            </td>

            <td class="rollertable">
                <str:truncateNicely lower="30" upper="35" ><c:out value="${category.description}" /></str:truncateNicely>
            </td>

            <td class="rollertable" align="center">
               <roller:link page="/editor/categoryEdit.do">
                   <roller:linkparam 
                       id="<%= RollerRequest.WEBLOGCATEGORYID_KEY %>" 
                       name="category" property="id" />
                   <img src='<c:url value="/images/Edit16.png"/>' border="0" alt="icon" />
               </roller:link>
            </td>

            <td class="rollertable" align="center">
               <roller:link page="/editor/categoryDelete.do">
                   <roller:linkparam 
	                   id="<%= RollerRequest.WEBLOGCATEGORYID_KEY %>" 
	                   name="category" property="id" />
                   <roller:linkparam 
	                   id="method" value="deleteSelected" />
                   <img src='<c:url value="/images/Remove16.gif"/>' border="0" alt="icon" />
               </roller:link>
            </td>

        </roller:row>
    </c:forEach>

</table>

</html:form>

<%@ include file="/theme/footer.jsp" %>