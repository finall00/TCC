package model;

/**
 *
 * @author Aluno(a)
 */
public class Pessoa {

    private int codigoPessoa;
    private String nomePessoa;
    private String dataNascimento;
    private String cpfPessoa;   
    private String rgPessoa;   
    private String telefonePessoa;
    private String celularPessoa;
    private String emailPessoa;
    private String enderecoPessoa;
    private String estadoPessoa;
    private String cepPessoa;
    private String numeroCasa;
    private String cidadePessoa;
    private String bairroPessoa;

    public Pessoa(int codigoPessoa, String nomePessoa, String dataNascimento, String cpfPessoa, String rgPessoa, String telefonePessoa, String celularPessoa, String emailPessoa, String enderecoPessoa, String estadoPessoa, String numeroCasa, String cepPessoa, String cidadePessoa, String bairroPessoa) {
        this.codigoPessoa = codigoPessoa;
        this.nomePessoa = nomePessoa;
        this.dataNascimento = dataNascimento;
        this.cpfPessoa = cpfPessoa;
        this.rgPessoa = rgPessoa;
        this.telefonePessoa = telefonePessoa;
        this.celularPessoa = celularPessoa;
        this.emailPessoa = emailPessoa;
        this.enderecoPessoa = enderecoPessoa;
        this.numeroCasa = numeroCasa;
        this.estadoPessoa = estadoPessoa;
        this.cepPessoa = cepPessoa;
        this.cidadePessoa = cidadePessoa;
        this.bairroPessoa = bairroPessoa;
    }

    public Pessoa(int codigoPessoa, String nomePessoa, String dataNascimento, String rgPessoa, String celularPessoa, String telefonePessoa, String emailPessoa) {
        this.codigoPessoa = codigoPessoa;
        this.nomePessoa = nomePessoa;
        this.dataNascimento = dataNascimento;
        this.rgPessoa = rgPessoa;
        this.celularPessoa = celularPessoa;
        this.telefonePessoa = telefonePessoa;        
        this.emailPessoa = emailPessoa;
    }

    public Pessoa(int codigoPessoa) {
        this.codigoPessoa = codigoPessoa;
    }
    
     public Pessoa() {
       
    }

    public int getCodigoPessoa() {
        return codigoPessoa;
    }

    public void setCodigoPessoa(int codigoPessoa) {
        this.codigoPessoa = codigoPessoa;
    }

    public String getNomePessoa() {
        return nomePessoa;
    }

    public void setNomePessoa(String nomePessoa) {
        this.nomePessoa = nomePessoa;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCpfPessoa() {
        return cpfPessoa;
    }

    public void setCpfPessoa(String cpfPessoa) {
        this.cpfPessoa = cpfPessoa;
    }

    public String getRgPessoa() {
        return rgPessoa;
    }

    public void setRgPessoa(String rgPessoa) {
        this.rgPessoa = rgPessoa;
    }

    public String getTelefonePessoa() {
        return telefonePessoa;
    }

    public void setTelefonePessoa(String telefonePessoa) {
        this.telefonePessoa = telefonePessoa;
    }

    public String getCelularPessoa() {
        return celularPessoa;
    }

    public void setCelularPessoa(String celularPessoa) {
        this.celularPessoa = celularPessoa;
    }

    public String getEmailPessoa() {
        return emailPessoa;
    }

    public void setEmailPessoa(String emailPessoa) {
        this.emailPessoa = emailPessoa;
    }

    public String getEnderecoPessoa() {
        return enderecoPessoa;
    }

    public void setEnderecoPessoa(String enderecoPessoa) {
        this.enderecoPessoa = enderecoPessoa;
    }

    public String getEstadoPessoa() {
        return estadoPessoa;
    }

    public void setEstadoPessoa(String estadoPessoa) {
        this.estadoPessoa = estadoPessoa;
    }

    public String getCepPessoa() {
        return cepPessoa;
    }

    public void setCepPessoa(String cepPessoa) {
        this.cepPessoa = cepPessoa;
    }

    public String getCidadePessoa() {
        return cidadePessoa;
    }

    public void setCidadePessoa(String cidadePessoa) {
        this.cidadePessoa = cidadePessoa;
    }

    public String getBairroPessoa() {
        return bairroPessoa;
    }

    public void setBairroPessoa(String bairroPessoa) {
        this.bairroPessoa = bairroPessoa;
    }

    public String getNumeroCasa() {
        return numeroCasa;
    }

    public void setNumeroCasa(String numeroCasa) {
        this.numeroCasa = numeroCasa;
    }

    
}
