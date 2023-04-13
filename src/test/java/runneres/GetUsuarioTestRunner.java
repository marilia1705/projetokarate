package runneres;

import com.intuit.karate.junit5.Karate;

public class GetUsuarioTestRunner {

    @Karate.Test
    public Karate runGetusuario()
    {
        return Karate.run("classpath:features/usuarios/GetUsuario.feature");
    }

}
