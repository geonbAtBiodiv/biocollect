<%@ page import="grails.converters.JSON; org.grails.web.json.JSONArray" contentType="text/html;charset=UTF-8" %>
<g:set var="mapService" bean="mapService"></g:set>
<html>
<head>
    <meta name="layout" content="bs4"/>
    <title>${project?.name?.encodeAsHTML()} | <g:message code="g.projects"/> | <g:message code="g.biocollect"/></title>
    <meta name="breadcrumbParent1" content="${createLink(uri: '/')},Home"/>
    <meta name="breadcrumbParent2" content="${createLink(controller: 'project', action: 'index')}/${project.projectId},${project.name?.encodeAsHTML()}"/>
    <meta name="breadcrumb" content="Edit"/>

    <asset:script type="text/javascript">
    var fcConfig = {
        <g:applyCodec encodeAs="none">
        intersectService: "${createLink(controller: 'proxy', action: 'intersect')}",
        featuresService: "${createLink(controller: 'proxy', action: 'features')}",
        featureService: "${createLink(controller: 'proxy', action: 'feature')}",
        spatialWms: "${grailsApplication.config.spatial.geoserverUrl}",
        layersStyle: "${createLink(controller: 'regions', action: 'layersStyle')}",
        projectUpdateUrl: "${createLink(action:'ajaxUpdate')}",
        organisationCreateUrl: "${createLink(controller: 'organisation', action: 'create')}",
        organisationLinkBaseUrl: "${createLink(controller: 'organisation', action: 'index')}",
        organisationSearchUrl: "${createLink(controller: 'organisation', action: 'search')}",
        // organisationSearchUrl: "${createLink(controller: 'organisation', action: 'searchMyOrg')}",
        spatialService: '${createLink(controller:'proxy',action:'feature')}',
        geocodeUrl: "${grailsApplication.config.google.geocode.url}",
        imageLocation:"${asset.assetPath(src:'')}",
        siteMetaDataUrl: "${createLink(controller:'site', action:'locationMetadataForPoint')}",
        returnTo: "${createLink(controller: 'project', action: 'index', id: project?.projectId)}",
        scienceTypes: ${scienceTypes as grails.converters.JSON},
        lowerCaseScienceType: ${grailsApplication.config.biocollect.scienceType.collect{ it?.toLowerCase() } as grails.converters.JSON},
        ecoScienceTypes: ${ecoScienceTypes as grails.converters.JSON},
        lowerCaseEcoScienceType: ${grailsApplication.config.biocollect.ecoScienceType.collect{ it?.toLowerCase() } as grails.converters.JSON},
        countriesUrl: "${createLink(controller: 'project', action: 'getCountries')}",
        uNRegionsUrl: "${createLink(controller: 'project', action: 'getUNRegions')}",
        dataCollectionWhiteListUrl: "${createLink(controller: 'project', action: 'getDataCollectionWhiteList')}",
        allBaseLayers: ${grailsApplication.config.map.baseLayers as grails.converters.JSON},
        allOverlays: ${grailsApplication.config.map.overlays as grails.converters.JSON},
        mapLayersConfig: ${mapService.getMapLayersConfig(project, pActivity) as JSON},
        leafletAssetURL: "${assetPath(src: 'webjars/leaflet/0.7.7/dist/images')}"
        </g:applyCodec>
        },
        here = window.location.href;

    </asset:script>
    <asset:stylesheet src="project-create-manifest.css"/>
    <asset:javascript src="common-bs4.js"/>
    <asset:javascript src="organisation.js"/>
    <asset:javascript src="projects-manifest.js"/>
    <script src="${grailsApplication.config.google.maps.url}" async defer></script>
</head>

<body>
<div class="container-fluid validationEngineContainer" id="validation-container">
<form id="projectDetails" class="form-horizontal">
    <g:render template="details" model="${pageScope.variables}"/>
    <div class="row">
        <div class="col-12 btn-space">
            <button type="button" id="save" class="btn btn-primary-dark"><i class="fas fa-hdd"></i> <g:message code="g.save"/></button>
            <button type="button" id="cancel" class="btn btn-dark"><i class="far fa-times-circle"></i> <g:message code="g.cancel"/></button>
        </div>
    </div>
</form>

</div>
<asset:script type="text/javascript">
$(function(){

    var PROJECT_DATA_KEY="CreateProjectSavedData";

    var programsModel = <fc:modelAsJavascript model="${programs}"/>;
    var project = <fc:modelAsJavascript model="${project?:[:]}"/>;

    <g:if test="${params.returning}">
        var storedProject = amplify.store(PROJECT_DATA_KEY);
        if(storedProject !== undefined) {
            project = JSON.parse(storedProject);
            amplify.store(PROJECT_DATA_KEY, null);
        }
    </g:if>

    var viewModel =  new CreateEditProjectViewModel(project, true, {storageKey:PROJECT_DATA_KEY});
    viewModel.loadPrograms(programsModel);

    $('#projectDetails').validationEngine();
    $('.helphover').popover({animation: true, trigger:'hover'});

    ko.applyBindings(viewModel, document.getElementById("projectDetails"));

    $('#cancel').on('click',function () {
        document.location.href = "${createLink(action: 'index', id: project?.projectId)}";
    });
    $('#save').on('click',function () {
    if(viewModel.transients.kindOfProject() == 'citizenScience' && !viewModel.transients.isDataEntryValid()){
        bootbox.dialog({message:"Use of this system for data collection is not available for non-biodiversity related projects." +
            " Press continue to turn data collection feature off. Otherwise, press cancel to modify the form."}, [{
              label: "Continue",
              className: "btn-primary",
              callback: function() {
                viewModel.isExternal(true);
                $('#save').click()
              }
            },{
                label: "Cancel",
                className: "btn-alert",
                callback: function() {
                    $('html, body').animate({
                        scrollTop: $("#scienceTypeControlGroup").offset().top
                    }, 2000);
              }
            }]);
    } else {
        if ($('#projectDetails').validationEngine('validate')) {
            var projectErrors = viewModel.transients.projectHasErrors()
                if (!projectErrors) {
                    viewModel.saveWithErrorDetection(function(data) {
                        var projectId = "${project?.projectId}" || data.projectId;
                        document.location.href = "${createLink(action: 'index')}/" + projectId;
                    },function(data) {
                        var responseText = data.responseText || 'An error occurred while saving project.';
                        bootbox.alert(responseText);
                    });
                } else {
                    bootbox.alert(projectErrors);
                }
        }
    }
    });
 });
</asset:script>

</body>
</html>