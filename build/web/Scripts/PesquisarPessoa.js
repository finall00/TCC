$("input#cpfPessoa").blur(function () {
    var cpfPessoa = $(this).val();
    $.getJSON("PesquisarPessoa", {cpfPessoa: cpfPessoa}, function (resp) {
        if (resp.erro === undefined) {
            $("input#codigoPessoa").val(resp.codigoPessoa);
            $("input#nomePessoa").val(resp.nomePessoa);
            $("input#dataNascimento").val(resp.dataNascimento);
            $("input#rgPessoa").val(resp.rgPessoa);            
            $("input#celularPessoa").val(resp.celularPessoa);
            $("input#telefonePessoa").val(resp.telefonePessoa);
            $("input#emailPessoa").val(resp.emailPessoa);
        } else {
            alert(resp.erro);
        }
    });
});

