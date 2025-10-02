-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/08/2025 às 03:00
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tudofilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `num_estrelas` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `resenha` varchar(255) DEFAULT NULL,
  `id_filme` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacao`
--

INSERT INTO `avaliacao` (`num_estrelas`, `id_usuario`, `resenha`, `id_filme`, `data`, `hora`) VALUES
(5, 1, 'Muito Bom, a personagem principal é muito engraçada.\r\n', 8, '2025-08-07', '21:19'),
(1, 1, 'ruim, não gostei', 6, '2025-08-07', '21:29'),
(1, 61, 'ruim', 2, '2025-08-11', '18:06'),
(4, 65, 'Filme imersivo, fiquei grudado na cadeira até o fim do filme. Sou um fã fanático por fórmula 1, então obviamente fiquei com algumas pulgas atrás da orelha, mas não me questionei muito por ser hollywood, então eles precisam do drama deles', 1, '2025-08-04', '01:34'),
(5, 65, 'Sim', 3, '2025-08-04', '01:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `diretor`
--

CREATE TABLE `diretor` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `diretor`
--

INSERT INTO `diretor` (`id`, `nome`, `biografia`) VALUES
(1, 'Joseph Kosinski', 'Joseph Kosinski é um cineasta americano. É conhecido por seus filmes visuais marcantes. Dirigiu Tron: O Legado e Top Gun: Maverick. Especializa-se em ficção científica e ação. F1: The Movie é sua estreia no automobilismo.'),
(2, 'Dean DeBlois', 'Dean DeBlois é um animador e diretor canadense. Famoso por co-dirigir Lilo & Stitch. Também conhecido por Como Treinar o Seu Dragão. Trabalhou na Disney e DreamWorks. Seu estilo foca em narrativas emocionais.'),
(3, 'Jared Hess', 'Jared Hess é um diretor americano. Ficou famoso com Napoleon Dynamite. Especializa-se em comédias excêntricas. Trabalha com sua esposa Jerusha Hess. Um Filme Minecraft marca sua incursão no público infantil.'),
(4, 'David Lynch', 'David Lynch é um cineasta surrealista. Famoso por obras como Eraserhead e Twin Peaks. Ganhou o prêmio de melhor diretor em Cannes. Mistura mistério, terror e drama psicológico. Dirigiu o curta O Macaco.'),
(5, 'Julius Onah', 'Julius Onah é um cineasta nigeriano-americano. Dirigiu Luce e The Cloverfield Paradox. Seu trabalho explora questões sociais e raciais. Selecionado para dirigir Capitão América 4. Conhecido por sua abordagem intensa.'),
(6, 'Andrew Haigh', 'Andrew Haigh é um diretor britânico. Ganhou notoriedade com Weekend. Seu estilo é intimista e emocional. Dirigiu 45 Anos e Anora. Foco em relacionamentos humanos e narrativas sensíveis.'),
(7, 'Dougal Wilson', 'Dougal Wilson é um diretor britânico. Famoso por comerciais e videoclipes criativos. Estreou no cinema com Paddington 3. Tem estilo visual inventivo e leve. Conhecido por emocionar o público.'),
(8, 'Coralie Fargeat', 'Coralie Fargeat é uma diretora francesa. Ganhou destaque com Revenge. Seu estilo mistura horror e empoderamento feminino. Dirigiu A Substância, premiado em Cannes. É uma das vozes femininas no horror moderno.'),
(9, 'Denis Villeneuve', 'Denis Villeneuve é um diretor canadense. Famoso por A Chegada, Sicario e Blade Runner 2049. Dirigiu Duna Parte II com aclamação crítica. Seu estilo é visual, lento e atmosférico. Reconhecido por grandes produções sci-fi.'),
(10, 'Alex Garland', 'Alex Garland é roteirista e diretor britânico. Estreou com Ex Machina, aclamado pela crítica. Também dirigiu Aniquilação e Men. Seu estilo mistura filosofia e ficção científica. Eu e o Brilho da TV é sua obra mais recente.'),
(11, 'Luca Guadagnino', 'Luca Guadagnino é um diretor italiano. Famoso por Me Chame Pelo Seu Nome. Trabalha com temas de desejo e identidade. Dirigiu Rivais, um drama esportivo romântico. É elogiado por seu estilo sensorial e elegante.'),
(12, 'Robert Eggers', 'Robert Eggers é um diretor americano. Ganhou fama com A Bruxa e O Farol. Seu estilo é sombrio e baseado em períodos históricos. Dirige Nosferatu, uma releitura do clássico. É um dos principais nomes do horror moderno.'),
(13, 'Fede Álvarez', 'Fede Álvarez é diretor uruguaio. Conhecido por O Homem nas Trevas. Dirigiu o remake de A Morte do Demônio. Alien: Romulus marca sua entrada na franquia. Mistura suspense, tensão e ação intensa.'),
(14, 'George Miller', 'George Miller é um cineasta australiano. Criador da franquia Mad Max. Dirigiu Happy Feet e As Bruxas de Eastwick. Mistura ação, fantasia e humanidade. Furiosa é seu mais recente épico pós-apocalíptico.'),
(15, 'Christopher Nolan', 'Christopher Nolan é um diretor britânico-americano. Dirigiu Interestelar, Inception e Batman. Conhecido por narrativas não lineares e complexas. Oppenheimer explora a criação da bomba atômica. Ganhador do Oscar de Melhor Diretor.'),
(16, 'Greta Gerwig', 'Greta Gerwig é diretora e atriz americana. Estreou com Lady Bird e Adoráveis Mulheres. Dirigiu o fenômeno Barbie em 2023. Mistura feminismo e cultura pop. Seu estilo é íntimo, moderno e reflexivo.'),
(17, 'Joaquim Dos Santos', 'Joaquim Dos Santos é diretor de animação. Trabalhou em Avatar e Liga da Justiça. Dirigiu Aranhaverso 2 com Kemp Powers. Foco em estilo visual inovador e dinâmico. Elogiado por narrativa emocional e estética única.'),
(18, 'Chad Stahelski', 'Chad Stahelski é ex-dublê e diretor de ação. Estreou com John Wick. Dirigiu toda a franquia até o quarto filme. Foco em ação coreografada e estética noir. John Wick 4 é o mais ambicioso da série.'),
(19, 'Sébastien Vaniček', 'Sébastien Vaniček é um diretor francês. Ganhou destaque com Infestação. Foca em horror e tensão psicológica. Mistura realismo social com terror. Considerado nova voz do horror europeu.'),
(20, 'Aaron Horvath', 'Aaron Horvath é animador e diretor. Criador de Os Jovens Titãs em Ação. Dirigiu Super Mario Bros: O Filme. Estilo divertido e voltado para a família. Colabora com Michael Jelenic.'),
(21, 'Christopher McQuarrie', 'Christopher McQuarrie é roteirista e diretor americano. Famoso por Os Suspeitos e Missão Impossível. Parceria constante com Tom Cruise. Dirigiu o sétimo filme da franquia. Combina ação intensa e espionagem.'),
(22, 'Lana Wachowski', 'Lana Wachowski é diretora trans americana. Criadora de Matrix com sua irmã Lilly. Dirigiu o quarto filme da franquia sozinha. Famosa por sci-fi e temas de identidade. Estilo visual ousado e filosófico.'),
(23, 'Ridley Scott', 'Ridley Scott é um diretor britânico. Conhecido por Alien e Blade Runner. Dirigiu Gladiador e Napoleão. Mistura história com ação visual épica. Ícone do cinema com estilo inconfundível.'),
(24, 'James Cameron', 'James Cameron é canadense e diretor de blockbusters. Criador de Titanic e Avatar. Conhecido por inovações tecnológicas no cinema. Titanic ganhou 11 Oscars. Lidera o cinema em bilheterias globais.'),
(25, 'Peter Jackson', 'Peter Jackson é diretor neozelandês. Famoso por O Senhor dos Anéis. Ganhador de Oscar por O Retorno do Rei. Mistura épico, mitologia e emoção. Estilo grandioso e técnico.'),
(26, 'Todd Phillips', 'Todd Phillips é diretor americano. Começou com comédias como Se Beber, Não Case. Transformou sua carreira com Coringa. Mistura realismo, drama e crítica social. Indicado ao Oscar por direção.'),
(27, 'Bong Joon-ho', 'Bong Joon-ho é diretor sul-coreano. Ganhou o Oscar por Parasita. Mistura crítica social com gêneros híbridos. Estilo imprevisível e inovador. Considerado um dos melhores da atualidade.'),
(28, 'Ryan Coogler', 'Ryan Coogler é diretor afro-americano. Dirigiu Creed e Pantera Negra. Seu trabalho celebra heróis negros. Combina ação com temas culturais. Reconhecido por autenticidade e impacto.'),
(29, 'David Fincher', 'David Fincher é diretor americano. Famoso por Clube da Luta e Zodíaco. Estilo sombrio, preciso e cerebral. Clube da Luta virou cult. Trabalha frequentemente com suspense e mistério.'),
(30, 'Frank Darabont', 'Frank Darabont é diretor e roteirista. Famoso por Um Sonho de Liberdade. Também conhecido por adaptações de Stephen King. Estilo emocional e com temas de esperança. Reconhecido por seu toque humano.'),
(31, 'Francis Ford Coppola', 'Coppola é um dos maiores diretores da história. Criador de O Poderoso Chefão. Ganhou múltiplos Oscars. Estilo épico, político e psicológico. Influenciou gerações de cineastas.'),
(32, 'Steven Spielberg', 'Spielberg é um mestre do cinema mundial. Criador de E.T., Tubarão e Jurassic Park. Ganhador de múltiplos Oscars. Dirigiu A Lista de Schindler com impacto emocional. Mistura emoção, aventura e espetáculo.'),
(33, 'Robert Zemeckis', 'Robert Zemeckis é diretor americano. Dirigiu De Volta para o Futuro. Forrest Gump lhe rendeu um Oscar. Combina efeitos visuais e narrativa acessível. Estilo emocional e inovador.'),
(34, 'Roger Allers', 'Roger Allers é animador e diretor. Dirigiu O Rei Leão da Disney. Participou de A Bela e a Fera. Estilo clássico e comovente. Conhecido por impacto cultural e emocional.'),
(35, 'Anthony Russo', 'Anthony Russo dirige com seu irmão Joe. Comandaram Capitão América e Vingadores. Ultimato foi um sucesso mundial. Estilo épico com foco em personagens. Símbolos do universo Marvel.'),
(36, 'Martin Scorsese', 'Martin Scorsese é uma lenda do cinema americano. Dirigiu Taxi Driver e Os Bons Companheiros. Explora moralidade, crime e religião. Ganhador do Oscar por Os Infiltrados. Estilo intenso, realista e autoral.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filme`
--

