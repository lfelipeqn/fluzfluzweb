<div>
    <script type="text/javascript" src="//script.crazyegg.com/pages/scripts/0074/8440.js" async="async"></script>
</div>
<div class="block-banner row">
    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 text">
        <span>&iexcl;Somos el &Uacute;NICO Club De Compras dig&iacute;tal Gratuito Que Te Permite GANAR Y AHORRAR En Tus Gastos Del Mes!</span>
        <br><br><br><br>
        1.    Integramos lo mejor de los programas de Puntos convencionales. nuestros puntos Los llamamos FLUZ.
        <br><br>
        2.    Ac&aacute; tus Fluz Son DINERO que puedes Gastar en Cualquier comercio o Recibirlos en tu cuenta Bancaria en pesos colombianos.
        <br><br>
        3.    LO MEJOR, tambi&eacute;n ganas Fluz  por las compras de Tus Amigos.
        <br><br><br><br>
        Ingresa tus datos y nuestro sistema te asignar&aacute; aleatoriamente un puesto dentro del club de compras, para que puedas comenzar a DISFRUTAR de todos los beneficios
        <br><br><br><br>
        &iexcl;Desde Ya, Te Damos La Bienvenida! &iexcl;Prep&aacute;rate Para Ahorrar Y Ganar, Por Comprar Lo De Siempre!
    </div>
    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 img">
        <img src="https://fluzfluz.com/wp-content/uploads/2017/01/fluz-fluz-animation_web.gif">
    </div>
</div>

{* ERRORS *}
{if $errorsform}
    <div class="block-errors row">
        <span style="font-weight: bold;">Se encontraron los siguientes errores: </span><br>
        {foreach from=$errorsform item=error}
            <span>- {$error}</span><br>
        {/foreach}
    </div>
    
{/if}

{* COMPLETE REGISTRATION *}
{if $successfulregistration}
    <div class="block-successfulregistration row">
        <br>
        Tu Datos Han Sido Registrados Con Exito
        <br><br><br>
        Nuestros Asesores Validaran Tu Informaci&oacute;n, Espera Nuestro Correo Electronico Con Tus Credenciales de Acceso
        <br><br><br>
        <img src="{$img_dir}checked.png" />
        <br><br><br><br>
        <a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">Continuar</a>
        <br><br><br>
    </div>
{/if}

{* FORM *}
{if $viewform}
    <div class="block-form row">
        <span>Formulario de Registro</span>
        <br><br>
        <label class="required">&nbsp;<small class="form-text text-muted text-help">Campo Requerido</small></label>
        <form>
            <div class="form-group">
                <label for="name" class="required">Nombre</label>
                <input type="text" placeholder="-----" class="form-control" id="name" name="name" value="{if $data.0 != ""}{$data.0}{else}{$smarty.get.name}{/if}" readonly onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32))'>
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="email" class="required">Correo Electr&oacute;nico</label>
                <input type="email" placeholder="---@--.-" class="form-control" id="email" name="email" value="{if $data.1 != ""}{$data.1}{else}{$smarty.get.email}{/if}" readonly>
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="username" class="required">Username</label>
                <input type="text" placeholder="-----" class="form-control" id="username" name="username" value="{$smarty.get.username}">
                <small class="form-text text-muted text-help">Solo letras y n&uacute;meros</small>
            </div>
            <div class="form-group">
                <label for="phone" class="required">Celular</label>
                <input type="number" placeholder="-----" class="form-control" id="phone" name="phone" value="{if $data.2 != ""}{$data.2}{else}{$smarty.get.phone}{/if}">
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="address" class="required">Direcci&oacute;n</label>
                <input type="text" placeholder="-----" class="form-control" id="address" name="address" value="{$smarty.get.address}">
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="country" class="required">Pa&iacute;s</label>
                <select name="country" id="country">
                    <option value="" selected>-----</option>
                    {foreach from=$countries item=country}
                        <option value="{$country.id_country}">{$country.name}</option>
                    {/foreach}
                </select>
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="city" class="required">Ciudad</label>
                <select name="city" id="city">
                    <option value="" selected>-----</option>
                    <option class="69" value="Bogota, D.C.">Bogot&aacute;, D.C.</option>
                    <option class="69" value="Medellin">Medell&iacute;n</option>
                    <option class="69" value="Cali">Cali</option>
                    <option class="69" value="Barranquilla">Barranquilla</option>
                    <option class="69" value="Bucaramanga">Bucaramanga</option>
                    {foreach from=$cities item=city}
                        <option class="{$city.country}" value="{$city.ciudad}">{$city.ciudad}</option>
                    {/foreach}
                </select>
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="typedocument" class="required">Tipo de Identificaci&oacute;n</label>
                <select name="typedocument" id="typedocument">
                    <option value="Cedula de Ciudadania" selected="selected">Cedula de Ciudadan&iacute;a</option>
                    <option value="NIT">NIT</option>
                    <option value="Cedula de Extranjeria">Cedula de Extranjer&iacute;a</option>
                </select>
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <label for="dni" class="required">N&uacute;mero de Identificaci&oacute;n</label>
                <input type="number" placeholder="-----" class="form-control" id="dni" name="dni" value="{$smarty.get.dni}">
                <small class="form-text text-muted text-help"></small>
            </div>
            <div class="form-group">
                <input type="checkbox" class="form-check-input" id="acceptterms" name="acceptterms">
                <label class="form-check-label" for="acceptterms"><a href="http://reglas.fluzfluz.co/terminos-y-condiciones/" target="_blank">Acepto los t&eacute;rminos y condiciones de Fluz Fluz</a></label>
            </div>
            <div class="form-group" style="text-align: center;">
                <button type="submit" class="btn btn-primary" name="register" id="register" disabled>Registrarme</button>
            </div>
        </form>
    </div>
{/if}

{literal}
    <script>
        $("#city option").hide();
        $(document).on('change', '#country', function() {
            var country = $(this).val();
            $("#city option").hide();
            if (country) {
                $("."+country).show();
            }
        });
        
        $(document).on('change', '.form-control, #country, #city, #typedocument, #acceptterms', function() {            
            var name = $("#name").val();
            var username = $("#username").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var address = $("#address").val();
            var country = $("#country").val();
            var city = $("#city").val();
            var typedocument = $("#typedocument").val();
            var dni = $("#dni").val();
            var acceptterms = $("#acceptterms");

            if (
                name != "" &&
                username != "" &&
                email != "" &&
                phone != "" &&
                address != "" &&
                country != "" &&
                city != "" &&
                typedocument != "" &&
                dni != "" &&
                acceptterms.is(':checked')
            ){
                $("#register").removeAttr("disabled");
            } else {
                $("#register").attr("disabled","disabled");
            }
        });
    </script>
{/literal}