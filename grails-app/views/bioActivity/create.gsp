<%@ page import="grails.converters.JSON; org.codehaus.groovy.grails.web.json.JSONArray" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <g:if test="${printView}">
        <meta name="layout" content="nrmPrint"/>
        <title>Print | ${activity.type} | Bio Collect</title>
    </g:if>
    <g:else>
        <meta name="layout" content="${mobile ? 'mobile' : hubConfig.skin}"/>
        <title>Create | ${activity.type} | Bio Collect</title>
    </g:else>

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jstimezonedetect/1.0.4/jstz.min.js"></script>
    <r:script disposition="head">
    var fcConfig = {
        serverUrl: "${grailsApplication.config.grails.serverURL}",
        activityUpdateUrl: "${createLink(controller: 'activity', action: 'ajaxUpdate')}",
        activityDeleteUrl: "${createLink(controller: 'activity', action: 'ajaxDelete')}",
        documentUpdateUrl: "${g.createLink(controller:"proxy", action:"documentUpdate")}",
        documentDeleteUrl: "${g.createLink(controller:"proxy", action:"deleteDocument")}",
        projectViewUrl: "${createLink(controller: 'project', action: 'index')}/",
        siteViewUrl: "${createLink(controller: 'site', action: 'index')}/",
        bieUrl: "${grailsApplication.config.bie.baseURL}",
        speciesProfileUrl: "${createLink(controller: 'proxy', action: 'speciesProfile')}",
        imageLocation:"${resource(dir: '/images')}",
        speciesSearch: "${createLink(controller: 'search', action: 'searchSpecies', params: [id: pActivity.projectActivityId, limit: 10])}",
        bioActivityUpdate: "${createLink(controller: 'bioActivity', action: 'ajaxUpdate', params: [pActivityId: pActivity.projectActivityId])}",
        bioActivityView: "${createLink(controller: 'bioActivity', action: 'index')}/",
        activityDataTableUploadUrl: "${createLink(controller:'bioActivity', action:'extractDataFromExcelTemplate', params:[pActivityId:pActivity.projectActivityId])}",
        getSingleSpeciesUrl : "${createLink(controller: 'projectActivity', action: 'getSingleSpecies', params: [id: pActivity.projectActivityId])}",
        getOutputSpeciesIdUrl : "${createLink(controller: 'output', action: 'getOutputSpeciesIdentifier')}",
        getGuidForOutputSpeciesUrl : "${createLink(controller: 'record', action: 'getGuidForOutputSpeciesIdentifier')}"
        },
        here = document.location.href;
    </r:script>
    <script src="${grailsApplication.config.google.maps.url}" async defer></script>
    <r:require
            modules="knockout,jqueryValidationEngine,datepicker,timepicker,jQueryFileUploadUI,activity,attachDocuments,amplify,imageViewer,projectActivityInfo,species,map,leaflet_google_base,responsiveTableStacked,viewmodels"/>
</head>

<body>
    <g:render template="createEditActivityBody"></g:render>
</body>
</html>