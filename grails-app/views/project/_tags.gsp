<span class="project-tag" data-bind="visible:isDIY() && projectType() == 'survey' "><g:message code="facets.tags.isDIY"/></span>
<span class="project-tag" data-bind="visible:isSuitableForChildren() && projectType() == 'survey'"><g:message code="facets.tags.isSuitableForChildren"/></span>
<span class="project-tag" data-bind="visible:isHome() && projectType() == 'survey' "><g:message code="facets.tags.isHome"/></span>
<span class="project-tag" data-bind="visible:noCost() && projectType() == 'survey'"><g:message code="facets.tags.noCost"/></span>
<span class="project-tag" data-bind="visible:hasParticipantCost() && projectType() == 'survey'"><g:message code="facets.tags.hasParticipantCost"/></span>
<span class="project-tag" data-bind="visible:hasTeachingMaterials() && projectType() == 'survey'"><g:message code="facets.tags.hasTeachingMaterials"/></span>
<span class="project-tag" data-bind="visible:mobileApp() && projectType() == 'survey'"><g:message code="facets.tags.mobileApp"/></span>
<span class="project-tag" data-bind="visible:difficulty() == 'Easy' && projectType() == 'survey'"><g:message code="project.tag.difficultyEasy"/></span>
<span class="project-tag" data-bind="visible:difficulty() == 'Medium' && projectType() == 'survey'"><g:message code="project.tag.difficultyMedium"/></span>
<span class="project-tag" data-bind="visible:difficulty() == 'Hard' && projectType() == 'survey'"><g:message code="project.tag.difficultyHard"/></span>
<span class="project-tag" data-bind="visible:transients.scienceTypeDisplay(),text:transients.scienceTypeDisplay()"></span>
<span class="project-tag" data-bind="visible:transients.ecoScienceTypeDisplay(),text:transients.ecoScienceTypeDisplay()"></span>
