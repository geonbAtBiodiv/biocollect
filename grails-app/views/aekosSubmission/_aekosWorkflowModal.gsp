<%--
  Created by IntelliJ IDEA.
  User: koh032
  Date: 11/05/2016
  Time: 2:05 PM
--%>

<style>

.aekosModal{
    width: 90%; /* desired relative width */
    min-height:80%;
    left: 5%; /* (100%-width)/2 */
    margin: auto auto auto auto; /* place center */}

.aekosModal .modal-body{overflow-y:scroll;max-height:none;position:absolute;top:50px;bottom:50px;right:0px;left:0px;}

.aekosModal .modal-footer {position: absolute;bottom: 0;right: 0;left: 0;}


</style>

<g:render template="/aekosSubmission/treeviewTemplate" />

<script type="text/html" id="aekosWorkflowModal">

<!-- Modal -->
%{--<div class="modal hide fade aekosModal validationEngineContainer" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"  data-bind="bootstrapShowModal:aekosModalView().show">--}%
<div class="modal fade aekosModal validationEngineContainer" id="aekosModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" >
    <div class="modal-dialog">
        <div class="modal-header">
            <button type="button" class="close" data-bind="click: hideModal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Dataset: <span data-bind="text: name"></span></h4>
        </div>

        <div class="modal-body" >

            <div class="aekosAlert" id='alert-placeholder'>
            </div>
            <br/>

            <ul  data-bind="attr: {id: 'ul_submission_info' }" class="nav nav-pills">
                <li data-bind="css: { active: selectedTab() == 'tab-1' }"><a data-bind="attr: {href: '#project-info', id: 'tab-1'}, click: selectTab" data-toggle="tab" >Project<br>Info</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-2' }"><a data-bind="attr: {href: '#dataset-info', id: 'tab-2', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Dataset<br>Description</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-3' }"><a data-bind="attr: {href: '#dataset-content', id: 'tab-3', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Dataset<br>Content</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-4' }"><a data-bind="attr: {href: '#location-dates', id: 'tab-4', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}, event: { shown: showMap}" >Study Location<br>and Dates</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-5' }"><a data-bind="attr: {href: '#species', id: 'tab-5', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Dataset<br>Species</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-6' }"><a data-bind="attr: {href: '#materials', id: 'tab-6', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Supplementary<br>Materials</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-7' }"><a data-bind="attr: {href: '#collection-methods', id: 'tab-7', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Data Collection<br>Methods</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-8' }"><a data-bind="attr: {href: '#contacts', id: 'tab-8', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Dataset Contact<br>and Author(s)</a></li>
                <li data-bind="css: { active: selectedTab() == 'tab-9' }"><a data-bind="attr: {href: '#management', id: 'tab-9', 'data-toggle': dataToggleVal()}, css:{disabled: !isValidationValid()}, click: function(data, event) {selectTab(data, event);}">Dataset Conditions<br>of Use and Management</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" data-bind="attr: {id: 'project-info' }">
                    <g:render template="/aekosSubmission/projectInfo" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'dataset-info' }" >
                    <g:render template="/aekosSubmission/datasetInfo" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'dataset-content' }">
                    <g:render template="/aekosSubmission/datasetContent" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'location-dates' }" >
                    <g:render template="/aekosSubmission/locationDates" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'species' }">
                    <g:render template="/aekosSubmission/species" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'materials' }">
                    <g:render template="/aekosSubmission/materials" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'collection-methods' }" >
                    <g:render template="/aekosSubmission/methods" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'contacts' }" >
                    <g:render template="/aekosSubmission/contacts" />
                </div>

                <div class="tab-pane" data-bind="attr: {id: 'management' }">
                    <g:render template="/aekosSubmission/management" />
                </div>

            </div>
        </div>


        <div class="modal-footer">
            <span class="alert alert-info" data-bind="visible: !isValidationValid()">Enable Submit/Next button by filling all mandatory fields on this page.</span>
            <button class="btn-primary btn btn-small block" data-bind="disable: !isValidationValid(), click: function() {submit();}"><i class="icon-white  icon-hdd" ></i>  Submit </button>
            <!-- ko if: (parseInt(selectedTab().slice(-1)) < 9) -->
            <button class="btn-primary btn btn-small block" data-bind="disable: !isValidationValid(), click: function() {selectNextTab('#' + nextTab())}">Next <i class="icon-white icon-chevron-right" ></i></button>
            <!-- /ko -->
        </div>

    </div>
</div>

</script>

<div id="aekosWorkflowDialog"></div>

<r:script>

    $(window).load(function () {
        $("div.modal.hide.fade.aekosModal").validationEngine();
    });

</r:script>
