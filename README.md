# Smart Contracts para recaudación de fondos de caridad
Este proyecto contiene dos contratos inteligentes escritos en Vyper que interactúan entre sí para permitir la recaudación de fondos de caridad y la verificación de donaciones.

## Contrato inteligente de recaudación de fondos de caridad
El contrato inteligente de recaudación de fondos de caridad es responsable de recibir donaciones de los donantes y enviarlas a la organización benéfica designada.

### Funciones del contrato
* donate(): Permite a los donantes hacer una donación al contrato de recaudación de fondos de caridad.

* withdraw(): Permite a la organización benéfica retirar las donaciones recibidas del contrato de recaudación de fondos de caridad.

### Variables públicas del contrato

* charity_organization: Dirección de la organización benéfica designada para recibir las donaciones.

* donations: Registro de donaciones recibidas por dirección de donante.

## Contrato inteligente de verificación de donaciones
El contrato inteligente de verificación de donaciones permite a los donantes verificar si sus donaciones se enviaron correctamente a la organización benéfica.

### Funciones del contrato:
* verify_donation(): Permite a los donantes verificar si sus donaciones se enviaron correctamente a la organización benéfica.

### Variables públicas del contrato:

* charity_fundraiser: Dirección del contrato de recaudación de fondos de caridad.

## Cómo usar los contratos
Deploy del contrato de recaudación de fondos de caridad en la red deseada, especificando la dirección de la organización benéfica designada.

Deploy del contrato de verificación de donaciones en la misma red, especificando la dirección del contrato de recaudación de fondos de caridad.

Los donantes pueden interactuar con el contrato de recaudación de fondos de caridad llamando a la función donate() y especificando la cantidad de su donación.

La organización benéfica puede retirar las donaciones recibidas llamando a la función withdraw() en el contrato de recaudación de fondos de caridad.

Los donantes pueden verificar si sus donaciones se enviaron correctamente llamando a la función verify_donation() en el contrato de verificación de donaciones.