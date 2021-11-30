--1
select * from Grade;

--2

select *
from Emotion;

--3

select count(WordCount) AS counts
from poem;

--4

select * FROM  Author
where Id <=76;

--5

select count(GradeId) as 'Grade of each Author'
from Author;

--6

select count(GenderId) as 'Gender Record for Author'
from Author;

--7
select count(CharCount) as 'All poems'
from Poem;

--8

select min(CharCount) as 'Fewer Characters'
from Poem;

--9
select count(GradeId) as 'Authors in 3rd Grade'
from Author
inner join Grade on Author.GradeId = Grade.id
where Grade.Name = '3rd Grade'


--10

select count(GradeId) as 'Authors'
from Author A
inner join Grade G on A.GradeId = G.id
where G.Name = '1st Grade' and G.Name = '2nd Grade' and G.Name = '3rd Grade'

--11

select count(Poem.id) as '4th grade poems'
from Author A
left join Poem P on P.AuthorId = A.id
where Author.GradeId = 4;


--12 

select g.name, count(p.title) 'amount grade'
from Grade G
join Author A on A.GradeId = G.Id
join Poem P on P.AuthorId = A.id
group by G.Name

--13

select G.Name, count(A.Name) 'Per Grade'
from Grade G
join Author A on A.GradeId = G.id
group by G.Name

--14

select count(A.name) as 'Total Authors'
from Author A;

--15

select  top 1 count(*) PoemCount, Author.Name
from Poem
join Author on Author.id = Poem.AuthorId
group by Author.Id, Author.Name
order by PoemCount desc

--16

select count(*)
from Poem
join PoemEmotion on PoemEmotion.PoemId = Poem.Id
join Emotion on Emotion.id = PoemEmotion.EmotionId
where Emotion.Id = 3

--17

select count(*) as 'No Emotion'
from Poem
left join PoemEmotion on PoemEmotion.PoemId = Poem.id
where PoemEmotion.id IS NULL

--18

select distinct top 1 E.name, count(Pe.EmotionId) 'Number of Poems'
from Poem P
join PoemEmotion Pe on Pe.PoemId = P.Id
join Emotion E on E.Id = Pe.EmotionId
group by E.name

--19

select top 1 G.Name, count(Poem.id) as 'COUNT'
from Poem
join Author A on Poem.AuthorId = A.id
 join Grade G on G.id = A.GradeId
 Join PoemEmotion Pe on Pe.PoemId =  Poem.id
 join Emotion E on Pe.EmotionId = E.id
where E.Name = 'Joy'
group by G.Name
order by count(Poem.id) desc
