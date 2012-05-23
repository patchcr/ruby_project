import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        CSVLexer lex = new CSVLexer(new ANTLRFileStream("C:\\Users\\pryan\\git\\ruby_project\\fit_analyzer\\patricksandbox\\__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        CSVParser g = new CSVParser(tokens, 49100, null);
        try {
            g.expression();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}