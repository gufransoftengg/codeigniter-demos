<!DOCTYPE html>
<html>
<head>
	<title><?= $layout_title; ?></title>
        <?php echo $this->layouts->print_includes();?>
</head>
<body>
    <div id="warper_dv">
    <header>
        <h1>Header Section</h1>
    <select onchange="javascript:window.location.href='<?php echo base_url(); ?>LanguageSwitcher/switchLang/'+this.value;">
    <option value="english" <?php if($this->session->userdata('site_lang') == 'english') echo 'selected="selected"'; ?>>English</option>
    <option value="arabic" <?php if($this->session->userdata('site_lang') == 'arabic') echo 'selected="selected"'; ?>>Arabic</option>
    <!--<option value="german" <?php //if($this->session->userdata('site_lang') == 'german') echo 'selected="selected"'; ?>>German</option>-->   
</select>
<p><?php echo $this->lang->line('welcome_message'); ?></p>
    </header>

