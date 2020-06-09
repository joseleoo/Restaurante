


$(function () {
   
    jQuery.validator.setDefaults({
       
        success: "valid",
        submitHandler: function () {
            $("#saveSucces").show();
            $("#saveSucces").fadeOut(2000);
        }
    });
    $("#save").on("click", function () {

        $.validator.messages.required = ' ';
        $.validator.messages.email = 'Por favor corrige el formato del email';
        jQuery.validator.addMethod("last", function (value, element) {
            return this.optional(element) || /^[0-9]+[^I]\s?[a-z|A-Z|]{1}$/.test(value);
        }, "El nif debe tener 8 dig\u00EDtos y terminar en letra");

        $("#formClient").validate(
            {
                rules: {
                    nif: {
                        required: true,
                        minlength: 9,
                        last: true,
                    },
                },
                messages: {
                    nif: {
                        minlength: jQuery.validator.format("Escriba por lo menos 9 caracteres!")
                    },
                },
            }
        )
    })

    $('[data-toggle="tooltip"]').tooltip();  

});

