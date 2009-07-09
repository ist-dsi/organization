<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<h2><bean:message key="label.persons.manage" bundle="ORGANIZATION_RESOURCES"/></h2>

<html:messages id="message" message="true" bundle="ORGANIZATION_RESOURCES">
	<span class="error0"> <bean:write name="message" /> </span>
	<br />
</html:messages>

<html:form action="/organization.do?method=searchPerson">
	<bean:message key="label.name" bundle="ORGANIZATION_RESOURCES" />: <html:text property="name" />
	<html:submit><bean:message key="label.search" bundle="ORGANIZATION_RESOURCES" /></html:submit>
</html:form>
<br />
<br />

<html:link action="/organization.do?method=prepareCreatePerson">
	<bean:message key="label.create.person" bundle="ORGANIZATION_RESOURCES" />
</html:link>

<logic:present name="persons">
	<logic:notEmpty name="persons">
		<fr:view name="persons" schema="organization.domain.Person.view.short">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle2" />
				<fr:property name="columnClasses" value=",,tderror" />
				
				<fr:property name="linkFormat(viewParty)" value="/organization.do?method=viewParty&amp;partyOid=${OID}" />
				<fr:property name="key(viewParty)" value="label.view"/>
				<fr:property name="bundle(viewParty)" value="ORGANIZATION_RESOURCES"/>
				<fr:property name="order(viewParty)" value="1"/>
				</fr:layout>
		</fr:view>
	</logic:notEmpty>
	
	<logic:empty name="persons">
		<strong><em><bean:message key="label.no.persons" bundle="ORGANIZATION_RESOURCES"/></em></strong>
	</logic:empty>
</logic:present>