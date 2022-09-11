package model;

public class MontaBolo {

    private int codigoBolo;
    private String decoracao;
    private SaborBolo saborBolo;
    private CoberturaBolo coberturaBolo;
    private RecheioBolo recheioBolo;
    private PesoBolo pesoBolo;
    private FormatoBolo formatoBolo;
    private Pessoa pessoa;

    public MontaBolo(int codigoBolo, String decoracao, SaborBolo saborBolo, CoberturaBolo coberturaBolo, RecheioBolo recheioBolo, PesoBolo pesoBolo, FormatoBolo formatoBolo, Pessoa pessoa) {
        this.codigoBolo = codigoBolo;
        this.decoracao = decoracao;
        this.saborBolo = saborBolo;
        this.coberturaBolo = coberturaBolo;
        this.recheioBolo = recheioBolo;
        this.pesoBolo = pesoBolo;
        this.formatoBolo = formatoBolo;
        this.pessoa = pessoa;
    }

    public MontaBolo(PesoBolo pesoBolo, SaborBolo saborBolo, CoberturaBolo coberturaBolo, RecheioBolo recheioBolo, FormatoBolo formatoBolo, Pessoa pessoa) {
        this.pesoBolo = pesoBolo;
        this.saborBolo = saborBolo;
        this.coberturaBolo = coberturaBolo;
        this.recheioBolo = recheioBolo;
        this.formatoBolo = formatoBolo;
        this.pessoa = pessoa;
    }

    public int getCodigoBolo() {
        return codigoBolo;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public void setCodigoBolo(int codigoBolo) {
        this.codigoBolo = codigoBolo;
    }

    public String getDecoracao() {
        return decoracao;
    }

    public void setDecoracao(String decoracao) {
        this.decoracao = decoracao;
    }

    public SaborBolo getSaborBolo() {
        return saborBolo;
    }

    public void setSaborBolo(SaborBolo saborBolo) {
        this.saborBolo = saborBolo;
    }

    public CoberturaBolo getCoberturaBolo() {
        return coberturaBolo;
    }

    public void setCoberturaBolo(CoberturaBolo coberturaBolo) {
        this.coberturaBolo = coberturaBolo;
    }

    public RecheioBolo getRecheioBolo() {
        return recheioBolo;
    }

    public void setRecheioBolo(RecheioBolo recheioBolo) {
        this.recheioBolo = recheioBolo;
    }

    public PesoBolo getPesoBolo() {
        return pesoBolo;
    }

    public void setPesoBolo(PesoBolo pesoBolo) {
        this.pesoBolo = pesoBolo;
    }

    public FormatoBolo getFormatoBolo() {
        return formatoBolo;
    }

    public void setFormatoBolo(FormatoBolo formatoBolo) {
        this.formatoBolo = formatoBolo;
    }

}
