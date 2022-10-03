$("input#pesquisaProduto").blur(function (){
    var nomeProduto = $(this).val();
    $.getJSON("PesquisarProduto", {nomeProduto: nomeProduto}, function (resp) {
        if (resp.erro === undefined){
            $("input#codigoProduto").val(resp.codigoProduto);
            $("input#nomeProduto").val(resp.nomeProduto);
            $("input#codigoBarra").val(resp.codigoBarra);
            $("input#vlrCusto").val(resp.vlrCusto);
            $("input#vlrVenda").val(resp.vlrVenda);
            $("input#estoqueProduto").val(resp.estoqueProduto);
            $("input#dataValidade").val(resp.dataValidade);
            $("input#imagem").val(resp.imagem);
            $("input#descricaoProduto").val(resp.descricaoProduto);
            
        } else{
            alert(resp.erro);
        }
    });
});


