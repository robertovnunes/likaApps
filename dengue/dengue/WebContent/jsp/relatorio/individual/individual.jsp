<html>
<head><meta http-equiv=Content-Type content="text/html; charset=UTF-8">

<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<style type="text/css">
<!--
span.cls_007{font-family:Arial,serif;font-size:11.1px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_007{font-family:Arial,serif;font-size:11.1px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_005{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_005{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_008{font-family:Arial,serif;font-size:10.1px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_008{font-family:Arial,serif;font-size:10.1px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_006{font-family:Arial,serif;font-size:9.2px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_006{font-family:Arial,serif;font-size:9.2px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_010{font-family:Arial,serif;font-size:9.2px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_010{font-family:Arial,serif;font-size:9.2px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_002{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_002{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_014{font-family:Times,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_014{font-family:Times,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_009{font-family:Arial,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
div.cls_009{font-family:Arial,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:bold;font-style:normal;text-decoration: none}
span.cls_003{font-family:Times,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_003{font-family:Times,serif;font-size:12.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_011{font-family:Arial,serif;font-size:6.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_011{font-family:Arial,serif;font-size:6.0px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_013{font-family:Arial,serif;font-size:6.0px;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
div.cls_013{font-family:Arial,serif;font-size:6.0px;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
span.cls_012{font-family:Arial,serif;font-size:10.1px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_012{font-family:Arial,serif;font-size:10.1px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_015{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
div.cls_015{font-family:Arial,serif;font-size:8.0px;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
-->
</style>
<script type="text/javascript" src="js/wz_jsgraphics.js"></script>
</head>
<body>
<div style="position:absolute;left:50%;margin-left:-297px;top:0px;width:595px;height:842px;border-style:outset;overflow:hidden">
<div style="position:absolute;left:0px;top:0px">
<img src="images/background1.jpg" width=595 height=842></div>
<div style="position:absolute;left:282.24px;top:26.00px" class="cls_007"><span class="cls_007">SINAN</span></div>
<div style="position:absolute;left:53.76px;top:33.44px" class="cls_005"><span class="cls_005">República Federativa do Brasil</span></div>
<div style="position:absolute;left:182.88px;top:37.52px" class="cls_005"><span class="cls_005">SISTEMA DE INFORMAÇÃO  DE AGRAVOS DE NOTIFICAÇÃO</span></div>
<div style="position:absolute;left:455.52px;top:37.28px" class="cls_008"><span class="cls_008">Nº F<c:out value="${notificacaoInvestigativa.id}"></c:out>-I<c:out value="${notificacaoInvestigativa.investigador.id}"></c:out></span></div>
<div style="position:absolute;left:69.60px;top:43.04px" class="cls_005"><span class="cls_005">Ministério da Saúde</span></div>
<div style="position:absolute;left:227.28px;top:46.64px" class="cls_005"><span class="cls_005">FICHA DE INVESTIGAÇÃO</span><span class="cls_007">     DENGUE</span></div>
<div style="position:absolute;left:36.72px;top:60.56px" class="cls_006"><span class="cls_006">CASO SUSPEITO:</span><span class="cls_010">  Paciente com</span><span class="cls_006"> febre</span><span class="cls_010"> com duração máxima de 7 dias, acompanhada de pelo menos</span><span class="cls_006"> dois dos seguintes</span></div>
<div style="position:absolute;left:36.72px;top:71.36px" class="cls_006"><span class="cls_006">sintomas</span><span class="cls_010">: cefaléia, dor retroorbital, mialgia, artralgia, prostração, exantema e com exposição à área com transmissão de dengue</span></div>
<div style="position:absolute;left:36.72px;top:81.68px" class="cls_010"><span class="cls_010">ou</span></div>
<div style="position:absolute;left:49.44px;top:81.68px" class="cls_010"><span class="cls_010">com presença de Aedes aegypti nos últimos quinze dias.</span></div>
<div style="position:absolute;left:54.48px;top:97.52px" class="cls_005"><span class="cls_005">1</span></div>
<div style="position:absolute;left:66.00px;top:96.80px" class="cls_002"><span class="cls_002">Tipo de Notificação</span></div>
<div style="position:absolute;left:258.48px;top:103.28px" class="cls_002"><span class="cls_002">2 - Individual</span></div>
<div style="position:absolute;left:54.48px;top:122.00px" class="cls_005"><span class="cls_005">2</span></div>
<div style="position:absolute;left:66.24px;top:122.72px" class="cls_002"><span class="cls_002">Agravo/doença</span></div>
<div style="position:absolute;left:370.32px;top:121.52px" class="cls_002"><span class="cls_002">Código (CID10)</span></div>
<div style="position:absolute;left:437.04px;top:122.96px" class="cls_005"><span class="cls_005">3</span></div>
<div style="position:absolute;left:447.84px;top:121.28px" class="cls_002"><span class="cls_002">Data da Notificação</span></div>
<div style="position:absolute;left:221.51px;top:131.12px" class="cls_007"><span class="cls_007">DENGUE</span></div>
<div style="position:absolute;left:380.40px;top:132.80px" class="cls_014"><span class="cls_014">A 90</span></div>
<div style="position:absolute;left:471.36px;top:131.84px" class="cls_009"><span class="cls_009"><c:out value="${notificacaoInvestigativa.dadosGerais.dataNotificacaoFormatada}"></c:out></span></div>
<div style="position:absolute;left:499.68px;top:131.84px" class="cls_009"><span class="cls_009"></span></div>
<div style="position:absolute;left:456.72px;top:134.24px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:485.76px;top:134.24px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:514.56px;top:134.24px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:529.43px;top:134.24px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:544.31px;top:134.24px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:54.24px;top:148.88px" class="cls_005"><span class="cls_005">4</span></div>
<div style="position:absolute;left:64.32px;top:150.32px" class="cls_002"><span class="cls_002">UF</span></div>
<div style="position:absolute;left:84.72px;top:151.04px" class="cls_005"><span class="cls_005">5</span></div>
<div style="position:absolute;left:94.56px;top:151.76px" class="cls_002"><span class="cls_002">Município de Notificação</span></div>
<div style="position:absolute;left:94.56px;top:165.76px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.dadosGerais.cidade.descricao}"></c:out></span></div>
<div style="position:absolute;left:485.76px;top:150.80px" class="cls_002"><span class="cls_002">Código (IBGE)</span></div>
<div style="position:absolute;left:63.60px;top:162.80px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosGerais.cidade.estado.sigla}"></c:out></span></div>
<div style="position:absolute;left:486.48px;top:164.00px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosGerais.cidade.ibge_codigo}"></c:out></span></div>
<div style="position:absolute;left:501.35px;top:164.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:516.23px;top:164.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:531.11px;top:164.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:545.99px;top:164.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:53.76px;top:181.04px" class="cls_005"><span class="cls_005">6</span></div>
<div style="position:absolute;left:65.52px;top:181.04px" class="cls_002"><span class="cls_002">Unidade de Saúde (ou outra fonte notificadora)</span></div>
<div style="position:absolute;left:65.52px;top:195.04px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.nome_fantasia}"></c:out></span></div>
<div style="position:absolute;left:338.88px;top:179.84px" class="cls_002"><span class="cls_002">Código</span></div>
<div style="position:absolute;left:441.84px;top:179.36px" class="cls_005"><span class="cls_005">7</span></div>
<div style="position:absolute;left:450.96px;top:178.16px" class="cls_002"><span class="cls_002">Data dos Primeiros Sintomas</span></div>
<div style="position:absolute;left:468.96px;top:187.28px" class="cls_009"><span class="cls_009"><c:out value="${notificacaoInvestigativa.dadosGerais.dataPrimeirosSintomasFormatada}"></c:out></span></div>
<div style="position:absolute;left:497.28px;top:187.28px" class="cls_009"><span class="cls_009"></span></div>
<div style="position:absolute;left:347.04px;top:192.32px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.codigo_cnes}"></c:out></span></div>
<div style="position:absolute;left:361.91px;top:192.32px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:376.79px;top:192.32px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:391.67px;top:192.32px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:406.55px;top:192.32px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:421.42px;top:192.32px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:453.84px;top:190.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:482.88px;top:190.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:511.68px;top:190.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:526.55px;top:190.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:541.43px;top:190.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:54.48px;top:209.12px" class="cls_005"><span class="cls_005">8</span></div>
<div style="position:absolute;left:66.24px;top:209.12px" class="cls_002"><span class="cls_002">Nome do Paciente</span></div>
<div style="position:absolute;left:66.24px;top:224.12px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.nome}"></c:out></span></div>
<div style="position:absolute;left:445.44px;top:209.84px" class="cls_005"><span class="cls_005">9</span></div>
<div style="position:absolute;left:456.24px;top:208.88px" class="cls_002"><span class="cls_002">Data</span></div>
<div style="position:absolute;left:474.49px;top:208.88px" class="cls_002"><span class="cls_002">de Nascimento</span></div>
<div style="position:absolute;left:471.84px;top:218.96px" class="cls_009"><span class="cls_009"><c:out value="${notificacaoInvestigativa.paciente.dataNascimentoFormatada}"></c:out></span></div>
<div style="position:absolute;left:501.60px;top:218.96px" class="cls_009"><span class="cls_009"></span></div>
<div style="position:absolute;left:457.44px;top:221.12px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:486.48px;top:221.12px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:515.28px;top:221.12px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:530.15px;top:221.12px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:545.03px;top:221.12px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:121.20px;top:236.00px" class="cls_011"><span class="cls_011">1 - Hora</span></div>
<div style="position:absolute;left:258.00px;top:235.76px" class="cls_002"><span class="cls_002">Gestante</span></div>
<div style="position:absolute;left:447.84px;top:236.00px" class="cls_005"><span class="cls_005">13</span></div>
<div style="position:absolute;left:427.84px;top:239.00px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.paciente.gestante}"></c:out></span></div>
<div style="position:absolute;left:52.32px;top:239.60px" class="cls_005"><span class="cls_005">10</span></div>
<div style="position:absolute;left:65.52px;top:238.40px" class="cls_002"><span class="cls_002">(ou) Idade</span></div>
<div style="position:absolute;left:150.72px;top:238.88px" class="cls_005"><span class="cls_005">11</span></div>
<div style="position:absolute;left:163.20px;top:238.40px" class="cls_002"><span class="cls_002">Sexo</span></div>
<div style="position:absolute;left:183.36px;top:240.08px" class="cls_011"><span class="cls_011">M - Masculino</span></div>
<div style="position:absolute;left:248.16px;top:237.44px" class="cls_005"><span class="cls_005">12</span></div>
<div style="position:absolute;left:230.16px;top:239.44px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.paciente.sexo}"></c:out></span></div>
<div style="position:absolute;left:459.84px;top:237.44px" class="cls_002"><span class="cls_002">Raça/Cor</span></div>
<div style="position:absolute;left:554.84px;top:240.44px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.racaCor}"></c:out></span></div>
<div style="position:absolute;left:554.84px;top:270.44px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.escolaridade}"></c:out></span></div>
<div style="position:absolute;left:121.20px;top:242.72px" class="cls_011"><span class="cls_011">2 - Dia</span></div>
<div style="position:absolute;left:262.80px;top:244.64px" class="cls_013"><span class="cls_013">1-1ºTrimestre</span></div>
<div style="position:absolute;left:306.02px;top:244.64px" class="cls_013"><span class="cls_013">2-2ºTrimestre</span></div>
<div style="position:absolute;left:354.28px;top:244.64px" class="cls_013"><span class="cls_013">3-3ºTrimestre</span></div>
<div style="position:absolute;left:184.08px;top:246.80px" class="cls_011"><span class="cls_011">F - Feminino</span></div>
<div style="position:absolute;left:121.20px;top:249.44px" class="cls_011"><span class="cls_011">3 - Mês</span></div>
<div style="position:absolute;left:109.20px;top:247.44px" class="cls_011"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.idadeBebe}"></c:out></span></div>
<div style="position:absolute;left:262.80px;top:250.64px" class="cls_013"><span class="cls_013">4- Idade gestacional Ignorada</span></div>
<div style="position:absolute;left:349.21px;top:250.64px" class="cls_013"><span class="cls_013">5-Não</span></div>
<div style="position:absolute;left:375.61px;top:250.64px" class="cls_013"><span class="cls_013">6- Não se aplica</span></div>
<div style="position:absolute;left:453.84px;top:251.12px" class="cls_013"><span class="cls_013">1-Branca</span></div>
<div style="position:absolute;left:486.73px;top:251.12px" class="cls_013"><span class="cls_013">2-Preta</span></div>
<div style="position:absolute;left:521.53px;top:251.12px" class="cls_013"><span class="cls_013">3-Amarela</span></div>
<div style="position:absolute;left:184.80px;top:253.52px" class="cls_011"><span class="cls_011">I - Ignorado</span></div>
<div style="position:absolute;left:72.69px;top:252.80px" class="cls_012"><span class="cls_012"><c:out value="${notificacaoInvestigativa.paciente.idade}"></c:out></span></div>
<div style="position:absolute;left:86.81px;top:252.80px" class="cls_012"><span class="cls_012"></span></div>
<div style="position:absolute;left:121.20px;top:256.16px" class="cls_011"><span class="cls_011">4 - Ano</span></div>
<div style="position:absolute;left:262.80px;top:257.60px" class="cls_013"><span class="cls_013">9-Ignorado</span></div>
<div style="position:absolute;left:453.84px;top:258.08px" class="cls_013"><span class="cls_013">4-Parda</span></div>
<div style="position:absolute;left:486.97px;top:258.08px" class="cls_013"><span class="cls_013">5-Indígena</span></div>
<div style="position:absolute;left:523.93px;top:258.08px" class="cls_013"><span class="cls_013">9- Ignorado</span></div>
<div style="position:absolute;left:52.32px;top:264.56px" class="cls_005"><span class="cls_005">14</span></div>
<div style="position:absolute;left:63.60px;top:263.60px" class="cls_002"><span class="cls_002">Escolaridade</span></div>
<div style="position:absolute;left:62.88px;top:271.76px" class="cls_011"><span class="cls_011">0-Analfabeto</span></div>
<div style="position:absolute;left:105.60px;top:271.76px" class="cls_011"><span class="cls_011">1-1ª a 4ª série incompleta do EF (antigo primário ou 1º grau)</span></div>
<div style="position:absolute;left:274.59px;top:271.76px" class="cls_011"><span class="cls_011">2-4ª série completa do EF (antigo primário ou 1º grau)</span></div>
<div style="position:absolute;left:62.88px;top:278.48px" class="cls_011"><span class="cls_011">3-5ª à 8ª série incompleta do EF (antigo ginásio ou 1º grau)</span></div>
<div style="position:absolute;left:229.22px;top:278.48px" class="cls_011"><span class="cls_011">4-Ensino fundamental completo (antigo ginásio ou 1º grau)</span></div>
<div style="position:absolute;left:396.01px;top:278.48px" class="cls_011"><span class="cls_011">5-Ensino médio incompleto (antigo colegial  ou 2º grau )</span></div>
<div style="position:absolute;left:62.88px;top:285.20px" class="cls_011"><span class="cls_011">6-Ensino médio completo (antigo colegial  ou 2º grau )</span></div>
<div style="position:absolute;left:214.32px;top:285.20px" class="cls_011"><span class="cls_011">7-Educação superior incompleta</span></div>
<div style="position:absolute;left:310.08px;top:285.20px" class="cls_011"><span class="cls_011">8-Educação superior completa</span></div>
<div style="position:absolute;left:401.04px;top:285.20px" class="cls_011"><span class="cls_011">9-Ignorado</span></div>
<div style="position:absolute;left:434.89px;top:285.20px" class="cls_011"><span class="cls_011">10- Não se aplica</span></div>
<div style="position:absolute;left:52.56px;top:298.88px" class="cls_005"><span class="cls_005">15</span></div>
<div style="position:absolute;left:68.64px;top:299.36px" class="cls_002"><span class="cls_002">Número do Cartão SUS</span></div>
<div style="position:absolute;left:230.40px;top:298.40px" class="cls_005"><span class="cls_005">16</span></div>
<div style="position:absolute;left:243.36px;top:300.08px" class="cls_002"><span class="cls_002">Nome da mãe</span></div>
<div style="position:absolute;left:243.36px;top:312.08px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.nomeMae}"></c:out></span></div>
<div style="position:absolute;left:60.96px;top:311.84px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.paciente.numeroCartaoSUS}"></c:out></span></div>
<div style="position:absolute;left:72.72px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:84.47px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:96.23px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:107.99px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:119.75px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:131.50px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:143.26px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:155.02px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:166.78px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:178.53px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:190.29px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:202.05px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:213.81px;top:311.84px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:53.52px;top:330.32px" class="cls_005"><span class="cls_005">17</span></div>
<div style="position:absolute;left:64.80px;top:329.60px" class="cls_002"><span class="cls_002">UF</span></div>
<div style="position:absolute;left:82.08px;top:330.32px" class="cls_005"><span class="cls_005">18</span></div>
<div style="position:absolute;left:93.84px;top:330.80px" class="cls_002"><span class="cls_002">Município de Residência</span></div>
<div style="position:absolute;left:93.84px;top:344.80px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.cidade.descricao}"></c:out><c:out value="${notificacaoInvestigativa.paciente.residencia.cidade.descricao}"></c:out></span></div>
<div style="position:absolute;left:328.32px;top:329.12px" class="cls_002"><span class="cls_002">Código (IBGE)</span></div>
<div style="position:absolute;left:411.12px;top:331.76px" class="cls_005"><span class="cls_005">19</span></div>
<div style="position:absolute;left:425.28px;top:331.28px" class="cls_002"><span class="cls_002">Distrito</span></div>
<div style="position:absolute;left:425.28px;top:344.28px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.distrito}"></c:out></span></div>
<div style="position:absolute;left:65.04px;top:341.12px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.cidade.estado.sigla}"></c:out><c:out value="${notificacaoInvestigativa.paciente.residencia.estado.sigla}"></c:out></span></div>
<div style="position:absolute;left:336.48px;top:341.60px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.cidade.ibge_codigo}"></c:out><c:out value="${notificacaoInvestigativa.paciente.residencia.cidade.ibge_codigo}"></c:out></span></div>
<div style="position:absolute;left:351.35px;top:341.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:366.23px;top:341.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:381.11px;top:341.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:395.99px;top:341.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:52.56px;top:356.96px" class="cls_005"><span class="cls_005">20</span></div>
<div style="position:absolute;left:66.00px;top:355.76px" class="cls_002"><span class="cls_002">Bairro</span></div>
<div style="position:absolute;left:66.00px;top:369.76px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.descricao}"></c:out></span></div>
<div style="position:absolute;left:193.68px;top:357.44px" class="cls_005"><span class="cls_005">21</span></div>
<div style="position:absolute;left:205.20px;top:356.48px" class="cls_002"><span class="cls_002">Logradouro (rua, avenida,...)</span></div>
<div style="position:absolute;left:205.20px;top:370.48px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.rua}"></c:out></span></div>
<div style="position:absolute;left:479.04px;top:355.52px" class="cls_002"><span class="cls_002">Código</span></div>
<div style="position:absolute;left:490.32px;top:368.00px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.codigo}"></c:out></span></div>
<div style="position:absolute;left:505.19px;top:368.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:520.07px;top:368.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:534.95px;top:368.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:549.83px;top:368.00px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:53.28px;top:380.24px" class="cls_005"><span class="cls_005">22</span></div>
<div style="position:absolute;left:66.48px;top:380.00px" class="cls_002"><span class="cls_002">Número</span></div>
<div style="position:absolute;left:66.48px;top:394.00px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.numero}"></c:out></span></div>
<div style="position:absolute;left:109.68px;top:379.76px" class="cls_005"><span class="cls_005">23</span></div>
<div style="position:absolute;left:120.48px;top:379.76px" class="cls_002"><span class="cls_002">Complemento (apto., casa,</span></div>
<div style="position:absolute;left:120.48px;top:393.76px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.complemento}"></c:out></span></div>
<div style="position:absolute;left:214.64px;top:379.76px" class="cls_002"><span class="cls_002">...)</span></div>
<div style="position:absolute;left:410.40px;top:381.68px" class="cls_005"><span class="cls_005">24</span></div>
<div style="position:absolute;left:421.44px;top:380.48px" class="cls_002"><span class="cls_002">Geo campo 1</span></div>
<div style="position:absolute;left:421.44px;top:395.48px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.geocampo1}"></c:out></span></div>
<div style="position:absolute;left:53.28px;top:404.96px" class="cls_005"><span class="cls_005">25</span></div>
<div style="position:absolute;left:66.00px;top:403.04px" class="cls_002"><span class="cls_002">Geo campo 2</span></div>
<div style="position:absolute;left:66.00px;top:419.04px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.geocampo2}"></c:out></span></div>
<div style="position:absolute;left:214.56px;top:406.88px" class="cls_005"><span class="cls_005">26</span></div>
<div style="position:absolute;left:227.04px;top:406.64px" class="cls_002"><span class="cls_002">Ponto de Referência</span></div>
<div style="position:absolute;left:227.04px;top:420.64px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.referencia}"></c:out></span></div>
<div style="position:absolute;left:455.04px;top:406.88px" class="cls_005"><span class="cls_005">27</span></div>
<div style="position:absolute;left:469.20px;top:407.84px" class="cls_002"><span class="cls_002">CEP</span></div>
<div style="position:absolute;left:466.56px;top:418.40px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.cep}"></c:out></span></div>
<div style="position:absolute;left:481.43px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:496.31px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:511.19px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:522.95px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:536.38px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:551.26px;top:418.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:53.28px;top:431.12px" class="cls_005"><span class="cls_005">28</span></div>
<div style="position:absolute;left:67.20px;top:430.64px" class="cls_002"><span class="cls_002">(DDD) Telefone</span></div>
<div style="position:absolute;left:67.20px;top:444.64px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.telefone}"></c:out></span></div>
<div style="position:absolute;left:204.96px;top:431.60px" class="cls_005"><span class="cls_005">29</span></div>
<div style="position:absolute;left:216.96px;top:429.92px" class="cls_002"><span class="cls_002">Zona</span></div>
<div style="position:absolute;left:335.20px;top:431.84px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.paciente.residencia.zona}"></c:out></span></div>
<div style="position:absolute;left:355.20px;top:431.84px" class="cls_005"><span class="cls_005">30</span></div>
<div style="position:absolute;left:366.48px;top:431.60px" class="cls_002"><span class="cls_002">País (se residente fora do Brasil)</span></div>
<div style="position:absolute;left:366.48px;top:445.60px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.paciente.residencia.pais.nome}"></c:out></span></div>
<div style="position:absolute;left:235.92px;top:435.44px" class="cls_002"><span class="cls_002">1 - Urbana</span></div>
<div style="position:absolute;left:283.22px;top:435.44px" class="cls_002"><span class="cls_002">2 - Rural</span></div>
<div style="position:absolute;left:65.52px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:80.39px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:95.27px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:110.15px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:125.03px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:139.90px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:154.78px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:169.66px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:184.53px;top:442.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:235.92px;top:444.56px" class="cls_002"><span class="cls_002">3 - Periurbana  9 - Ignorado</span></div>
<div style="position:absolute;left:161.76px;top:460.64px" class="cls_007"><span class="cls_007">Dados laboratoriais e conclusão  (dengue clássico)</span></div>
<div style="position:absolute;left:63.12px;top:476.48px" class="cls_005"><span class="cls_005">31</span></div>
<div style="position:absolute;left:76.80px;top:476.00px" class="cls_002"><span class="cls_002">Data da Investigação</span></div>
<div style="position:absolute;left:76.80px;top:489.00px" class="cls_002"><span class="cls_002"></span></div>
<div style="position:absolute;left:195.36px;top:478.64px" class="cls_005"><span class="cls_005">32</span></div>
<div style="position:absolute;left:208.32px;top:478.88px" class="cls_002"><span class="cls_002">Ocupação</span></div>
<div style="position:absolute;left:208.32px;top:491.88px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.ocupacao}"></c:out></span></div>
<div style="position:absolute;left:84.96px;top:490.40px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataInvestigacaoFormatada}"></c:out></span></div>
<div style="position:absolute;left:99.60px;top:488.00px" class="cls_009"><span class="cls_009"></span></div>
<div style="position:absolute;left:114.00px;top:490.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:127.92px;top:488.00px" class="cls_009"><span class="cls_009"></span></div>
<div style="position:absolute;left:142.80px;top:490.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:157.67px;top:490.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:172.55px;top:490.40px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:54.96px;top:503.12px" class="cls_006"><span class="cls_006">Exame Sorológico (IgM)</span></div>
<div style="position:absolute;left:327.12px;top:504.56px" class="cls_006"><span class="cls_006">Exame NS1</span></div>
<div style="position:absolute;left:186.00px;top:510.56px" class="cls_005"><span class="cls_005">34</span></div>
<div style="position:absolute;left:316.00px;top:510.56px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoIgm}"></c:out></span></div>
<div style="position:absolute;left:199.20px;top:511.04px" class="cls_002"><span class="cls_002">Resultado</span></div>
<div style="position:absolute;left:445.20px;top:510.08px" class="cls_005"><span class="cls_005">36</span></div>
<div style="position:absolute;left:457.20px;top:512.96px" class="cls_002"><span class="cls_002">Resultado</span></div>
<div style="position:absolute;left:554.20px;top:514.96px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoNs1}"></c:out></span></div>
<div style="position:absolute;left:57.60px;top:515.60px" class="cls_005"><span class="cls_005">33</span></div>
<div style="position:absolute;left:68.40px;top:516.32px" class="cls_002"><span class="cls_002">Data da Coleta</span></div>
<div style="position:absolute;left:328.08px;top:516.56px" class="cls_005"><span class="cls_005">35</span></div>
<div style="position:absolute;left:341.04px;top:517.28px" class="cls_002"><span class="cls_002">Data da Coleta</span></div>
<div style="position:absolute;left:193.20px;top:522.56px" class="cls_002"><span class="cls_002">1 - Reagente</span></div>
<div style="position:absolute;left:248.20px;top:522.56px" class="cls_002"><span class="cls_002">2 - Não Reagente</span></div>
<div style="position:absolute;left:446.40px;top:522.32px" class="cls_002"><span class="cls_002">1- Positivo</span></div>
<div style="position:absolute;left:503.81px;top:522.32px" class="cls_002"><span class="cls_002">2- Negativo</span></div>
<div style="position:absolute;left:78.72px;top:527.60px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaIgmFormatada}"></c:out></span></div>
<div style="position:absolute;left:107.04px;top:527.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:135.84px;top:527.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:150.71px;top:527.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:165.59px;top:527.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:193.20px;top:531.68px" class="cls_002"><span class="cls_002">3 - Inconclusivo  4 - Não Realizado</span></div>
<div style="position:absolute;left:372.96px;top:528.08px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:401.76px;top:527.36px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:416.63px;top:527.36px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:431.51px;top:527.36px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:446.40px;top:531.44px" class="cls_002"><span class="cls_002">3- Inconclusivo</span></div>
<div style="position:absolute;left:504.52px;top:531.44px" class="cls_002"><span class="cls_002">4 - Não realizado</span></div>
<div style="position:absolute;left:343.92px;top:530.96px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaNs1Formatada}"></c:out></span></div>
<div style="position:absolute;left:58.08px;top:539.60px" class="cls_006"><span class="cls_006">Isolamento Viral</span></div>
<div style="position:absolute;left:298.08px;top:542.72px" class="cls_006"><span class="cls_006">RT-PCR</span></div>
<div style="position:absolute;left:172.56px;top:549.44px" class="cls_005"><span class="cls_005">38</span></div>
<div style="position:absolute;left:282.56px;top:549.44px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoViral}"></c:out></span></div>
<div style="position:absolute;left:184.08px;top:549.20px" class="cls_002"><span class="cls_002">Resultado</span></div>
<div style="position:absolute;left:427.92px;top:548.96px" class="cls_005"><span class="cls_005">40</span></div>
<div style="position:absolute;left:555.92px;top:550.96px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoRT_PCR}"></c:out></span></div>
<div style="position:absolute;left:441.36px;top:550.64px" class="cls_002"><span class="cls_002">Resultado</span></div>
<div style="position:absolute;left:58.56px;top:553.04px" class="cls_005"><span class="cls_005">37</span></div>
<div style="position:absolute;left:70.08px;top:554.48px" class="cls_002"><span class="cls_002">Data da coleta</span></div>
<div style="position:absolute;left:299.76px;top:553.52px" class="cls_005"><span class="cls_005">39</span></div>
<div style="position:absolute;left:310.56px;top:554.48px" class="cls_002"><span class="cls_002">Data da Coleta</span></div>
<div style="position:absolute;left:172.56px;top:561.20px" class="cls_002"><span class="cls_002">1- Positivo</span></div>
<div style="position:absolute;left:229.97px;top:561.20px" class="cls_002"><span class="cls_002">2- Negativo</span></div>
<div style="position:absolute;left:437.04px;top:562.88px" class="cls_002"><span class="cls_002">1 - Positivo</span></div>
<div style="position:absolute;left:485.80px;top:562.88px" class="cls_002"><span class="cls_002">2 - Negativo</span></div>
<div style="position:absolute;left:70.08px;top:567.68px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaViralFormatada}"></c:out></span></div>
<div style="position:absolute;left:100.08px;top:567.68px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:129.60px;top:567.68px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:144.47px;top:567.68px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:159.35px;top:567.68px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:172.56px;top:570.32px" class="cls_002"><span class="cls_002">3- Inconclusivo</span></div>
<div style="position:absolute;left:230.68px;top:570.32px" class="cls_002"><span class="cls_002">4 - Não realizado</span></div>
<div style="position:absolute;left:318.00px;top:568.16px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaRT_PCRFormatada}"></c:out></span></div>
<div style="position:absolute;left:347.04px;top:568.88px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:376.56px;top:568.88px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:391.43px;top:568.88px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:406.31px;top:568.88px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:437.04px;top:572.00px" class="cls_002"><span class="cls_002">3 - Inconclusivo  4 - Não Realizado</span></div>
<div style="position:absolute;left:221.52px;top:582.56px" class="cls_006"><span class="cls_006">Histopatologia</span></div>
<div style="position:absolute;left:392.64px;top:584.00px" class="cls_006"><span class="cls_006">Imunohistoquímica</span></div>
<div style="position:absolute;left:57.12px;top:596.24px" class="cls_005"><span class="cls_005">41</span></div>
<div style="position:absolute;left:67.92px;top:596.24px" class="cls_002"><span class="cls_002">Sorotipo</span></div>
<div style="position:absolute;left:222.24px;top:596.48px" class="cls_005"><span class="cls_005">42Resultado</span></div>
<div style="position:absolute;left:198.24px;top:599.48px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.sorotipo}"></c:out></span></div>
<div style="position:absolute;left:380.24px;top:601.48px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoHistopatologia}"></c:out></span></div>
<div style="position:absolute;left:555.24px;top:601.48px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosLaboratoriais.resultadoImunohistoquimica}"></c:out></span></div>
<div style="position:absolute;left:555.24px;top:645.48px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.conclusao.criterioConfirmacao}"></c:out></span></div>
<div style="position:absolute;left:398.64px;top:596.96px" class="cls_005"><span class="cls_005">43</span></div>
<div style="position:absolute;left:411.60px;top:595.04px" class="cls_005"><span class="cls_005">Resultado</span></div>
<div style="position:absolute;left:64.32px;top:634.88px" class="cls_005"><span class="cls_005">44</span></div>
<div style="position:absolute;left:77.76px;top:634.40px" class="cls_002"><span class="cls_002">Classificação</span></div>
<div style="position:absolute;left:350.88px;top:639.92px" class="cls_005"><span class="cls_005">45</span></div>
<div style="position:absolute;left:335.88px;top:639.92px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.conclusao.classificacao}"></c:out></span></div>
<div style="position:absolute;left:361.68px;top:638.96px" class="cls_002"><span class="cls_002">Critério de Confirmação/Descarte</span></div>
<div style="position:absolute;left:64.80px;top:648.56px" class="cls_002"><span class="cls_002">1 - Dengue Clássico</span></div>
<div style="position:absolute;left:178.08px;top:646.16px" class="cls_002"><span class="cls_002">3 - Febre Hemorrágica do Dengue - FHD</span></div>
<div style="position:absolute;left:178.08px;top:655.28px" class="cls_002"><span class="cls_002">4 - Síndrome do Choque da Dengue - SCD</span></div>
<div style="position:absolute;left:356.40px;top:654.08px" class="cls_002"><span class="cls_002">1 - Laboratório</span></div>
<div style="position:absolute;left:455.60px;top:654.08px" class="cls_002"><span class="cls_002">3 - Em Investigação</span></div>
<div style="position:absolute;left:64.80px;top:657.68px" class="cls_002"><span class="cls_002">2 - Dengue com Complicações</span></div>
<div style="position:absolute;left:178.08px;top:664.40px" class="cls_002"><span class="cls_002">5- Descartado</span></div>
<div style="position:absolute;left:356.40px;top:663.20px" class="cls_002"><span class="cls_002">2 - Clínico-Epidemiológico</span></div>
<div style="position:absolute;left:112.32px;top:680.72px" class="cls_008"><span class="cls_008">Os casos de dengue com complicações,  FHD e</span></div>
<div style="position:absolute;left:343.87px;top:680.72px" class="cls_008"><span class="cls_008">SCD:</span></div>
<div style="position:absolute;left:371.23px;top:680.72px" class="cls_008"><span class="cls_008">preencher a página seguinte.</span></div>
<div style="position:absolute;left:56.88px;top:695.84px" class="cls_006"><span class="cls_006">Local Provável de Infecção (no período de 15 dias)</span></div>
<div style="position:absolute;left:60.00px;top:708.80px" class="cls_005"><span class="cls_005">46</span></div>
<div style="position:absolute;left:71.52px;top:707.60px" class="cls_002"><span class="cls_002">O caso é autóctone do município de residência?</span></div>
<div style="position:absolute;left:344.16px;top:708.56px" class="cls_005"><span class="cls_005">47</span></div>
<div style="position:absolute;left:356.40px;top:707.84px" class="cls_002"><span class="cls_002">UF</span></div>
<div style="position:absolute;left:379.44px;top:708.32px" class="cls_005"><span class="cls_005">48</span></div>
<div style="position:absolute;left:393.12px;top:708.08px" class="cls_002"><span class="cls_002">País</span></div>
<div style="position:absolute;left:123.12px;top:722.24px" class="cls_002"><span class="cls_002">1-Sim</span></div>
<div style="position:absolute;left:150.02px;top:722.24px" class="cls_002"><span class="cls_002">2-Não</span></div>
<div style="position:absolute;left:177.39px;top:722.24px" class="cls_002"><span class="cls_002">3-Indeterminado</span></div>
<div style="position:absolute;left:355.68px;top:719.84px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.conclusao.estado.sigla}"></c:out></span></div>
<div style="position:absolute;left:395.68px;top:719.84px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.conclusao.pais.nome}"></c:out></span></div>
<div style="position:absolute;left:439.92px;top:732.56px" class="cls_005"><span class="cls_005">51</span></div>
<div style="position:absolute;left:451.68px;top:732.56px" class="cls_002"><span class="cls_002">Bairro</span></div>
<div style="position:absolute;left:451.68px;top:749.56px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.conclusao.bairro.descricao}"></c:out></span></div>
<div style="position:absolute;left:301.44px;top:736.64px" class="cls_005"><span class="cls_005">50</span></div>
<div style="position:absolute;left:305.44px;top:716.64px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.conclusao.localInfeccao}"></c:out></span></div>
<div style="position:absolute;left:312.72px;top:735.68px" class="cls_002"><span class="cls_002">Distrito</span></div>
<div style="position:absolute;left:312.72px;top:749.68px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.conclusao.distrito}"></c:out></span></div>
<div style="position:absolute;left:59.28px;top:738.08px" class="cls_005"><span class="cls_005">49</span><span class="cls_002">Município</span></div>
<div style="position:absolute;left:65.28px;top:750.08px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.conclusao.cidade.descricao}"></c:out></div>
<div style="position:absolute;left:218.16px;top:740.24px" class="cls_002"><span class="cls_002">Código (IBGE)</span></div>
<div style="position:absolute;left:217.92px;top:748.16px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.conclusao.cidade.ibge_codigo}"></c:out></span></div>
<div style="position:absolute;left:232.79px;top:748.16px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:247.67px;top:748.16px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:262.55px;top:748.16px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:277.43px;top:748.16px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:55.92px;top:764.00px" class="cls_005"><span class="cls_005">52</span></div>
<div style="position:absolute;left:69.60px;top:764.00px" class="cls_002"><span class="cls_002">Doença Relacionada ao Trabalho</span></div>
<div style="position:absolute;left:298.08px;top:761.84px" class="cls_005"><span class="cls_005">53</span></div>
<div style="position:absolute;left:280.08px;top:773.84px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.conclusao.doencaTrabalho}"></c:out></span></div>
<div style="position:absolute;left:311.04px;top:762.56px" class="cls_002"><span class="cls_002">Evolução do Caso</span></div>
<div style="position:absolute;left:318.96px;top:770.00px" class="cls_002"><span class="cls_002">1-Cura  2- Óbito por dengue  3- Óbito por outras causas  4-</span></div>
<div style="position:absolute;left:551.96px;top:770.00px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.conclusao.evolucaoCaso}"></c:out></span></div>
<div style="position:absolute;left:114.72px;top:776.48px" class="cls_002"><span class="cls_002">1 - Sim  2 - Não  9 - Ignorado</span></div>
<div style="position:absolute;left:318.96px;top:779.12px" class="cls_002"><span class="cls_002">Óbito em investigação 9- Ignorado</span></div>
<div style="position:absolute;left:59.76px;top:785.84px" class="cls_005"><span class="cls_005">54</span></div>
<div style="position:absolute;left:71.52px;top:787.28px" class="cls_002"><span class="cls_002">Data do Óbito</span></div>
<div style="position:absolute;left:191.04px;top:787.52px" class="cls_005"><span class="cls_005">55</span></div>
<div style="position:absolute;left:203.52px;top:787.28px" class="cls_002"><span class="cls_002">Data do Encerramento</span></div>
<div style="position:absolute;left:77.52px;top:798.80px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.conclusao.dataObitoFormatada}"></c:out></span></div>
<div style="position:absolute;left:106.56px;top:798.80px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:133.92px;top:798.80px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:148.79px;top:798.80px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:163.67px;top:798.80px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:209.52px;top:798.80px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.conclusao.dataEncerramentoFormatada}"></c:out></span></div>
<div style="position:absolute;left:239.28px;top:798.80px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:268.80px;top:799.52px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:283.67px;top:799.52px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:298.55px;top:799.52px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:54.72px;top:827.60px" class="cls_002"><span class="cls_002">Dengue</span></div>
<div style="position:absolute;left:292.32px;top:827.60px" class="cls_002"><span class="cls_002">Sinan NET / Sinan</span><span class="cls_015"> Online</span></div>
<div style="position:absolute;left:475.68px;top:826.64px" class="cls_002"><span class="cls_002"></span></div>
<div style="position:absolute;left:510.98px;top:826.64px" class="cls_002"><span class="cls_002"></span></div>
</div>
<div style="position:absolute;left:50%;margin-left:-297px;top:922px;width:595px;height:842px;border-style:outset;overflow:hidden">
<div style="position:absolute;left:0px;top:0px">
<img src="images/background2.jpg" width=595 height=842></div>
<div style="position:absolute;left:149.52px;top:33.92px" class="cls_007"><span class="cls_007">Dados clínicos (dengue com complicações, FHD e SCD)</span></div>
<div style="position:absolute;left:78.24px;top:51.20px" class="cls_012"><span class="cls_012">A</span><span class="cls_008"> FHD</span><span class="cls_012"> em geral desenvolve-se entre o 3º e o 5º dia de doença, quando há o recrudescimento da febre.</span></div>
<div style="position:absolute;left:69.36px;top:62.72px" class="cls_012"><span class="cls_012">A presença de dor abdominal intensa, hepatomegalia dolorosa, hipotermia com sudorese, letargia/agitação,</span></div>
<div style="position:absolute;left:83.28px;top:74.00px" class="cls_012"><span class="cls_012">cianose, arritmias, hipotensão arterial/postural, vômitos persistentes, manifestações neurológicas são</span></div>
<div style="position:absolute;left:93.84px;top:85.28px" class="cls_012"><span class="cls_012">indicadores de que o paciente pode evoluir para FHD ou para um quadro mais grave de dengue.</span></div>
<div style="position:absolute;left:60.48px;top:102.08px" class="cls_005"><span class="cls_005">56</span></div>
<div style="position:absolute;left:73.20px;top:102.56px" class="cls_002"><span class="cls_002">Manifestações Hemorrágicas?</span></div>
<div style="position:absolute;left:290.16px;top:101.84px" class="cls_002"><span class="cls_002">1- Sim</span></div>
<div style="position:absolute;left:319.92px;top:101.84px" class="cls_002"><span class="cls_002">2- Não</span></div>
<div style="position:absolute;left:349.92px;top:101.84px" class="cls_002"><span class="cls_002">9- Ignorado</span></div>
<div style="position:absolute;left:209.04px;top:103.28px" class="cls_002"><span class="cls_002">Se sim, quais?</span></div>
<div style="position:absolute;left:198.48px;top:104.48px" class="cls_005"><span class="cls_005">57</span></div>
<div style="position:absolute;left:182.48px;top:112.48px" class="cls_005"><span class="cls_005"><c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragica}"></c:out></span></div>
<div style="position:absolute;left:227.52px;top:114.80px" class="cls_002"><span class="cls_002">Epistaxe</span></div>

<div style="position:absolute;left:306.72px;top:114.80px" class="cls_002"><span class="cls_002">Gengivorragia</span></div>
<div style="position:absolute;left:399.84px;top:114.08px" class="cls_002"><span class="cls_002">Metrorragia</span></div>
<div style="position:absolute;left:469.20px;top:113.84px" class="cls_002"><span class="cls_002">Petéquias</span></div>
<div style="position:absolute;left:68.16px;top:126.32px" class="cls_002"><span class="cls_002">1- Sim</span></div>
<div style="position:absolute;left:97.92px;top:126.32px" class="cls_002"><span class="cls_002">2- Não</span></div>
<div style="position:absolute;left:127.92px;top:126.32px" class="cls_002"><span class="cls_002">9- Ignorado</span></div>
<div style="position:absolute;left:307.68px;top:129.92px" class="cls_002"><span class="cls_002">Sangramento Gastrointestinal</span></div>
<div style="position:absolute;left:468.72px;top:129.92px" class="cls_002"><span class="cls_002">Prova do Laço Positiva</span></div>
<div style="position:absolute;left:231.84px;top:132.32px" class="cls_002"><span class="cls_002">Hematúria</span></div>
<div style="position:absolute;left:58.56px;top:149.36px" class="cls_005"><span class="cls_005">58</span></div>
<div style="position:absolute;left:69.36px;top:148.64px" class="cls_002"><span class="cls_002">Houve extravasamento plasmático?</span></div>
<div style="position:absolute;left:212.64px;top:148.64px" class="cls_005"><span class="cls_005">59</span></div>
<div style="position:absolute;left:223.92px;top:148.64px" class="cls_002"><span class="cls_002">Se sim, Evidenciado por:</span></div>
<div style="position:absolute;left:72.24px;top:163.28px" class="cls_002"><span class="cls_002">1-Sim  2-Não  9-Ignorado</span></div>
<div style="position:absolute;left:271.68px;top:161.12px" class="cls_002"><span class="cls_002">1-Hemoconcentração</span></div>
<div style="position:absolute;left:351.65px;top:161.12px" class="cls_002"><span class="cls_002">2-Derrames cavitários</span></div>
<div style="position:absolute;left:433.29px;top:161.12px" class="cls_002"><span class="cls_002">3-Hipoproteinemia</span></div>
<div style="position:absolute;left:61.20px;top:178.64px" class="cls_005"><span class="cls_005">60</span></div>
<div style="position:absolute;left:74.40px;top:178.40px" class="cls_002"><span class="cls_002">Plaquetas (menor)</span></div>
<div style="position:absolute;left:230.64px;top:180.32px" class="cls_005"><span class="cls_005">61</span></div>
<div style="position:absolute;left:241.92px;top:179.36px" class="cls_002"><span class="cls_002">No Caso de FHD/SCD Especificar</span></div>
<div style="position:absolute;left:281.04px;top:191.60px" class="cls_002"><span class="cls_002">1 - Grau I</span></div>
<div style="position:absolute;left:336.24px;top:191.60px" class="cls_002"><span class="cls_002">2 - Grau II</span></div>
<div style="position:absolute;left:390.24px;top:191.60px" class="cls_002"><span class="cls_002">3 - Grau III</span></div>
<div style="position:absolute;left:447.60px;top:191.60px" class="cls_002"><span class="cls_002">4 - Grau IV</span></div>
<div style="position:absolute;left:111.60px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:126.47px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:141.35px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:156.23px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:171.11px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:185.98px;top:194.24px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:199.68px;top:192.56px" class="cls_002"><span class="cls_002">mm3</span></div>
<div style="position:absolute;left:56.88px;top:209.12px" class="cls_005"><span class="cls_005">62</span></div>
<div style="position:absolute;left:68.64px;top:208.64px" class="cls_002"><span class="cls_002">No Caso de Dengue com complicações, que tipo de complicações?</span></div>
<div style="position:absolute;left:69.84px;top:220.40px" class="cls_002"><span class="cls_002">1-Alterações neurológicas</span></div>
<div style="position:absolute;left:171.68px;top:220.40px" class="cls_002"><span class="cls_002">2-Disfunção cardiorrespiratória</span></div>
<div style="position:absolute;left:294.64px;top:220.40px" class="cls_002"><span class="cls_002">3-Insuficiência hepática</span></div>
<div style="position:absolute;left:390.48px;top:220.40px" class="cls_002"><span class="cls_002">4-Plaquetas &lt;20.000 mm3</span></div>
<div style="position:absolute;left:69.84px;top:229.52px" class="cls_002"><span class="cls_002">5-Hemorragia digestiva</span></div>
<div style="position:absolute;left:170.48px;top:229.52px" class="cls_002"><span class="cls_002">6-Derrames cavitários</span></div>
<div style="position:absolute;left:260.78px;top:229.52px" class="cls_002"><span class="cls_002">7-Leucometria</span></div>
<div style="position:absolute;left:311.94px;top:229.52px" class="cls_002"><span class="cls_002">&lt; 1000</span></div>
<div style="position:absolute;left:351.09px;top:229.52px" class="cls_002"><span class="cls_002">8-Não se enquadra nos critérios de FHD</span></div>
<div style="position:absolute;left:59.52px;top:251.12px" class="cls_005"><span class="cls_005">63</span></div>
<div style="position:absolute;left:187.20px;top:251.12px" class="cls_005"><span class="cls_005">64</span></div>
<div style="position:absolute;left:197.76px;top:250.88px" class="cls_002"><span class="cls_002">Data da Internação</span></div>
<div style="position:absolute;left:314.64px;top:250.64px" class="cls_005"><span class="cls_005">65</span></div>
<div style="position:absolute;left:326.40px;top:251.12px" class="cls_002"><span class="cls_002">UF</span></div>
<div style="position:absolute;left:352.80px;top:251.12px" class="cls_005"><span class="cls_005">66</span></div>
<div style="position:absolute;left:363.12px;top:250.16px" class="cls_002"><span class="cls_002">Município do Hospital</span></div>
<div style="position:absolute;left:69.84px;top:252.08px" class="cls_002"><span class="cls_002">Ocorreu Hospitalização?</span></div>
<div style="position:absolute;left:491.04px;top:253.52px" class="cls_002"><span class="cls_002">Código (IBGE)</span></div>
<div style="position:absolute;left:71.04px;top:265.28px" class="cls_002"><span class="cls_002">1 - Sim  2 - Não  9 - Ignorado</span></div>
<div style="position:absolute;left:214.32px;top:262.64px" class="cls_009"><span class="cls_009">|</span></div>
<div style="position:absolute;left:242.64px;top:262.64px" class="cls_009"><span class="cls_009">|</span></div>
<div style="position:absolute;left:199.92px;top:266.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:228.24px;top:266.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:257.04px;top:266.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:271.91px;top:266.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:286.79px;top:266.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:324.96px;top:264.80px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:491.76px;top:266.72px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:506.63px;top:266.72px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:521.51px;top:266.72px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:536.39px;top:266.72px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:551.27px;top:266.72px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:335.04px;top:284.00px" class="cls_002"><span class="cls_002">Código</span></div>
<div style="position:absolute;left:438.48px;top:282.80px" class="cls_005"><span class="cls_005">68</span></div>
<div style="position:absolute;left:452.40px;top:282.80px" class="cls_002"><span class="cls_002">(DDD) Telefone</span></div>
<div style="position:absolute;left:58.80px;top:284.48px" class="cls_005"><span class="cls_005">67</span></div>
<div style="position:absolute;left:70.56px;top:285.44px" class="cls_002"><span class="cls_002">Nome do Hospital</span></div>
<div style="position:absolute;left:343.44px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:358.31px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:373.19px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:388.07px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:402.95px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:417.82px;top:296.48px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:448.80px;top:295.52px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:460.56px;top:295.52px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:482.88px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:494.64px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:506.39px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:518.15px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:529.91px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:541.67px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:553.42px;top:296.00px" class="cls_003"><span class="cls_003">|</span></div>
<div style="position:absolute;left:183.36px;top:315.20px" class="cls_007"><span class="cls_007">Informações complementares e observações</span></div>
<div style="position:absolute;left:41.28px;top:333.20px" class="cls_008"><span class="cls_008">Observações Adicionais</span></div>
<div style="position:absolute;left:41.28px;top:353.20px" class="cls_008"><span class="cls_008">${notificacaoInvestigativa.observacoesAdicionais}</span></div>
<div style="position:absolute;left:56.64px;top:543.68px" class="cls_002"><span class="cls_002">Município/Unidade de Saúde</span></div>
<div style="position:absolute;left:56.64px;top:557.68px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.investigador.unidadeSaude.nome_fantasia}"></c:out></span></div>
<div style="position:absolute;left:460.32px;top:541.76px" class="cls_002"><span class="cls_002">Cód. da Unid. de Saúde</span></div>
<div style="position:absolute;left:470.16px;top:557.60px" class="cls_003"><span class="cls_003"><c:out value="${notificacaoInvestigativa.investigador.unidadeSaude.codigo_cnes}"></c:out></span></div>
<div style="position:absolute;left:485.03px;top:557.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:499.91px;top:557.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:514.79px;top:557.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:529.67px;top:557.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:544.54px;top:557.60px" class="cls_003"><span class="cls_003"></span></div>
<div style="position:absolute;left:55.92px;top:574.16px" class="cls_002"><span class="cls_002">Nome</span></div>
<div style="position:absolute;left:55.92px;top:589.16px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.investigador.nome}"></c:out></span></div>
<div style="position:absolute;left:252.48px;top:576.08px" class="cls_002"><span class="cls_002">Função</span></div>
<div style="position:absolute;left:252.48px;top:590.08px" class="cls_002"><span class="cls_002"><c:out value="${notificacaoInvestigativa.investigador.funcao}"></c:out></span></div>
<div style="position:absolute;left:469.92px;top:576.80px" class="cls_002"><span class="cls_002">Assinatura</span></div>
<div style="position:absolute;left:469.92px;top:586.80px" class="cls_002"><span class="cls_002"><img src="photos?id=<c:out value="${notificacaoInvestigativa.investigador.assinatura.id}"></c:out>" width="120" height="120" alt="<c:out value="${notificacaoInvestigativa.investigador.assinatura.nomeArqv}"></c:out>" /></span></div>
<div style="position:absolute;left:55.44px;top:603.20px" class="cls_002"><span class="cls_002">Dengue</span></div>
<div style="position:absolute;left:471.12px;top:606.32px" class="cls_002"><span class="cls_002"></span></div>
<div style="position:absolute;left:506.42px;top:606.32px" class="cls_002"><span class="cls_002"></span></div>
<div style="position:absolute;left:250.56px;top:613.76px" class="cls_002"><span class="cls_002">Sinan NET / Sinan</span><span class="cls_015"> Online</span></div>
</div>

</body>
</html>
