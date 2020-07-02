/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';


    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.language = 'vi';
    config.filebrowserBrowseUrl = '/Assets/Admin/plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Assets/Admin/plugins/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Assets/Admin/plugins/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Assets/Admin/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Data/images/Upload/Product/';
    config.filebrowserFlashUploadUrl = '/Assets/Admin/plugins//ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    CKFinder.setupCKEditor(null, '/Assets/Admin/plugins/ckfinder/');
};
