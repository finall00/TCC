package model;

public class Funcionario extends Pessoa {

    private String obsFuncionario;
    private String loginFuncionario;
    private String senhaFuncionario;
    private Cargo cargo;

    public Funcionario(String obsFuncionario, String loginFuncionario, String senhaFuncionario, Cargo cargo, int codigoPessoa, String nomePessoa, String dataNascimento, String cpfPessoa, String rgPessoa, String telefonePessoa, String celularPessoa, String emailPessoa, String enderecoPessoa, String estadoPessoa, String cepPessoa, String cidadePessoa, String bairroPessoa) {
        super(codigoPessoa, nomePessoa, dataNascimento, cpfPessoa, rgPessoa, telefonePessoa, celularPessoa, emailPessoa, enderecoPessoa, estadoPessoa, cepPessoa, cidadePessoa, bairroPessoa);
        this.obsFuncionario = obsFuncionario;
        this.loginFuncionario = loginFuncionario;
        this.senhaFuncionario = senhaFuncionario;
        this.cargo = cargo;
    }
    
    public Funcionario() {
        super(0, "", "", "", "", "", "", "", "", "", "", "", "");
    }

    public Funcionario(Cargo cargo) {
         super(0, "", "", "", "", "", "", "", "", "", "", "", "");
        this.cargo = cargo;
    }

    public Funcionario(int codigoPessoa, String nomePessoa, String dataNascimento, String rgPessoa, String celularPessoa, String telefonePessoa, String emailPessoa) {
        super(codigoPessoa, nomePessoa, dataNascimento, rgPessoa, celularPessoa, telefonePessoa, emailPessoa);
    }
    
  

    

    public String getObsFuncionario() {
        return obsFuncionario;
    }

    public void setObsFuncionario(String obsFuncionario) {
        this.obsFuncionario = obsFuncionario;
    }

    public String getLoginFuncionario() {
        return loginFuncionario;
    }

    public void setLoginFuncionario(String loginFuncionario) {
        this.loginFuncionario = loginFuncionario;
    }

    public String getSenhaFuncionario() {
        return senhaFuncionario;
    }

    public void setSenhaFuncionario(String senhaFuncionario) {
        this.senhaFuncionario = senhaFuncionario;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
  


}
