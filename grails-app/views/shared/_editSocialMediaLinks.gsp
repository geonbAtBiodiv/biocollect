<div class="form-group row">
    <label class="col-form-label col-sm-3"><g:message code="g.socialMedia" />:<fc:iconHelp><g:message code="g.socialMedia.help" args="[entity]"/></fc:iconHelp></label>
    <div class="col-sm-9">
        <table class="table mb-0 align-middle">
            <tbody data-bind="foreach:transients.socialMedia">
            <tr>
                <td><img data-bind="attr:{alt:name,title:name,src:logo('${imageUrl}')}"/></td>
                <td><input class="w-100" type="url" data-bind="value:link.url"
                           data-validation-engine="validate[required,custom[url]]"/ placeholder="<g:message code="organisation.social.website.placeholder"/>"></td>
                <td><a href="#" data-bind="click:remove" title="<g:message code="g.remove"/>"><i class="fas fa-minus"></i></a></td>
            </tr>
            </tbody>
            <tfoot data-bind="visible:transients.socialMediaUnspecified().length > 0">
            <tr><td class="p-0" colspan="3">
                <select class="form-control" id="addSocialMedia"
                        data-bind="options:transients.socialMediaUnspecified,optionsText:'name',optionsValue:'role',value:transients.socialMediaToAdd,optionsCaption:'Add social media link...'"></select>
            </td></tr>
            </tfoot>
        </table>
    </div>
</div>