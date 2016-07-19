
<div class="row-fluid">
    <div id="pt-selectors" class="well">
        <div id="filters-hidden">
            <div id="pt-searchControls" class="row-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <h5><g:message code="g.sortBy"></g:message></h5>

                        <div class="row-fluid">
                            <div class="btn-group span12" data-toggle="buttons-radio" id="pt-sort">
                                <button type="button" class="btn  btn-small btn-info active"
                                        data-value="nameSort">Name</button>
                                <button type="button" class="btn  btn-small btn-info"
                                        data-value="_score">Relevance</button>
                                <button type="button" class="btn  btn-small btn-info"
                                        data-value="organisationSort">Organisation</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <h5><g:message code="g.projects"/>&nbsp;<g:message code="g.perPage"/></h5>

                        <div class="row-fluid">
                            <div class="btn-group span12" data-toggle="buttons-radio" id="pt-per-page">
                                <button type="button" class="btn  btn-small btn-info active" data-value="20">20</button>
                                <button type="button" class="btn  btn-small btn-info" data-value="50">50</button>
                                <button type="button" class="btn  btn-small btn-info" data-value="100">100</button>
                                <button type="button" class="btn  btn-small btn-info" data-value="500">500</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <h5><g:message code="project.search.status"/></h5>

                        <div class="row-fluid">
                            <div class="btn-group span6" data-toggle="buttons-checkbox" id="pt-status">
                                <g:each var="level" in="${['active', 'completed']}">
                                    <button type="button" class="btn  btn-small btn-info"
                                            data-value="${level}">${level.capitalize()} <i
                                            class="toggleIndicator icon-remove icon-white"></i></button>
                                </g:each>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <g:if test="${!hubConfig?.defaultFacetQuery.contains('isEcoScience:true')}">

                            <h5><g:message code="project.search.difficulty"/></h5>

                            <div class="row-fluid">
                                <div>
                                    <div class="btn-group span6" data-toggle="buttons-radio" id="pt-search-difficulty">
                                        <g:each var="level" in="${['easy', 'medium', 'hard']}">
                                            <button type="button" class="btn  btn-small btn-info"
                                                    data-value="${level}">${level.capitalize()} <i
                                                    class="toggleIndicator icon-remove icon-white"></i></button>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                        </g:if>
                        <g:else>
                            <h5><g:message code="project.search.programName"/></h5>

                            <div class="row-fluid">
                                <div class="span12">
                                    <g:if test="${associatedPrograms}">
                                        <g:each var="program" in="${associatedPrograms}">
                                            <button type="button" class="btn btn-small btn-info" data-value="${program}"
                                                    data-toggle="button"
                                                    id="pt-search-program-${program.name.replace(' ', '-')}">${program.name.capitalize()} <i
                                                    class="toggleIndicator icon-remove icon-white"></i></button>
                                        </g:each>
                                    </g:if>
                                </div>
                            </div>
                        </g:else>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12" id="pt-tags">
                        <g:if test="${controllerName != 'organisation'}">
                            <h5>Tags</h5>

                            <div class="row-fluid">
                                <div class="span12">
                                    <g:if test="${!hubConfig?.defaultFacetQuery.contains('isEcoScience:true')}">
                                        <button id="pt-search-diy" type="button" class="btn btn-info btn-small"
                                                data-toggle="button"><g:message code="project.tag.diy"/> <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button id="pt-search-noCost" type="button" class="btn btn-info btn-small"
                                                data-toggle="button"><g:message code="project.tag.noCost"/> <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button id="pt-search-teach" type="button" class="btn btn-info btn-small"
                                                data-toggle="button"><g:message code="project.tag.teach"/> <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button id="pt-search-children" type="button" class="btn btn-info btn-small"
                                                data-toggle="button"><g:message code="project.tag.children"/> <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                    </g:if>
                                    <button id="pt-search-mobile" type="button" class="btn btn-info btn-small"
                                            data-toggle="button"><g:message code="g.mobileApps"/> <i
                                            class="toggleIndicator icon-remove icon-white"></i></button>
                                    <button id="pt-search-dataToAla" type="button" class="btn btn-info btn-small"
                                            data-toggle="button"><g:message code="g.dataToAla"/> <i
                                            class="toggleIndicator icon-remove icon-white"></i></button>
                                </div>
                            </div>
                        </g:if>
                        <g:elseif test="${controllerName == 'organisation'}">
                            <h5><g:message code="project.search.projecttype"/></h5>

                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="btn-group span6" data-toggle="buttons-checkbox"
                                         id="pt-search-projecttype">
                                        <button type="button" class="btn  btn-small btn-info active"
                                                data-toggle="button"
                                                data-value="citizenScience">Citizen Science <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button type="button" class="btn  btn-small btn-info active"
                                                data-toggle="button"
                                                data-value="works">NRM <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button type="button" class="btn  btn-small btn-info active"
                                                data-toggle="button"
                                                data-value="biologicalScience">Biological Science <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button type="button" class="btn  btn-small btn-info active"
                                                data-toggle="button"
                                                data-value="merit">MERIT <i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                    </div>
                                </div>
                            </div>
                        </g:elseif>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <h5><g:message code="project.search.geoFilter"/></h5>
                    <div class="row-fluid">
                        <!-- Trigger the modal with a button -->
                        <button id="filterByRegionButton" type="button" class="btn btn-small btn-info margin-bottom-2" data-toggle="modal" data-target="#mapModal"><g:message code="project.search.mapToggle"/></button>

                        <!-- Modal -->
                        %{--inline style is required as the first time so the modal does not block other components on screen--}%
                        %{--Looks like a bug in Bootstrap--}%
                        <div id="mapModal" class="modal fade" role="dialog" style="display: none; ">
                            <div class="modal-dialog ">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"><g:message code="project.search.mapToggle"/></h4>
                                    </div>
                                    <div class="modal-body">
                                        <m:map id="mapFilter" width="100%"/>
                                    </div>
                                    <div class="modal-footer">
                                        <button id="clearFilterByRegionButton" type="button" class="btn btn-small btn-info"
                                                 ><g:message code="project.search.mapClear"/><i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                        <button type="button" class="btn btn-primary btn-small" data-dismiss="modal"><g:message code="project.search.mapClose"/><i
                                                class="toggleIndicator icon-remove icon-white"></i></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="pull-right" id="pt-control-buttons">
                    <button id="pt-reset" class="btn btn-primary" ><i class="icon-white icon-remove"></i> <g:message
                            code="g.resetSearch"/></button>
                </div>
            </div>
        </div>
    </div>
</div>