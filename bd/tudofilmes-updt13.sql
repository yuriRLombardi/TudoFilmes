-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/05/2026 às 23:45
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
(5, 72, 'Muito bom', 9, '2025-08-18', '02:03'),
(3, 73, 'Filme muito bom', 30, '2026-05-21', '16:42'),
(5, 73, 'Filme muito bom', 7, '2026-05-21', '20:07'),
(5, 73, 'Filme top', 21, '2026-05-21', '20:10'),
(3, 73, 'Furiosa é demais', 14, '2026-05-21', '20:24'),
(5, 72, 'Pantera Negra, meu personagem favorito', 30, '2026-05-21', '20:34'),
(5, 72, 'Pantera Negra, meu personagem favorito', 30, '2026-05-21', '20:34'),
(5, 72, 'Cinema', 1, '2026-05-21', '20:35'),
(3, 73, 'Filme espetacular', 1, '2026-05-21', '20:36'),
(4, 73, 'Resolvi mudar a nota', 1, '2026-05-21', '20:38'),
(5, 73, 'Mario é incrivel no jogo e no filme', 20, '2026-05-21', '20:39'),
(5, 73, 'Os simpsons sõa pura comedia', 44, '2026-05-21', '20:44'),
(5, 73, 'Nota 5/5', 35, '2026-05-21', '20:46'),
(5, 73, 'Hilário', 45, '2026-05-21', '20:58');

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
(1, 'Joseph Kosinski', 'Joseph Kosinski é um diretor e roteirista norte-americano conhecido por seu estilo visual futurista. Dirigiu filmes como Tron: O Legado e Top Gun: Maverick. É formado em arquitetura, o que influencia suas composições cinematográficas. Seu trabalho mistura efeitos visuais impressionantes e narrativa intensa. É considerado um dos grandes nomes do cinema de ação moderno.'),
(2, 'Dean Fleischer Camp', 'Dean Fleischer Camp é um cineasta e editor norte-americano. Ficou conhecido por criar a série e o filme Marcel the Shell with Shoes On. Seu trabalho mistura humor e sensibilidade emocional. Também atua como roteirista em diversos projetos. É reconhecido por seu estilo criativo e inovador.'),
(3, 'Jared Hess', 'Jared Hess é um diretor, roteirista e produtor americano. Tornou-se famoso pelo filme Napoleão Dinamite. Trabalha frequentemente com comédias excêntricas e personagens peculiares. Seu humor único conquistou público e crítica. Também dirigiu A Lenda de Longhorn e outros projetos televisivos.'),
(4, 'Oz Perkins', 'Oz Perkins é um diretor e roteirista americano especializado em terror psicológico. Filho do ator Anthony Perkins, ficou conhecido por filmes como The Blackcoat’s Daughter e Gretel & Hansel. Seu estilo é marcado por narrativas lentas e atmosfera inquietante. É elogiado pelo uso criativo de luz e som. Atua também como roteirista em Hollywood.'),
(5, 'Julius Onah', 'Julius Onah é um cineasta nigeriano-americano. Dirigiu O Paradoxo Cloverfield e Luce, recebendo elogios da crítica. Seu trabalho aborda temas sociais e complexos dilemas humanos. Formado na NYU, conquistou espaço no cinema independente e comercial. É considerado um diretor versátil e promissor.'),
(6, 'Sean Baker', 'Sean Baker é um diretor e roteirista norte-americano conhecido por filmes independentes. Dirigiu Tangerine e Projeto Flórida, aclamados pela crítica. Seu trabalho frequentemente retrata personagens marginalizados. Utiliza recursos de filmagem inovadores e realistas. É admirado por sua abordagem sensível e autêntica.'),
(7, 'Dougal Wilson', 'Dougal Wilson é um diretor britânico especializado em comerciais e videoclipes. Reconhecido por sua criatividade visual, já dirigiu para marcas globais e artistas renomados. Sua estreia em longas veio com Paddington in Peru. Tem um estilo lúdico e visualmente marcante. É elogiado por combinar narrativa e estética com habilidade.'),
(8, 'Coralie Fargeat', 'Coralie Fargeat é uma diretora e roteirista francesa. Ficou conhecida pelo filme de ação e terror Revenge. Seu trabalho é marcado por protagonistas femininas fortes e violência estilizada. Recebeu destaque em festivais internacionais. É vista como uma das novas vozes do cinema francês.'),
(9, 'Denis Villeneuve', 'Denis Villeneuve é um diretor canadense amplamente aclamado. Dirigiu obras como A Chegada, Blade Runner 2049 e Duna. É conhecido por sua fotografia detalhada e narrativas densas. Trabalha com grandes estúdios e também no cinema independente. É considerado um mestre contemporâneo da ficção científica.'),
(10, 'Jane Schoenbrun', 'Jane Schoenbrun é uma cineasta e escritora norte-americana. Seu trabalho explora temas de identidade e realidade digital. Dirigiu We’re All Going to the World’s Fair, elogiado pela crítica. É reconhecida por sua abordagem experimental. Defende narrativas inclusivas e autorais.'),
(11, 'Luca Guadagnino', 'Luca Guadagnino é um diretor e produtor italiano. Tornou-se conhecido por Me Chame Pelo Seu Nome. Dirigiu também Suspiria e Bones and All. Seu estilo é marcado por narrativas sensuais e visualmente sofisticadas. É elogiado por explorar emoções humanas de forma intensa.'),
(12, 'Robert Eggers', 'Robert Eggers é um diretor e roteirista americano. Ganhou destaque com A Bruxa, seguido por O Farol e O Homem do Norte. Seu trabalho é conhecido pela precisão histórica e atmosfera sombria. É meticuloso com detalhes de produção. É considerado um dos maiores talentos do terror moderno.'),
(13, 'Fede Álvarez', 'Fede Álvarez é um diretor uruguaio especializado em filmes de suspense e terror. Ficou conhecido pelo remake de A Morte do Demônio. Dirigiu também O Homem nas Trevas e Alien: Romulus. É elogiado pelo uso de tensão e atmosfera. Trabalha frequentemente com efeitos práticos.'),
(14, 'George Miller', 'George Miller é um cineasta australiano lendário. Criador da franquia Mad Max, também dirigiu Happy Feet e Babe. Seu trabalho varia do épico de ação ao cinema infantil. É mestre em cenas de perseguição e ação prática. Recebeu múltiplos prêmios internacionais.'),
(15, 'Christopher Nolan', 'Christopher Nolan é um diretor britânico conhecido por narrativas complexas. Dirigiu A Origem, Interestelar e a trilogia O Cavaleiro das Trevas. Seu estilo mistura realismo com conceitos de ficção científica. É reconhecido pelo uso mínimo de CGI. É um dos diretores mais influentes do século XXI.'),
(16, 'Greta Gerwig', 'Greta Gerwig é uma diretora, roteirista e atriz norte-americana. Dirigiu Lady Bird, Adoráveis Mulheres e Barbie. É elogiada por sua escrita sensível e personagens femininas complexas. Tem forte presença no cinema independente. Tornou-se referência para novas cineastas.'),
(17, 'Joaquim Dos Santos', 'Joaquim Dos Santos é um diretor e animador brasileiro radicado nos EUA. Trabalhou em séries como Avatar: A Lenda de Aang e Justiça Jovem. Co-dirigiu Homem-Aranha: Através do Aranhaverso. É elogiado pelo uso dinâmico de animação. Contribuiu para produções premiadas.'),
(18, 'Chad Stahelski', 'Chad Stahelski é um diretor e ex-dublê norte-americano. Ficou conhecido pela franquia John Wick. Tem experiência extensa em coreografia de lutas. É admirado pela execução de cenas de ação realistas. Seu trabalho redefiniu o gênero de ação contemporâneo.'),
(19, 'Sébastien Vaniček', 'Sébastien Vaniček é um diretor francês especializado em filmes de terror. Ficou conhecido pelo longa Vermin. Seu estilo valoriza tensão psicológica e efeitos práticos. Trabalha com histórias de horror urbano. É considerado uma nova promessa do gênero.'),
(20, 'Aaron Horvath', 'Aaron Horvath é um animador, roteirista e diretor norte-americano. Co-criou a série Jovens Titãs em Ação. Dirigiu Super Mario Bros: O Filme. Seu trabalho combina humor e ação. É reconhecido pela animação vibrante e ritmo acelerado.'),
(21, 'Christopher McQuarrie', 'Christopher McQuarrie é um roteirista e diretor norte-americano. Ganhou o Oscar por Os Suspeitos. Dirigiu vários filmes da franquia Missão Impossível. É conhecido por roteiros inteligentes e ação intensa. Trabalha frequentemente com Tom Cruise.'),
(22, 'Lana Wachowski', 'Lana Wachowski é uma cineasta norte-americana. Co-criou Matrix e dirigiu suas sequências. Seu trabalho mistura ficção científica e filosofia. É reconhecida por narrativas inovadoras e visual marcante. Defende temas de identidade e liberdade pessoal.'),
(23, 'Ridley Scott', 'Ridley Scott é um diretor britânico renomado. Dirigiu clássicos como Alien, Blade Runner e Gladiador. É mestre em criar mundos visuais detalhados. Trabalha em diversos gêneros, do épico ao suspense. Recebeu inúmeros prêmios durante sua carreira.'),
(24, 'James Cameron', 'James Cameron é um diretor, roteirista e produtor canadense. Dirigiu Titanic, Avatar e O Exterminador do Futuro 2. É pioneiro no uso de tecnologia 3D e captura de movimento. Seus filmes são campeões de bilheteria. É reconhecido por sua ambição cinematográfica.'),
(25, 'Peter Jackson', 'Peter Jackson é um cineasta neozelandês. Dirigiu a trilogia O Senhor dos Anéis e O Hobbit. É conhecido por produções épicas e efeitos visuais grandiosos. Recebeu múltiplos Oscars por O Retorno do Rei. É uma figura central no cinema fantástico.'),
(26, 'Todd Phillips', 'Todd Phillips é um diretor e roteirista norte-americano. Ficou famoso por Se Beber, Não Case! e Coringa. Seu estilo varia da comédia ao drama intenso. É conhecido por explorar personagens complexos. Recebeu indicações ao Oscar.'),
(27, 'Bong Joon-ho', 'Bong Joon-ho é um diretor sul-coreano. Ficou mundialmente famoso por Parasita, vencedor do Oscar de Melhor Filme. Dirigiu também O Hospedeiro e Expresso do Amanhã. É mestre em misturar gêneros e críticas sociais. É reconhecido internacionalmente.'),
(28, 'Ryan Coogler', 'Ryan Coogler é um diretor e roteirista americano. Dirigiu Fruitvale Station, Creed e Pantera Negra. Seu trabalho aborda questões raciais e sociais. É reconhecido pelo impacto cultural de suas obras. Tornou-se um dos diretores mais influentes de sua geração.'),
(29, 'David Fincher', 'David Fincher é um diretor norte-americano. É conhecido por Seven, Clube da Luta e A Rede Social. Seu estilo é marcado por precisão técnica e tom sombrio. Trabalha com narrativas complexas e visual meticuloso. Recebeu diversas indicações ao Oscar.'),
(30, 'Frank Darabont', 'Frank Darabont é um diretor, roteirista e produtor. É famoso por Um Sonho de Liberdade e À Espera de um Milagre. Adapta frequentemente obras de Stephen King. É elogiado por sua sensibilidade dramática. Também trabalhou em séries de TV como The Walking Dead.'),
(31, 'Francis Ford Coppola', 'Francis Ford Coppola é um diretor e roteirista americano. Tornou-se lendário por O Poderoso Chefão. Também dirigiu Apocalypse Now. É considerado um dos maiores diretores da história do cinema. Seu trabalho influenciou gerações de cineastas.'),
(32, 'Steven Spielberg', 'Steven Spielberg é um diretor, roteirista e produtor norte-americano. Dirigiu clássicos como Tubarão, Jurassic Park e A Lista de Schindler. É um dos cineastas mais premiados e influentes. Seu estilo combina emoção e espetáculo visual. Fundou estúdios e apoiou jovens cineastas.'),
(33, 'Robert Zemeckis', 'Robert Zemeckis é um diretor e produtor americano. Dirigiu De Volta para o Futuro e Forrest Gump. É conhecido por inovações técnicas e narrativas emocionantes. Mistura efeitos visuais e storytelling eficaz. Recebeu diversos prêmios ao longo da carreira.'),
(34, 'Rob Minkoff', 'Rob Minkoff é um diretor e animador norte-americano. Co-dirigiu O Rei Leão da Disney. Trabalhou também em filmes como Stuart Little. É reconhecido por sua contribuição para a animação. Tem longa carreira no cinema infantil.'),
(35, 'Anthony Russo', 'Anthony Russo é um diretor e produtor americano. Trabalha frequentemente com seu irmão Joe Russo. Dirigiu Capitão América: O Soldado Invernal e Vingadores: Ultimato. É conhecido por blockbusters de ação. Recebeu prêmios por direção e produção.'),
(36, 'Martin Scorsese', 'Martin Scorsese é um diretor, roteirista e produtor norte-americano. É um dos cineastas mais influentes de todos os tempos. Dirigiu Taxi Driver, Os Bons Companheiros e O Lobo de Wall Street. Seu trabalho aborda crime, religião e identidade. Recebeu múltiplos prêmios internacionais.'),
(37, 'Scott Derrickson', 'Scott Derrickson cresceu em Denver , Colorado. Ele se formou na Universidade Biola com um bacharelado em Humanidades com ênfase em filosofia e literatura e um bacharelado em comunicações com ênfase em cinema e especialização em teologia. Ele completou seus estudos de pós-graduação na Escola de Cinema-Televisão da USC .'),
(38, ' Emile Ardolino', 'Emile Ardolino (1943-1993) foi um cineasta, produtor e coreógrafo americano, conhecido principalmente por dirigir sucessos como Dirty Dancing (1987) e Mudança de Hábito (1992). Ele também ganhou um Oscar de Melhor Documentário por He Makes Me Feel Like Dancin\' (1983) e foi um especialista em musicais e balés, iniciando sua carreira na televisão e teatro. Ardolino faleceu em 1993 devido a complicações da AIDS'),
(39, 'Paul Abadilla', 'Paul began his career at Pixar Animation Studios as an art intern. He has contributed to the making of several Pixar feature films including \"Elemental,\" \"Incredibles 2,\" and Academy Award©-winning films \"Brave\" and \"Inside Out.\" Additionally, Paul served as sets art director on \"Luca,\" and Academy Award©-winning film \"Soul.\" His latest contributions are featured on \"Win or Lose,\" Pixar\'s first ever original series, now available exclusively on Disney+');

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
(1, 'F1: The Movie', 3.5, '21, 16, 4', 120, 'Na década de 1990, Sonny Hayes era o piloto mais promissor da Fórmula 1 até que um acidente na pista quase encerrou sua carreira. Trinta anos depois, o proprietário de uma equipe de Fórmula 1 em dificuldades convence Sonny a voltar a correr e se tornar o melhor do mundo.', '../img/imgFilmes/filme1.jpg', 'https://www.youtube.com/embed/WKLMXlodrHw?si=apdz-8Dxrw0NMX2U', 'Apple TV', '2025', 1),
(2, 'Lilo & Stitch', 3, '10, 5, 22', 108, 'Stitch, um alienígena, chega ao planeta Terra após fugir de sua prisão e tenta se passar por um cachorro para se camuflar. As coisas mudam quando Lilo, uma travessa menina, o adota de um abrigo de animais. Juntos, eles aprendem os valores da amizade e família.', '../img/imgFilmes/filme2.jpg', 'https://www.youtube.com/embed/oLnS1Ij9-Kk?si=nPms73FAHVjvvsSU', 'Disney +, Amazon Prime Video, Google Play Filmes, Apple TV', '2025', 2),
(3, 'Um Filme Minecraft', 5, '10, 5, 2', 101, 'Um portal misterioso atrai quatro desajustados para o Overworld, uma terra das maravilhas bizarras e cúbicas que prospera com a imaginação. Para voltar para casa, eles têm que dominar o terreno enquanto embarcam em uma missão mágica com um construtor inesperado chamado Steve.', '../img/imgFilmes/filme3.jpg', 'https://www.youtube.com/embed/EVKYAAES6JQ?si=Yz4448rdA78LGBVX', 'Google Play Filmes, Amazon Prime Video, Apple TV', '2025', 3),
(4, 'O Macaco', 2, '8, 34, 4', 98, 'Irmãos gêmeos encontram um misterioso macaco de corda. Após a descoberta, uma série de mortes absurdas destroça a família. Muitos anos depois, o macaco inicia uma nova onda de assassinatos, forçando os irmãos a enfrentar o brinquedo amaldiçoado.', '../img/imgFilmes/filme4.jpg', 'https://www.youtube.com/embed/husMGbXEIho?si=BeRe__w8ezK3iotf', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2025', 4),
(5, 'Capitão America: Admiravel Mundo Novo', 2, '27, 1, 6', 118, 'Sam se vê no meio de um incidente internacional após se encontrar com o Presidente Thaddeus Ross. Ele precisa descobrir a razão por trás de um nefasto complô global antes que o verdadeiro mentor faça o mundo inteiro ver vermelho.', '../img/imgFilmes/filme5.jpg', 'https://www.youtube.com/embed/SCqjO_6HWuk?si=kM9GunuJrNw-r4N7', 'Disney+', '2025', 5),
(6, 'Anora', 1.3, '4, 9, 30', 139, 'Anora, uma jovem stripper do Brooklyn, conhece o filho de um oligarca russo na boate em que trabalha. Os dois engatam um improvável romance e Anora vive uma história de Cinderela contemporânea por alguns dias.', '../img/imgFilmes/filme6.jpg', 'https://www.youtube.com/embed/K3f7jj8yJTo?si=c8Sf-ia6rU1xqu0U', 'Apple TV, Amazon Prime Video, Google Play Filmes', '2025', 6),
(7, 'Paddington: Uma Aventura na Floresta', 4, '3, 22, 2', 105, 'Paddington e sua família adotiva, os Browns, decidem visitar sua tia Lucy no Peru, mas as circunstâncias os levam a desventuras na Floresta Amazônica e nas montanhas do Peru.', '../img/imgFilmes/filme7.jpg', 'https://www.youtube.com/embed/gGhEkjrKI0w?si=LmcWb7MOL64r_Bb8', 'HBO Max, Amazon Prime Video, Apple TV, Google Play Filmes', '2025', 7),
(8, 'A Substância', 3.1, '7, 6, 34', 140, 'Elisabeth Sparkle, renomada por um programa de aeróbica, enfrenta um golpe devastador quando seu chefe a demite. Em meio ao seu desespero, um laboratório lhe oferece uma substância que promete transformá-la em uma versão aprimorada.', '../img/imgFilmes/filme8.jpg', 'https://www.youtube.com/embed/LNlrGhBpYjc?si=_F483ZoYc791dXB3', 'Amazon Prime Video, Apple TV', '2024', 8),
(9, 'Duna Parte II', 5, '6, 53, 4', 166, 'Paul Atreides se une a Chani e aos Fremen enquanto busca vingança contra os conspiradores que destruíram sua família. Enfrentando uma escolha entre o amor de sua vida e o destino do universo, ele deve evitar um futuro terrível que só ele pode prever.', '../img/imgFilmes/filme9.jpg', 'https://www.youtube.com/embed/QqmbrvluQRA?si=AdlkYZV-sJ9FYQXX', 'HBO Max, Apple TV, Amazon Prime Video, Google Play Filmes', '2024', 9),
(10, 'Eu vi o Brilho da TV', 2.6, '45, 29, 56', 100, 'Owen começa a assistir a um programa misterioso por influência de sua amiga Maddy. Mas o que parecia apenas uma série, revela os horrores do mundo sobrenatural. Diante do brilho fraco da TV, o vínculo de Owen com a realidade começa a se romper.', '../img/imgFilmes/filme10.jpg', 'https://www.youtube.com/embed/kymDzCgPwj0?si=i3yQlskxBlx0cSp8', 'HBO Max, Amazon Prime Video, Apple TV, Google Play Filmes', '2024', 10),
(11, 'Rivais', 3.3, '4, 21, 9', 131, 'Um campeão de tênis do Grand Slam se vê do outro lado da rede do outrora promissor e agora esgotado Patrick, seu ex-melhor amigo e ex-namorado de sua esposa.', '../img/imgFilmes/filme11.jpg', 'https://www.youtube.com/embed/5bpSCdI7KV4?si=6OLAx6saFYjbPsBn', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2024', 11),
(12, 'Nosferatu', 3.6, '7, 15, 17', 132, 'Uma jovem noiva é deixada sob os cuidados de amigos quando seu marido viaja para a Transilvânia para um encontro com o Conde Orlok. Atormentada por visões terríveis e uma crescente sensação de pavor, ela logo encontra uma força maligna que está muito além de sua compreensão.', '../img/imgFilmes/filme12.jpg', 'https://www.youtube.com/embed/moIrYMjS0nI?si=NpWHOJIZXJkVoIB5', 'Google Play Filmes, Amazon Prime Video, Apple TV', '2024', 12),
(13, 'Alien: Romulus', 4, '6, 7, 8', 119, 'Um grupo de jovens colonizadores espaciais se aventuram nas profundezas de uma estação espacial abandonada. Lá, eles descobrem uma forma de vida aterrorizante, forçando-os a lutar por sua sobrevivência.', '../img/imgFilmes/filme13.jpg', 'https://www.youtube.com/embed/GTNMt84KT0k?si=Xs5E-PaCliEQ_GrN', 'Disney +', '2024', 13),
(14, 'Furiosa: Uma Saga Mad Max', 4.1, '1, 24, 6', 148, 'A jovem Furiosa cai nas mãos de uma grande horda de motoqueiros liderada pelo senhor da guerra Dementus. Varrendo Wasteland, eles encontram a Cidadela, presidida pelo Immortan Joe. Enquanto os dois tiranos lutam pelo domínio, Furiosa logo se vê em uma batalha ininterrupta para voltar para casa.', '../img/imgFilmes/filme14.jpg', 'https://www.youtube.com/embed/HQOQTNVdxb8?si=CL3njV77N2BE3DGE', 'HBO Max, Apple TV, Google Play Filmes', '2024', 14),
(15, 'Oppenheimer', 4.4, '16, 42, 20', 181, 'O físico J. Robert Oppenheimer trabalha com uma equipe de cientistas durante o Projeto Manhattan, levando ao desenvolvimento da bomba atômica.', '../img/imgFilmes/filme15.jpg', 'https://www.youtube.com/embed/F3OxA9Cz17A?si=fe9hWziIoPbnIMjl', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2023', 15),
(16, 'Barbie', 3.4, '5, 3, 43', 114, 'Depois de ser expulsa da Barbieland por ser uma boneca de aparência menos do que perfeita, Barbie parte para o mundo humano em busca da verdadeira felicidade.', '../img/imgFilmes/filme16.jpg', 'https://www.youtube.com/embed/5CjOjZSKrqE?si=jgkpwlGtAD-TD036', 'HBO Max, Apple TV, Amazon Prime Video, Google Play Filmes', '2023', 16),
(17, 'Homem-Aranha: Através do Aranhaverso', 4.4, '10, 27, 2', 140, 'Depois de se reunir com Gwen Stacy, Homem-Aranha é jogado no multiverso. Lá, o super-herói aracnídeo encontra uma numerosa equipe encarregada de proteger sua própria existência.', '../img/imgFilmes/filme17.jpg', 'https://www.youtube.com/embed/ayKgqMTGusk?si=z2MxVCkttutzrVvI', 'Amazon Prime Video, Apple TV, Youtube, Google Play Filmes', '2023', 17),
(18, 'John Wick 4: Baba Yaga', 4.4, '1, 49, 8', 169, 'O ex-assassino de aluguel John Wick é procurado pelo mundo todo e a recompensa por sua captura aumenta cada vez mais. Wick descobre um caminho para derrotar a Alta Cúpula, mas antes de conquistar sua liberdade, ele precisa enfrentar um novo inimigo com alianças poderosas e forças que transformam velhos amigos em inimigos.', '../img/imgFilmes/filme18.jpg', 'https://www.youtube.com/embed/qEVUtrk8_B4?si=Lrl4YdxkMFPOZVSH', 'Telecine, Amazon Prime Video, Youtube, Apple TV, Google Play Filmes', '2023', 18),
(19, 'Infestação', 2.6, '7, 31, 6', 105, 'Apaixonado por animais exóticos, Kaleb traz para casa uma aranha venenosa, mas ela acidentalmente foge. Logo, seus vizinhos começam a lutar contra um exército de aranhas mortais e que rapidamente se reproduzem.', '../img/imgFilmes/filme19.jpg', 'https://www.youtube.com/embed/LR-uiy20_zM?si=cE9JZZxpi7zaMVz-', 'Amazon Prime Video, Apple TV, Youtube, Google Play Filmes', '2023', 19),
(20, 'Super Mario Bros: O Filme', 4.5, '10, 5, 3', 92, 'Mario e seu irmão Luigi são encanadores do Brooklyn, em Nova York. Um dia, eles vão parar no reino dos cogumelos, governado pela Princesa Peach. O local é ameaçado por Bowser, rei dos Koopas, que faz de tudo para conseguir reinar em todos os lugares.', '../img/imgFilmes/filme20.jpg', 'https://www.youtube.com/embed/Hgupo95fulk?si=PfkbRvo4vpl7OvhZ', 'Amazon Prime Video, Apple TV, Google Play Filmes', '2023', 20),
(21, 'Missão Impossível 7: Acerto de Contas Parte I', 4.5, '1, 44, 8', 163, 'Ethan Hunt e sua equipe devem rastrear uma nova arma que pode ameaçar toda a humanidade se cair em mãos erradas. Com o destino do mundo em jogo, se inicia uma corrida mortal ao redor do globo. Confrontado por um inimigo misterioso e poderoso, Ethan é forçado a considerar que talvez nada importe mais do que a missão, nem mesmo as vidas daqueles com quem ele mais se importa.', '../img/imgFilmes/filme21.jpg', 'https://www.youtube.com/embed/avz06PDqDbM?si=D8E90LBZmhELOexp', 'Amazon Prime Video, Apple TV, Paramount +, Google Play Filmes', '2023', 21),
(22, 'A Origem', 4.8, '1, 2, 6', 148, 'Cobb lidera uma equipe que invade sonhos para plantar ideias na mente.  \r\n Dividido entre missões e suas lembranças, ele luta para voltar para casa.  \r\n Cada camada de sonho aumenta os riscos e os espetaculares efeitos visuais.  \r\n Um thriller cerebral que mistura ação com emoção profunda.', '../img/imgFilmes/filme22.jpg', 'https://www.youtube.com/embed/R_VX0e0PX90', 'Netflix, Amazon Prime', '2010', 15),
(23, 'Matrix', 4.8, '6, 1, 26', 136, 'Neo descobre que a realidade é uma simulação controlada por máquinas.  \r\n Ele é recrutado pela resistência liderada por Morpheus para libertar a humanidade.  \r\n Entre lutas icônicas e filosofia, o filme questiona a percepção humana.  \r\n Um marco da ficção científica com estilo cyberpunk e efeitos revolucionários.', '../img/imgFilmes/filme23.jpg', 'https://www.youtube.com/embed/vKQi3bBA1y8', 'Netflix, Amazon Prime', '1999', 22),
(24, 'Gladiador', 4.5, '1, 4, 20', 155, 'Maximus é um general traído e torna-se escravo antes de virar gladiador.  \r\n No Coliseu, ele busca justiça e vingança contra o imperador corrupto.  \r\n A história mistura honra, perda e espetaculares cenas de batalha.  \r\n Um épico que ressoa até hoje com emoção e valores antigos.', '../img/imgFilmes/filme24.jpg', 'https://www.youtube.com/embed/owK1qxDselE', 'Netflix', '2000', 23),
(25, 'Titanic', 4, '9, 4, 41', 195, 'Jack e Rose vivem um amor proibido a bordo do luxuoso Titanic.  \r\n A tragédia se aproxima quando o navio colide com um iceberg.  \r\n Entre romance e horror, o filme retrata coragem e desespero.  \r\n Uma das maiores produções românticas e visuais do cinema.', '../img/imgFilmes/filme25.jpg', 'https://www.youtube.com/embed/EXL0TQVXLBQ', 'Star+', '1997', 24),
(26, 'Mad Max: Estrada da Fúria', 4.3, '1, 25, 2', 120, 'Num mundo árido, Max e Furiosa ajudam um grupo de mulheres a escapar.  \r\n Perseguições intensas por estradas cheias de perigos.  \r\n O filme mistura ação quase sem pausa com narrativa visual impactante.  \r\n Uma reinvenção do gênero pós-apocalíptico, cheia de adrenalina.', '../img/imgFilmes/filme26.jpg', 'https://www.youtube.com/embed/hEJnMQG9ev8', 'HBO Max', '2015', 14),
(27, 'O Senhor dos Anéis: A Sociedade do Anel', 4.9, '5, 2, 53', 178, 'Frodo e seus amigos começam a jornada para destruir o Um Anel.  \r\n A Sociedade viaja por lugares perigosos na Terra-média.  \r\n Entre magos, elfos e batalhas, a união enfrenta ameaças crescentes.  \r\n Um épico de fantasia que definiu gerações e impacto cultural.', '../img/imgFilmes/filme27.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4', 'HBO Max', '2001', 25),
(28, 'Coringa', 4.6, '4, 13, 35', 122, 'Arthur Fleck luta contra depressão em uma Gotham cruel.  \r\n Desprezado socialmente, ele se torna o icônico vilão.  \r\n O filme explora saúde mental, envelhecimento e violência urbana.  \r\n Uma interpretação intensa e perturbadora de um anti-herói.', '../img/imgFilmes/filme28.jpg', 'https://www.youtube.com/embed/zAGVQLHvwOY', 'HBO Max', '2019', 26),
(29, 'Parasita', 4.7, '4, 35, 43', 132, 'Uma família pobre se infiltra na casa de uma família rica.  \r\n O que começa como subterfúgio torna-se uma espiral inesperada.  \r\n O filme mistura humor, suspense e crítica social elegante.  \r\n Vencedor do Oscar, destaca as desigualdades com precisão.', '../img/imgFilmes/filme29.jpg', 'https://www.youtube.com/embed/SEUXfv87Wpk', 'Globoplay, Telecine', '2019', 27),
(30, 'Pantera Negra', 4.2, '27, 1, 6', 134, 'T’Challa retorna a Wakanda para assumir o trono real.  \r\n Ele enfrenta desafios internos e inimigos poderosos.  \r\n Wakanda, rica em tecnologia, representa poder e cultura vibrante.  \r\n Um marco da representatividade no universo de super-heróis.', '../img/imgFilmes/filme30.jpg', 'https://www.youtube.com/embed/xjDjIWPwcPU', 'Disney+', '2018', 28),
(31, 'Clube da Luta', 4.7, '4, 35, 49', 139, 'Um narrador entediado forma um clube de luta com Tyler Durden.  \r\n A subversão da existência cotidiana o leva à anarquia.  \r\n Entre filosofia, humor negro e violência, questiona identidade.  \r\n Um filme provocativo que virou fenômeno cultural.', '../img/imgFilmes/filme31.jpg', 'https://www.youtube.com/embed/qtRKdVHc-cE', 'Star+', '1999', 29),
(32, 'Um Sonho de Liberdade', 4.8, '1, 4, 20', 142, 'Na prisão de Shawshank, o banqueiro Andy Dufresne é condenado por um crime que não cometeu.\nEnquanto cumpre pena, faz amizade com Red, um preso influente na carceragem.\nJuntos, enfrentam a dura rotina prisional e descobrem esperança em pequenas coisas.\nAndy planeja uma fuga meticulosa ao longo dos anos.\nA história evolui para um poderoso retrato de redenção e liberdade emocional.', '../img/imgFilmes/filme32.jpg', 'https://www.youtube.com/embed/NmzuHjWmXOc', 'Netflix, Telecine Play', '1994', 30),
(33, 'O Poderoso Chefão', 4.8, '1, 13, 20', 175, 'Don Vito Corleone é o chefe poderoso de uma família mafiosa em Nova York.\nApós um atentado fracassado, seu filho Michael assume responsabilidades inusitadas.\nA trama se aprofunda nos conflitos de poder, lealdade e moral.\nMichael passa por uma transformação drástica em prol da família.\nUm épico do crime que marcou a história do cinema.', '../img/imgFilmes/filme33.jpg', 'https://www.youtube.com/embed/sY1S34973zA', 'Paramount+, Star+', '1972', 31),
(34, 'A Lista de Schindler', 4.8, '20, 16, 4', 195, 'Durante a Segunda Guerra Mundial, Oskar Schindler emprega judeus na sua fábrica em Cracóvia.\nEle usa sua influência para salvá-los do Holocausto.\nA lista de nomes de trabalhadores se torna sinônimo de vida.\nEm meio à barbárie, surgem atos de coragem e humanidade.\nUm relato emocionante sobre redenção e memória histórica.', '../img/imgFilmes/filme34.jpg', 'https://www.youtube.com/embed/gG22XNhtnoY', 'Netflix, HBO Max', '1993', 32),
(35, 'Forrest Gump', 4.7, '3, 4, 9', 140, 'Forrest, com QI baixo, conta sua saga desde a infância até se tornar figura central em eventos históricos.\nParticipa da Guerra do Vietnã, conhece presidentes e influencia a cultura pop.\nSeu amor por Jenny é constante apesar dos altos e baixos da vida.\nA inocência de Forrest contrasta com o contexto turbulento dos EUA.\nUm filme sobre destino, amizade e simplicidade tocante.', '../img/imgFilmes/filme35.jpg', 'https://www.youtube.com/embed/bLvqoHBptjg', 'Amazon Prime Video, HBO Max', '1994', 33),
(36, 'O Rei Leão', 4.7, '2, 10, 22', 89, 'O leãozinho Simba sonha em se tornar rei de uma grande savana africana.\nApós a morte de seu pai, ele foge, sentindo culpa.\nFaz amigos como Timão e Pumba e descobre sua coragem.\nRetorna para enfrentar seu tio Scar e reivindicar seu lugar.\nUma jornada musical sobre crescimento, responsabilidade e legado.', '../img/imgFilmes/filme36.jpg', 'https://www.youtube.com/embed/7TavVZMewpY', 'Disney+, Telecine Play', '1994', 34),
(37, 'À Espera de Um Milagre', 5, '1, 4, 5', 189, 'Na prisão, o guarda Paul descobre que o gigante John Coffey tem poderes de cura.\nCoffey, condenado injustamente, transforma vidas ao seu redor.\nO filme mistura sofrimento, fé e milagres em um ambiente opressor.\nPaul e Coffey desenvolvem laços profundos além da hierarquia carcerária.\nUma fábula sensível sobre compaixão e o poder de acreditar no impossível.', '../img/imgFilmes/filme37.jpg', 'https://www.youtube.com/embed/Ki4haFrqSrw', 'Netflix, Now', '1999', 30),
(38, 'O Senhor dos Anéis: O Retorno do Rei', 4.7, '2, 5, 53', 201, 'A Guerra do Anel chega ao auge com a marcha de Sauron contra Gondor.\nGandalf e Pippin viajam para Minas Tirith para defender a cidade.\nFrodo e Sam enfrentam perigos mortais em Mordor para destruir o Um Anel.\nHeróis surgem em batalhas épicas decisivas pelo destino da Terra Média.\nUm desfecho grandioso para trilogia consagrada.', '../img/imgFilmes/filme38.jpg', 'https://www.youtube.com/embed/r5X-hFf6Bwo', 'Amazon Prime Video, HBO Max', '2003', 25),
(39, 'O Cavaleiro das Trevas', 4.7, '1, 7, 8', 152, 'Batman enfrenta o caos instaurado pelo Coringa em Gotham City.\nCom apoio de Gordon e Dent, busca restaurar a ordem.\nO Coringa lança desafios morais e coloca o vigilante contra seus limites.\nAs fronteiras entre heroísmo e loucura se confundem.\nUm thriller de ação com dilemas éticos intensos.', '../img/imgFilmes/filme39.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY', 'Netflix, HBO Max', '2008', 15),
(40, 'Vingadores: Ultimato', 5, '1, 2, 6', 181, 'Após o estalo de Thanos, os heróis remanescentes planejam reverter o desastre.\nEles viajam no tempo para coletar as Joias do Infinito.\nSacrifícios pessoais e batalhas épicas movem o clímax da saga.\nO destino do universo está em jogo num confronto final.\nUm épico de super-heróis com emoção e fan service.', '../img/imgFilmes/filme40.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', 'Disney+, Star+', '2019', 35),
(41, 'Taxi Driver', 4.4, '1, 4, 8', 114, 'Travis Bickle é um taxista solitário pela Nova York decadente dos anos 70.\nSofre de insônia e repulsa pelo comportamento urbano.\nDesenvolve obsessão por salvar Iris, jovem prostituta.\nSua instabilidade cresce entre violência e idealização moral.\nUm estudo psicológico angustiante sobre alienação urbana.', '../img/imgFilmes/filme41.jpg', 'https://www.youtube.com/embed/UUxD4-dEzn0', 'Amazon Prime Video, Paramount+', '1976', 36),
(42, 'O telefone preto', 4.7, '1, 1, 1', 102, 'Finney Shaw, de 13 anos, é sequestrado por um sádico assassino mascarado e mantido em um porão à prova de som. Até que um telefone desconectado na parede começa a tocar, e ele logo descobre que pode ouvir as vozes das vítimas anteriores do maníaco.', '../img/imgFilmes/filme42.jpg', 'https://www.youtube.com/embed/dCAbPQnFAU4?si=1PSRX63gQJwV0jM9', 'Prime video, Apple Tv', '2022', 32),
(43, 'O telefone preto', 4.7, '7, 8, 15', 102, 'Finney Shaw, de 13 anos, é sequestrado por um sádico assassino mascarado e mantido em um porão à prova de som. Até que um telefone desconectado na parede começa a tocar, e ele logo descobre que pode ouvir as vozes das vítimas anteriores do maníaco.', '../img/imgFilmes/filme43.jpg', 'https://www.youtube.com/embed/dCAbPQnFAU4?si=1PSRX63gQJwV0jM9', 'Prime video, Apple Tv', '2022', 1),
(44, 'Os Simpsons: O Filme', 4.9, '3, 1, 15', 87, 'Homer Simpson polui o lago de Springfield e acaba causando sérios danos para a cidade. Para amenizar o problema, a solução é colocar toda a cidade dentro de uma bolha, se isolando do resto do mundo.', '../img/imgFilmes/filme44.jpg', 'https://www.youtube.com/embed/1Tro6HjUj6Y?si=3r1mxVzWvmhXImMR', 'Disney+', '2007', 29),
(45, 'Mamma Mia!', 4.8, '12, 1, 3', 108, 'Donna, a proprietária de um hotel nas ilhas gregas, está preparando o casamento de sua filha com a ajuda de duas amigas. Enquanto isso, a noiva Sophie convida três ex-namorados de sua mãe na esperança de conhecer seu verdadeiro pai.', '../img/imgFilmes/filme45.jpg', 'https://www.youtube.com/embed/YClcvscKf3w?si=O6C6SC8t_ojTKYdk', 'Prime video', '2008', 25),
(46, 'As marvels', 2.3, '1, 3, 12', 105, 'Capitã Marvel enfrenta as consequências de um universo desestabilizado quando seus poderes se entrelaçam com Kamala Khan e Monica Rambeau após um acidente em um buraco de minhoca anômalo.', '../img/imgFilmes/filme46.jpg', 'https://www.youtube.com/embed/YxL9wTkEgSY?si=v_cHAKbUsX9IroJl', 'Disney+', '2023', 35),
(47, 'Dirty Dancing: Ritmo Quente', 4.8, '1, 9, 12', 100, 'Na esperança de curtir sua juventude, Frances \"Baby\" Houseman fica decepcionada ao descobrir que vai passar o verão de 1963 com os pais em um resort na sonolenta região de Catskills. A sua sorte muda quando ela conhece o instrutor de dança do local, Johnny Castle. O hábil dançarino escolhe Frances como sua nova parceira de dança e os dois acabam se apaixonando, mas precisam enfrentar uma série de preconceitos e a resistência dos pais da garota.', '../img/imgFilmes/filme47.jpg', 'https://www.youtube.com/embed/U1tw7CJHYJQ?si=VJ5sxotb9Uwqzn8S', 'Apple Tv, Prime video', '1987', 38),
(48, 'Soul', 4.8, '12, 28, 10', 100, 'Joe é um professor de música do ensino médio apaixonado por jazz, cuja vida não foi como ele esperava. Quando ele viaja a uma outra realidade para ajudar outra pessoa a encontrar sua paixão, ele descobre o verdadeiro sentido da vida.', '../img/imgFilmes/filme48.jpg', 'https://www.youtube.com/embed/xOsLIiBStEs?si=4yeNvWPtmJeJhGrR', 'Disney+', '2020', 39);

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
-- Estrutura para tabela `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_filmes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `playlist`
--

INSERT INTO `playlist` (`id`, `nome`, `descricao`, `id_usuario`, `id_filmes`) VALUES
(1, 'Assistidos', 'Filmes já assistidos', 73, NULL),
(2, 'Favoritos', 'Filmes favoritos', 73, NULL);

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
(65, 'Hiran de Souza Martins', 'hiran.m@aluno.ifsp.edu.br', 'Souz@2007', '2007-01-17', '../img/imgUsuario/user65.png'),
(66, 'Pedro', 'luiz.vogado@aluno.ifsp.edu.br', '123', '2008-05-03', '../img/imgUsuario/user66.png'),
(72, 'Daniel', 'meira@gmail.com', '123a', '1991-05-10', '../img/imgUsuario/user72.png'),
(73, 'Yuri', 'yurielailal@gmail.com', '1234', '2017-06-21', '../img/imgUsuario/user73.png');

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
-- Índices de tabela `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
