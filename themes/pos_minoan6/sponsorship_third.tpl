{if $invitation_sent}
    <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="">
        <br><br>
        <img class="logo img-responsive" src="https://fluzfluz.co/img/fluzfluz-logo-1464806235.jpg" alt="FluzFluz" width="356" height="94">
        <p id="message_confirm" style="border:1px solid #E5E5E5;color:#31B404; text-align: center;">Felicidades la invitaci&oacute;n ha sido enviada a tu amigo.</p>
        <input type="hidden" value="{$urlWhatsapp}" id="urlWhatsapp"/>
    </div>
    <script>
        var urlWhatsapp = $("#urlWhatsapp").val();
        if ( urlWhatsapp != "" ) {
            window.open(urlWhatsapp, "_blank");
        }
        
        setTimeout( function(){ 
            $.fancybox.close();
            window.top.location.reload();
        }  , 3000 );
    </script>
{else}
<div id="rewards_sponsorship" class="rewards">
    {if $error}
	<p class="error">
            {if $error == 'email invalid'}
                Direcci&oacute;n de email no es correcta.
            {elseif $error == 'name invalid'}
                Nombre o apellido no es correcto.
            {elseif $error == 'email exists'}
                Alguien con este email ya ha sido apadrinado
            {elseif $error == 'no revive checked'}
                {l s='Please mark at least one checkbox' mod='allinone_rewards'}
            {elseif $error == 'bad phone'}
                {l s='The mobile phone is invalid' mod='allinone_rewards'}
            {elseif $error == 'sms already sent'}
                {l s='This mobile phone has already been invited during last 10 days, please retry later.' mod='allinone_rewards'}
            {elseif $error == 'sms impossible'}
                {l s='An error occured, the SMS has not been sent' mod='allinone_rewards'}
            {elseif $error == 'purchase incomplete'}
                {l s='Por favor verifica el estado de tu afiliacion, tu proceso de registro esta incompleto. Si tienes una invitacion por favor realiza el proceso de registro nuevamente.'}
            {elseif $error == 'no sponsor'}
                {l s='No hay espacios disponibles en la red.'}
            {/if}
	</p>
    {/if}
    <div class="sponsorshipBlock">
        <div id="sponsorship_form"  {if isset($popup) && !$afterSubmit}style="display: none"{/if}>
            <form id="list_contacts_form_Third" method="post" action="{$link->getPageLink('sponsorshipthird', true)}?user={$user}">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <p class="title-sponsor">Invitar fluzzer</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <p class="">&iquest;Tienes m&aacute;s amigos que deseas invitar a tu network en una posici&oacute;n especifica? Aqu&iacute; tienes la oportunidad.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">           
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 item t-sponsor">Nombre</div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="text" name="friendsFirstNameThird" size="20" value="" /></div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 item t-sponsor">Apellidos</div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="text" name="friendsLastNameThird" size="20" value="" /></div>
                    </div>    
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 last_item t-sponsor">Correo</div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="text" name="friendsEmailThird" size="20" value="" /></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <input class="cgv" type="checkbox" name="inviteWhatsapp" id="inviteWhatsapp" />&nbsp;
                        <label style="color: #777777;line-height: 30px;font-weight: normal;" for="inviteWhatsapp">Enviar invitaci&oacute;n tambi&eacute;n v&iacute;a Whatsapp</label>&nbsp;
                        <i class="icon icon-whatsapp" style="color: #189D0E;"></i>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 blockPhoneInviteWhatsapp">
                        <select name="countryPhoneInviteWhatsapp" id="countryPhoneInviteWhatsapp" style="background: #f9f9f9; height: 25px!important;">
                           <option value="57">COL (+57)</option>
                           <option disabled>──────────</option>
                        </select>
                        <input type="number" class="text" placeholder="Ej: 3001234567" name="phoneInviteWhatsapp" id="phoneInviteWhatsapp" size="20" value="" style="padding-left: 10px; height: 25px!important; background-color: #f9f9f9; border: 1px solid lightgray;" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">
                        <p class="bold"><span style="color:#ef4136;">Importante: </span>Los datos no se usaran con un prop&oacute;sito diferente a la invitaci&oacute;n.</p>
                        <p style="margin: 0px;padding: 0 !important;border: none;color: #666666;font-family: 'Open sans';line-height: 30px;font-size: 13px;">
                            <input class="cgv" type="checkbox" name="conditionsValidedThird" id="conditionsValidedThird" value="1" />&nbsp;
                            <label style="color: #777777;line-height: 30px;font-weight: normal;" for="conditionsValided">Acepto las condiciones en su totalidad.</label>
                            <a href="http://reglas.fluzfluz.co/terminos-y-condiciones/" title="Lea las condiciones" target="_blank">Lea las condiciones</a>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <p class="submit" align="right"><input type="submit" id="submitSponsorFriendsThird" name="submitSponsorFriendsThird" class="button_large" value="Invitar Fluzzers" /></p>
                    </div>
                </div>
            </form>
        </div>
    </div>   
</div>
{/if}  
{literal}
    <style>
        #header, #footer, #launcher, #right_column, .breadcrumb { display: none!important; }
        
        .blockPhoneInviteWhatsapp { display: none; }
        
        @media (max-width:425px){ 
            .title-sponsor{color: red !important;} 
            .fancybox-opened .fancybox-skin{padding: 5px !important;}
            #rewards_sponsorship{margin-left: 0px !important;}
        }
        
        @media (max-width:300px){
            .rewards{width: 100% !important;}
            .fancybox-outer{height: 250px!important;}
            .fancybox-skin{height: 300px !important;}
        }
    </style>
    
    <script>
        $("#inviteWhatsapp").change(function() {
            $("#phoneInviteWhatsapp").val("");
            if( $('#inviteWhatsapp').attr('checked') ) {
                $(".blockPhoneInviteWhatsapp").css("display","block");
            } else {
                $(".blockPhoneInviteWhatsapp").css("display","none");
            }
        });

        $(function() {
            $.ajax({
                method: "GET",
                data: {},
                url: 'https://restcountries.eu/rest/v2/all', 
                success:function(countries) {
                    $.each(countries, function(i, item) {
                        $("#countryPhoneInviteWhatsapp").append($('<option>', {
                            value: item.callingCodes[0],
                            text: item.alpha3Code+" (+"+item.callingCodes[0]+")"
                        }));
                    });
                }
            });
        });
    </script>
{/literal}

      