CREATE TABLE `filme` (
  `id` int(11) NOT NULL,
  `nomeFilme` varchar(80) DEFAULT NULL,
  `media_estrelas` double DEFAULT NULL,
  `genero` varchar(80) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `sinopse` varchar(1000) DEFAULT NULL,
  `caminho_img` varchar(80) DEFAULT NULL,
  `link_trailer` varchar(255) DEFAULT NULL,
  `streamings` varchar(100) DEFAULT NULL,
  `ano_publicacao` year(4) DEFAULT NULL,
  `id_diretor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filme`
--

INSERT INTO `filme` (`id`, `nomeFilme`, `media_estrelas`, `genero`, `duracao`, `sinopse`, `caminho_img`, `link_trailer`, `streamings`, `ano_publicacao`, `id_diretor`) VALUES
(1, 'F1: The Movie', 4, '21, 16, 4', 120, 'Na década de 1990, Sonny Hayes era o piloto mais promissor da Fórmula 1 até que um acidente na pista quase encerrou sua carreira. Trinta anos depois, o proprietário de uma equipe de Fórmula 1 em dificuldades convence Sonny a voltar a correr e se tornar o melhor do mundo.', '../img/imgFilmes/filme1.jpg', 'https://www.youtube.com/embed/WKLMXlodrHw?si=apdz-8Dxrw0NMX2U', 'Apple TV', '2025', NULL),
(2, 'Lilo & Stitch', 2.6, '10, 5, 22', 108, 'Stitch, um alienígena, chega ao planeta Terra após fugir de sua prisão e tenta se passar por um cachorro para se camuflar. As coisas mudam quando Lilo, uma travessa menina, o adota de um abrigo de animais. Juntos, eles aprendem os valores da amizade e família.', '../img/imgFilmes/filme2.jpg', 'https://www.youtube.com/embed/oLnS1Ij9-Kk?si=nPms73FAHVjvvsSU', 'Disney +, Amazon Prime Video, Google Play Filmes, Apple TV', '2025', NULL),
(3, 'Um Filme Minecraft', 5, '10, 5, 2', 101, 'Um portal misterioso atrai quatro desajustados para o Overworld, uma terra das maravilhas bizarras e cúbicas que prospera com a imaginação. Para voltar para casa, eles têm que dominar o terreno enquanto embarcam em uma missão mágica com um construtor inesperado chamado Steve.', '../img/imgFilmes/filme3.jpg', 'https://www.youtube.com/embed/EVKYAAES6JQ?si=Yz4448rdA78LGBVX', 'Google Play Filmes, Amazon Prime Video, Apple TV', '2025', NULL),
(4, 'O Macaco', 3.6, '8, 34, 4', 98, 'Irmãos gêmeos encontram um misterioso macaco de corda. Após a descoberta, uma série de mortes absurdas destroça a família. Muitos anos depois, o macaco inicia uma nova onda de assassinatos, forçando os irmãos a enfrentar o brinquedo amaldiçoado.', '../img/imgFilmes/filme4.jpg', 'https://www.youtube.com/embed/husMGbXEIho?si=BeRe__w8ezK3iotf', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2025', NULL),
(5, 'Capitão America: Admiravel Mundo Novo', 3.5, '27, 1, 6', 118, 'Sam se vê no meio de um incidente internacional após se encontrar com o Presidente Thaddeus Ross. Ele precisa descobrir a razão por trás de um nefasto complô global antes que o verdadeiro mentor faça o mundo inteiro ver vermelho.', '../img/imgFilmes/filme5.jpg', 'https://www.youtube.com/embed/SCqjO_6HWuk?si=kM9GunuJrNw-r4N7', 'Disney+', '2025', NULL),
(6, 'Anora', 2.9, '4, 9, 30', 139, 'Anora, uma jovem stripper do Brooklyn, conhece o filho de um oligarca russo na boate em que trabalha. Os dois engatam um improvável romance e Anora vive uma história de Cinderela contemporânea por alguns dias.', '../img/imgFilmes/filme6.jpg', 'https://www.youtube.com/embed/K3f7jj8yJTo?si=c8Sf-ia6rU1xqu0U', 'Apple TV, Amazon Prime Video, Google Play Filmes', '2025', NULL),
(7, 'Paddington: Uma Aventura na Floresta', 3.5, '3, 22, 2', 105, 'Paddington e sua família adotiva, os Browns, decidem visitar sua tia Lucy no Peru, mas as circunstâncias os levam a desventuras na Floresta Amazônica e nas montanhas do Peru.', '../img/imgFilmes/filme7.jpg', 'https://www.youtube.com/embed/gGhEkjrKI0w?si=LmcWb7MOL64r_Bb8', 'HBO Max, Amazon Prime Video, Apple TV, Google Play Filmes', '2025', NULL),
(8, 'A Substância', 3.1, '7, 6, 34', 140, 'Elisabeth Sparkle, renomada por um programa de aeróbica, enfrenta um golpe devastador quando seu chefe a demite. Em meio ao seu desespero, um laboratório lhe oferece uma substância que promete transformá-la em uma versão aprimorada.', '../img/imgFilmes/filme8.jpg', 'https://www.youtube.com/embed/LNlrGhBpYjc?si=_F483ZoYc791dXB3', 'Amazon Prime Video, Apple TV', '2024', NULL),
(9, 'Duna Parte II', 4.5, '6, 53, 4', 166, 'Paul Atreides se une a Chani e aos Fremen enquanto busca vingança contra os conspiradores que destruíram sua família. Enfrentando uma escolha entre o amor de sua vida e o destino do universo, ele deve evitar um futuro terrível que só ele pode prever.', '../img/imgFilmes/filme9.jpg', 'https://www.youtube.com/embed/QqmbrvluQRA?si=AdlkYZV-sJ9FYQXX', 'HBO Max, Apple TV, Amazon Prime Video, Google Play Filmes', '2024', NULL),
(10, 'Eu vi o Brilho da TV', 2.6, '45, 29, 56', 100, 'Owen começa a assistir a um programa misterioso por influência de sua amiga Maddy. Mas o que parecia apenas uma série, revela os horrores do mundo sobrenatural. Diante do brilho fraco da TV, o vínculo de Owen com a realidade começa a se romper.', '../img/imgFilmes/filme10.jpg', 'https://www.youtube.com/embed/kymDzCgPwj0?si=i3yQlskxBlx0cSp8', 'HBO Max, Amazon Prime Video, Apple TV, Google Play Filmes', '2024', NULL),
(11, 'Rivais', 3.3, '4, 21, 9', 131, 'Um campeão de tênis do Grand Slam se vê do outro lado da rede do outrora promissor e agora esgotado Patrick, seu ex-melhor amigo e ex-namorado de sua esposa.', '../img/imgFilmes/filme11.jpg', 'https://www.youtube.com/embed/5bpSCdI7KV4?si=6OLAx6saFYjbPsBn', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2024', NULL),
(12, 'Nosferatu', 3.6, '7, 15, 17', 132, 'Uma jovem noiva é deixada sob os cuidados de amigos quando seu marido viaja para a Transilvânia para um encontro com o Conde Orlok. Atormentada por visões terríveis e uma crescente sensação de pavor, ela logo encontra uma força maligna que está muito além de sua compreensão.', '../img/imgFilmes/filme12.jpg', 'https://www.youtube.com/embed/moIrYMjS0nI?si=NpWHOJIZXJkVoIB5', 'Google Play Filmes, Amazon Prime Video, Apple TV', '2024', NULL),
(13, 'Alien: Romulus', 4, '6, 7, 8', 119, 'Um grupo de jovens colonizadores espaciais se aventuram nas profundezas de uma estação espacial abandonada. Lá, eles descobrem uma forma de vida aterrorizante, forçando-os a lutar por sua sobrevivência.', '../img/imgFilmes/filme13.jpg', 'https://www.youtube.com/embed/GTNMt84KT0k?si=Xs5E-PaCliEQ_GrN', 'Disney +', '2024', NULL),
(14, 'Furiosa: Uma Saga Mad Max', 4.1, '1, 24, 6', 148, 'A jovem Furiosa cai nas mãos de uma grande horda de motoqueiros liderada pelo senhor da guerra Dementus. Varrendo Wasteland, eles encontram a Cidadela, presidida pelo Immortan Joe. Enquanto os dois tiranos lutam pelo domínio, Furiosa logo se vê em uma batalha ininterrupta para voltar para casa.', '../img/imgFilmes/filme14.jpg', 'https://www.youtube.com/embed/HQOQTNVdxb8?si=CL3njV77N2BE3DGE', 'HBO Max, Apple TV, Google Play Filmes', '2024', NULL),
(15, 'Oppenheimer', 4.4, '16, 42, 20', 181, 'O físico J. Robert Oppenheimer trabalha com uma equipe de cientistas durante o Projeto Manhattan, levando ao desenvolvimento da bomba atômica.', '../img/imgFilmes/filme15.jpg', 'https://www.youtube.com/embed/F3OxA9Cz17A?si=fe9hWziIoPbnIMjl', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2023', NULL),
(16, 'Barbie', 3.4, '5, 3, 43', 114, 'Depois de ser expulsa da Barbieland por ser uma boneca de aparência menos do que perfeita, Barbie parte para o mundo humano em busca da verdadeira felicidade.', '../img/imgFilmes/filme16.jpg', 'https://www.youtube.com/embed/5CjOjZSKrqE?si=jgkpwlGtAD-TD036', 'HBO Max, Apple TV, Amazon Prime Video, Google Play Filmes', '2023', NULL),
(17, 'Homem-Aranha: Através do Aranhaverso', 4.4, '10, 27, 2', 140, 'Depois de se reunir com Gwen Stacy, Homem-Aranha é jogado no multiverso. Lá, o super-herói aracnídeo encontra uma numerosa equipe encarregada de proteger sua própria existência.', '../img/imgFilmes/filme17.jpg', 'https://www.youtube.com/embed/ayKgqMTGusk?si=z2MxVCkttutzrVvI', 'Amazon Prime Video, Apple TV, Youtube, Google Play Filmes', '2023', NULL),
(18, 'John Wick 4: Baba Yaga', 4.4, '1, 49, 8', 169, 'O ex-assassino de aluguel John Wick é procurado pelo mundo todo e a recompensa por sua captura aumenta cada vez mais. Wick descobre um caminho para derrotar a Alta Cúpula, mas antes de conquistar sua liberdade, ele precisa enfrentar um novo inimigo com alianças poderosas e forças que transformam velhos amigos em inimigos.', '../img/imgFilmes/filme18.jpg', 'https://www.youtube.com/embed/qEVUtrk8_B4?si=Lrl4YdxkMFPOZVSH', 'Telecine, Amazon Prime Video, Youtube, Apple TV, Google Play Filmes', '2023', NULL),
(19, 'Infestação', 2.6, '7, 31, 6', 105, 'Apaixonado por animais exóticos, Kaleb traz para casa uma aranha venenosa, mas ela acidentalmente foge. Logo, seus vizinhos começam a lutar contra um exército de aranhas mortais e que rapidamente se reproduzem.', '../img/imgFilmes/filme19.jpg', 'https://www.youtube.com/embed/LR-uiy20_zM?si=cE9JZZxpi7zaMVz-', 'Amazon Prime Video, Apple TV, Youtube, Google Play Filmes', '2023', NULL),
(20, 'Super Mario Bros: O Filme', 4.5, '10, 5, 3', 92, 'Mario e seu irmão Luigi são encanadores do Brooklyn, em Nova York. Um dia, eles vão parar no reino dos cogumelos, governado pela Princesa Peach. O local é ameaçado por Bowser, rei dos Koopas, que faz de tudo para conseguir reinar em todos os lugares.', '../img/imgFilmes/filme20.jpg', 'https://www.youtube.com/embed/Hgupo95fulk?si=PfkbRvo4vpl7OvhZ', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2023', NULL),
(21, 'Missão Impossível 7: Acerto de Contas Parte I', 4.5, '1, 44, 8', 163, 'Ethan Hunt e sua equipe devem rastrear uma nova arma que pode ameaçar toda a humanidade se cair em mãos erradas. Com o destino do mundo em jogo, se inicia uma corrida mortal ao redor do globo. Confrontado por um inimigo misterioso e poderoso, Ethan é forçado a considerar que talvez nada importe mais do que a missão, nem mesmo as vidas daqueles com quem ele mais se importa.', '../img/imgFilmes/filme21.jpg', 'https://www.youtube.com/embed/avz06PDqDbM?si=D8E90LBZmhELOexp', 'Amazon Prime Video, Apple TV, Paramount +, Google Play Filmes', '2023', NULL),
(22, 'A Origem', 4.8, '1, 2, 6', 148, 'Cobb lidera uma equipe que invade sonhos para plantar ideias na mente.  \r\n Dividido entre missões e suas lembranças, ele luta para voltar para casa.  \r\n Cada camada de sonho aumenta os riscos e os espetaculares efeitos visuais.  \r\n Um thriller cerebral que mistura ação com emoção profunda.', '../img/imgFilmes/filme22.jpg', 'https://www.youtube.com/embed/R_VX0e0PX90', 'Netflix, Amazon Prime', '2010', NULL),
(23, 'Matrix', 4.8, '6, 1, 26', 136, 'Neo descobre que a realidade é uma simulação controlada por máquinas.  \r\n Ele é recrutado pela resistência liderada por Morpheus para libertar a humanidade.  \r\n Entre lutas icônicas e filosofia, o filme questiona a percepção humana.  \r\n Um marco da ficção científica com estilo cyberpunk e efeitos revolucionários.', '../img/imgFilmes/filme23.jpg', 'https://www.youtube.com/embed/vKQi3bBA1y8', 'Netflix, Amazon Prime', '1999', NULL),
(24, 'Gladiador', 4.5, '1, 4, 20', 155, 'Maximus é um general traído e torna-se escravo antes de virar gladiador.  \r\n No Coliseu, ele busca justiça e vingança contra o imperador corrupto.  \r\n A história mistura honra, perda e espetaculares cenas de batalha.  \r\n Um épico que ressoa até hoje com emoção e valores antigos.', '../img/imgFilmes/filme24.jpg', 'https://www.youtube.com/embed/owK1qxDselE', 'Netflix', '2000', NULL),
(25, 'Titanic', 4.4, '9, 4, 41', 195, 'Jack e Rose vivem um amor proibido a bordo do luxuoso Titanic.  \r\n A tragédia se aproxima quando o navio colide com um iceberg.  \r\n Entre romance e horror, o filme retrata coragem e desespero.  \r\n Uma das maiores produções românticas e visuais do cinema.', '../img/imgFilmes/filme25.jpg', 'https://www.youtube.com/embed/EXL0TQVXLBQ', 'Star+', '1997', NULL),
(26, 'Mad Max: Estrada da Fúria', 4.3, '1, 25, 2', 120, 'Num mundo árido, Max e Furiosa ajudam um grupo de mulheres a escapar.  \r\n Perseguições intensas por estradas cheias de perigos.  \r\n O filme mistura ação quase sem pausa com narrativa visual impactante.  \r\n Uma reinvenção do gênero pós-apocalíptico, cheia de adrenalina.', '../img/imgFilmes/filme26.jpg', 'https://www.youtube.com/embed/hEJnMQG9ev8', 'HBO Max', '2015', NULL),
(27, 'O Senhor dos Anéis: A Sociedade do Anel', 4.9, '5, 2, 53', 178, 'Frodo e seus amigos começam a jornada para destruir o Um Anel.  \r\n A Sociedade viaja por lugares perigosos na Terra-média.  \r\n Entre magos, elfos e batalhas, a união enfrenta ameaças crescentes.  \r\n Um épico de fantasia que definiu gerações e impacto cultural.', '../img/imgFilmes/filme27.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4', 'HBO Max', '2001', NULL),
(28, 'Coringa', 4.6, '4, 13, 35', 122, 'Arthur Fleck luta contra depressão em uma Gotham cruel.  \r\n Desprezado socialmente, ele se torna o icônico vilão.  \r\n O filme explora saúde mental, envelhecimento e violência urbana.  \r\n Uma interpretação intensa e perturbadora de um anti-herói.', '../img/imgFilmes/filme28.jpg', 'https://www.youtube.com/embed/zAGVQLHvwOY', 'HBO Max', '2019', NULL),
(29, 'Parasita', 4.7, '4, 35, 43', 132, 'Uma família pobre se infiltra na casa de uma família rica.  \r\n O que começa como subterfúgio torna-se uma espiral inesperada.  \r\n O filme mistura humor, suspense e crítica social elegante.  \r\n Vencedor do Oscar, destaca as desigualdades com precisão.', '../img/imgFilmes/filme29.jpg', 'https://www.youtube.com/embed/SEUXfv87Wpk', 'Globoplay, Telecine', '2019', NULL),
(30, 'Pantera Negra', 4.2, '27, 1, 6', 134, 'T’Challa retorna a Wakanda para assumir o trono real.  \r\n Ele enfrenta desafios internos e inimigos poderosos.  \r\n Wakanda, rica em tecnologia, representa poder e cultura vibrante.  \r\n Um marco da representatividade no universo de super-heróis.', '../img/imgFilmes/filme30.jpg', 'https://www.youtube.com/embed/xjDjIWPwcPU', 'Disney+', '2018', NULL),
(31, 'Clube da Luta', 4.7, '4, 35, 49', 139, 'Um narrador entediado forma um clube de luta com Tyler Durden.  \r\n A subversão da existência cotidiana o leva à anarquia.  \r\n Entre filosofia, humor negro e violência, questiona identidade.  \r\n Um filme provocativo que virou fenômeno cultural.', '../img/imgFilmes/filme31.jpg', 'https://www.youtube.com/embed/qtRKdVHc-cE', 'Star+', '1999', NULL),
(32, 'Um Sonho de Liberdade', 4.8, '1, 4, 20', 142, 'Na prisão de Shawshank, o banqueiro Andy Dufresne é condenado por um crime que não cometeu.\nEnquanto cumpre pena, faz amizade com Red, um preso influente na carceragem.\nJuntos, enfrentam a dura rotina prisional e descobrem esperança em pequenas coisas.\nAndy planeja uma fuga meticulosa ao longo dos anos.\nA história evolui para um poderoso retrato de redenção e liberdade emocional.', '../img/imgFilmes/filme32.jpg', 'https://www.youtube.com/embed/NmzuHjWmXOc', 'Netflix, Telecine Play', '1994', NULL),
(33, 'O Poderoso Chefão', 4.8, '1, 13, 20', 175, 'Don Vito Corleone é o chefe poderoso de uma família mafiosa em Nova York.\nApós um atentado fracassado, seu filho Michael assume responsabilidades inusitadas.\nA trama se aprofunda nos conflitos de poder, lealdade e moral.\nMichael passa por uma transformação drástica em prol da família.\nUm épico do crime que marcou a história do cinema.', '../img/imgFilmes/filme33.jpg', 'https://www.youtube.com/embed/sY1S34973zA', 'Paramount+, Star+', '1972', NULL),
(34, 'A Lista de Schindler', 4.8, '20, 16, 4', 195, 'Durante a Segunda Guerra Mundial, Oskar Schindler emprega judeus na sua fábrica em Cracóvia.\nEle usa sua influência para salvá-los do Holocausto.\nA lista de nomes de trabalhadores se torna sinônimo de vida.\nEm meio à barbárie, surgem atos de coragem e humanidade.\nUm relato emocionante sobre redenção e memória histórica.', '../img/imgFilmes/filme34.jpg', 'https://www.youtube.com/embed/gG22XNhtnoY', 'Netflix, HBO Max', '1993', NULL),
(35, 'Forrest Gump', 4.7, '3, 4, 9', 140, 'Forrest, com QI baixo, conta sua saga desde a infância até se tornar figura central em eventos históricos.\nParticipa da Guerra do Vietnã, conhece presidentes e influencia a cultura pop.\nSeu amor por Jenny é constante apesar dos altos e baixos da vida.\nA inocência de Forrest contrasta com o contexto turbulento dos EUA.\nUm filme sobre destino, amizade e simplicidade tocante.', '../img/imgFilmes/filme35.jpg', 'https://www.youtube.com/embed/bLvqoHBptjg', 'Amazon Prime Video, HBO Max', '1994', NULL),
(36, 'O Rei Leão', 4.7, '2, 10, 22', 89, 'O leãozinho Simba sonha em se tornar rei de uma grande savana africana.\nApós a morte de seu pai, ele foge, sentindo culpa.\nFaz amigos como Timão e Pumba e descobre sua coragem.\nRetorna para enfrentar seu tio Scar e reivindicar seu lugar.\nUma jornada musical sobre crescimento, responsabilidade e legado.', '../img/imgFilmes/filme36.jpg', 'https://www.youtube.com/embed/7TavVZMewpY', 'Disney+, Telecine Play', '1994', NULL),
(37, 'À Espera de Um Milagre', 4.7, '1, 4, 5', 189, 'Na prisão, o guarda Paul descobre que o gigante John Coffey tem poderes de cura.\nCoffey, condenado injustamente, transforma vidas ao seu redor.\nO filme mistura sofrimento, fé e milagres em um ambiente opressor.\nPaul e Coffey desenvolvem laços profundos além da hierarquia carcerária.\nUma fábula sensível sobre compaixão e o poder de acreditar no impossível.', '../img/imgFilmes/filme37.jpg', 'https://www.youtube.com/embed/Ki4haFrqSrw', 'Netflix, Now', '1999', NULL),
(38, 'O Senhor dos Anéis: O Retorno do Rei', 4.7, '2, 5, 53', 201, 'A Guerra do Anel chega ao auge com a marcha de Sauron contra Gondor.\nGandalf e Pippin viajam para Minas Tirith para defender a cidade.\nFrodo e Sam enfrentam perigos mortais em Mordor para destruir o Um Anel.\nHeróis surgem em batalhas épicas decisivas pelo destino da Terra Média.\nUm desfecho grandioso para trilogia consagrada.', '../img/imgFilmes/filme38.jpg', 'https://www.youtube.com/embed/r5X-hFf6Bwo', 'Amazon Prime Video, HBO Max', '2003', NULL),
(39, 'O Cavaleiro das Trevas', 4.7, '1, 7, 8', 152, 'Batman enfrenta o caos instaurado pelo Coringa em Gotham City.\nCom apoio de Gordon e Dent, busca restaurar a ordem.\nO Coringa lança desafios morais e coloca o vigilante contra seus limites.\nAs fronteiras entre heroísmo e loucura se confundem.\nUm thriller de ação com dilemas éticos intensos.', '../img/imgFilmes/filme39.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY', 'Netflix, HBO Max', '2008', NULL),
(40, 'Vingadores: Ultimato', 4.7, '1, 2, 6', 181, 'Após o estalo de Thanos, os heróis remanescentes planejam reverter o desastre.\nEles viajam no tempo para coletar as Joias do Infinito.\nSacrifícios pessoais e batalhas épicas movem o clímax da saga.\nO destino do universo está em jogo num confronto final.\nUm épico de super-heróis com emoção e fan service.', '../img/imgFilmes/filme40.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', 'Disney+, Star+', '2019', NULL),
(41, 'Taxi Driver', 4.4, '1, 4, 8', 114, 'Travis Bickle é um taxista solitário pela Nova York decadente dos anos 70.\nSofre de insônia e repulsa pelo comportamento urbano.\nDesenvolve obsessão por salvar Iris, jovem prostituta.\nSua instabilidade cresce entre violência e idealização moral.\nUm estudo psicológico angustiante sobre alienação urbana.', '../img/imgFilmes/filme41.jpg', 'https://www.youtube.com/embed/UUxD4-dEzn0', 'Amazon Prime Video, Paramount+', '1976', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `genero` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `genero`
--

INSERT INTO `genero` (`id`, `genero`) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Comédia'),
(4, 'Drama'),
(5, 'Fantasia'),
(6, 'Ficção Científica'),
(7, 'Terror'),
(8, 'Suspense'),
(9, 'Romance'),
(10, 'Animação'),
(11, 'Documentário'),
(12, 'Musical'),
(13, 'Policial'),
(14, 'Guerra'),
(15, 'Mistério'),
(16, 'Biografia'),
(17, 'Western'),
(18, 'Noir'),
(19, 'Crime'),
(20, 'Histórico'),
(21, 'Esporte'),
(22, 'Família'),
(23, 'Fantasia Urbana'),
(24, 'Comédia Romântica'),
(25, 'Apocalíptico'),
(26, 'Cyberpunk'),
(27, 'Super-herói'),
(28, 'Religioso'),
(29, 'Surrealismo'),
(30, 'Filme Cult'),
(31, 'Zumbi'),
(32, 'Steampunk'),
(33, 'Drama Jurídico'),
(34, 'Filme de Tribunal'),
(35, 'Thriller Psicológico'),
(36, 'Road Movie'),
(37, 'Drama Médico'),
(38, 'Coming of Age'),
(39, 'Filme de Dança'),
(40, 'Mockumentário'),
(41, 'Filme Catástrofe'),
(42, 'Drama Político'),
(43, 'Satírico'),
(44, 'Espionagem'),
(45, 'Filme Experimental'),
(46, 'Artes Marciais'),
(47, 'Filme Mudo'),
(48, 'Filme Épico'),
(49, 'Neo-noir'),
(50, 'Drama Criminal'),
(51, 'Comédia de Erros'),
(52, 'Thriller Político'),
(53, 'Fantasia Épica'),
(54, 'Filme de Gangster'),
(55, 'Filme de Realeza'),
(56, 'Docuficção'),
(57, 'Comédia Pastelão'),
(58, 'Realismo Mágico'),
(59, 'Filme de Vingança'),
(60, 'Filme de Sobrevivência');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `senha` varchar(80) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `caminho_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `dataNasc`, `caminho_img`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '0000-00-00', '../img/imgUsuario/user1.png'),
(61, 'Nicolas Pascual Sales', 'nicolas.sales@aluno.ifsp.ed.br', 'senhafodastica', '2008-03-14', '../img/imgUsuario/user61.png'),
(63, 'Hiran', 'hiran@gmail.com', 'hiran', '2007-01-17', '../img/imgUsuario/user63.png'),
(64, 'Hiran', 'hiranmattins@gmail.com', '123', '2007-01-17', NULL),
(65, 'Hiran de Souza Martins', 'hiran.m@aluno.ifsp.edu.br', 'Souz@2007', '2007-01-17', '../img/imgUsuario/user65.png');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices de tabela `diretor`
--
ALTER TABLE `diretor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_diretor` (`id_diretor`);

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `diretor`
--
ALTER TABLE `diretor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`);

--
-- Restrições para tabelas `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_diretor`) REFERENCES `diretor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
