-----exercise 1 step 2

create table authors(
                        id int auto_increment primary key,
                        name varchar(100) not null unique
);

create table titles(
                       title_id int auto_increment primary key,
                       title varchar(100) not null,
                       word_count int not null,
                       views int default 0,
                       author_id int not null,
                       constraint fk_author
                           foreign key (author_id) references authors(id)
);

----exercise 1 step3

insert into  authors(name)
values
   ('Maria Charlotte'),
   ('Juan Perez'),
   ('Gemma Alcocer');

insert into titles(title, word_count, views, author_id)
values
    ('Best Paint Colors', 814,14,1),
    ('Small Space Decorating Tips', 1146,221,2),
    ('Hot Accessories',986 ,105,1),
    ('Mixing Textures',765 ,22,1),
    ('Kitchen Refresh',1242 ,307,2),
    ('Homemade Art Hacks',1002 ,193,1),
    ('Refinishing Wood Floors',1571 ,7542,3);
