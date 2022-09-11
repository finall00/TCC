package model;

/**
 *
 * @author smili08
 */
public class Cliente extends Pessoa {

    private String obsCliente;
    private String loginCliente;
    private String senhaCliente;

    public Cliente(String obsCliente, String loginCliente, String senhaCliente, int codigoPessoa, String nomePessoa, String dataNascimento, String cpfPessoa, String rgPessoa, String telefonePessoa, String celularPessoa, String emailPessoa, String enderecoPessoa, String estadoPessoa, String cepPessoa, String cidadePessoa, String bairroPessoa) {
        super(codigoPessoa, nomePessoa, dataNascimento, cpfPessoa, rgPessoa, telefonePessoa, celularPessoa, emailPessoa, enderecoPessoa, estadoPessoa, cepPessoa, cidadePessoa, bairroPessoa);
        this.obsCliente = obsCliente;
        this.loginCliente = loginCliente;
        this.senhaCliente = senhaCliente;
    }

    public Cliente(int codigoPessoa, String nomePessoa, String dataNascimento, String rgPessoa, String celularPessoa, String telefonePessoa, String emailPessoa) {
        super(codigoPessoa, nomePessoa, dataNascimento, rgPessoa, celularPessoa, telefonePessoa, emailPessoa);
    } 
    public Cliente() {
        super(0, "", "", "", "", "", "", "", "", "", "", "", "");
    }

   

    public String getObsCliente() {
        return obsCliente;
    }

    public void setObsCliente(String obsCliente) {
        this.obsCliente = obsCliente;
    }

    public String getLoginCliente() {
        return loginCliente;
    }

    public void setLoginCliente(String loginCliente) {
        this.loginCliente = loginCliente;
    }

    public String getSenhaCliente() {
        return senhaCliente;
    }

    public void setSenhaCliente(String senhaCliente) {
        this.senhaCliente = senhaCliente;
    }


    

    
}
