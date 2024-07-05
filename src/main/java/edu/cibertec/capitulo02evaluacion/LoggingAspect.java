package edu.cibertec.capitulo02evaluacion;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    public void actionBefore(JoinPoint joinPoint) {
        System.out.println("Acción: Ejecución antes del método" + joinPoint.getSignature().getName());
    }

    public void actionAfter(JoinPoint joinPoint) {
        System.out.println("Acción: Ejecución después del método" + joinPoint.getSignature().getName());
    }
}
