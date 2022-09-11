--menu table

create table menu
(
	menu_id serial primary key
	, menu_name text not null
	, menu_url text
	, menu_kbn int2
	, menu_affiliation int2
	, del_flg bool
	, created_date_time timestamp
	, updated_date_time timestamp
);
comment on column menu.menu_kbn is '0:상위메뉴 1:하위메뉴';
comment on column menu.menu_affiliation_id is '소속되는 상인메뉴아이디';

--menu table row
insert into menu
(menu_name, menu_url, menu_kbn, menu_affiliation_id, del_flg, created_date_time, updated_date_time)
values
('ABOUT US'	    ,'http://127.0.0.1:8000/introduce',             0,	null, false, current_timestamp, current_timestamp)
,('BEST'	        ,'http://127.0.0.1:8000/best',	            0,	null, false, current_timestamp, current_timestamp)
,('ONLINE SHOP'	,'http://127.0.0.1:8000/shop/skincare',	        0,	null, false, current_timestamp, current_timestamp)
,('COMMUNITY'	    ,'http://127.0.0.1:8000/community/notice',  0,	null, false, current_timestamp, current_timestamp)
,('Skin Care'	    ,'http://127.0.0.1:8000/shop/skincare',	    1,	3, false, current_timestamp, current_timestamp)
,('Make up'	    ,'http://127.0.0.1:8000/shop/makeup',	        1,	3, false, current_timestamp, current_timestamp)
,('Body & Hair'	,'http://127.0.0.1:8000/shop/bodyhair',	        1,	3, false, current_timestamp, current_timestamp)
,('Accessories'	,'http://127.0.0.1:8000/shop/accessories',	    1,	3, false, current_timestamp, current_timestamp)
,('Nails'	        ,'http://127.0.0.1:8000/shop/nails',	    1,	3, false, current_timestamp, current_timestamp)
,('Notice'        ,'http://127.0.0.1:8000/community/notice',    1,	4, false, current_timestamp, current_timestamp)
,('Q&A'	        ,'http://127.0.0.1:8000/community/userquery',	1,	4, false, current_timestamp, current_timestamp)
,('Event' 	    ,'http://127.0.0.1:8000/community/event',	    1,	4, false, current_timestamp, current_timestamp)
,('REVIEW'	    ,'http://127.0.0.1:8000/review',	            0,	null, false, current_timestamp, current_timestamp)


-- user table
create table public.user
(
    user_id serial primary key 
    , user_indevidual_id text not null
    , user_address text not null
    , user_tel text not null
    , user_name text not null
    , del_flg boolean not null
    , updated_date_time timestamp not null
    , created_date_time timestamp not null
);

comment on table public.user is 'web site user table';
alter table "user" 
add constraint up01_user_id unique (user_indevidual_id);


insert into public.user
(user_indevidual_id , user_address, user_tel, user_name, del_flg, updated_date_time, created_date_time)
values 
('admin_0',	'office','08011112222',	'kimbaeksub', false, current_timestamp, current_timestamp);


-- user order table
create table public.user_order
(
	user_order_id serial primary key
	, user_id int8 not null
	, user_order_amount int4 not null
	, cancel_flg boolean not null
	, updated_date_time timestamp not null
	, created_date_time timestamp not null
)
comment on table public.user_order is 'user order table';

create index user_order_index_01
on user_order(user_id)


-- user order table detail
create table public.user_order_detail
(
	user_order_detail_id serial primary key
	, user_order_id int8 not null
	, product_id int8 not null
	, product_amount int not null
	, cancel_flg boolean not null
	, updated_date_time timestamp
	, created_date_time timestamp 
)

create index user_order_detail_index_01
on public.user_order_detail(user_order_id)

create index user_order_detail_index_02
on public.user_order_detail(user_order_id)


insert into user_order_detail
(
	user_order_id
	, product_id 
	, product_amount 
	, cancel_flg 
	, updated_date_time 
	, created_date_time 
)
values 
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 3, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 1, 5, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 1, 9, false, current_timestamp, current_timestamp),
(1, 2, 1, false, current_timestamp, current_timestamp),
(1, 2, 5, false, current_timestamp, current_timestamp),
(1, 2, 2, false, current_timestamp, current_timestamp),
(1, 2, 2, false, current_timestamp, current_timestamp),
(1, 2, 1, false, current_timestamp, current_timestamp),
(1, 2, 1, false, current_timestamp, current_timestamp),
(1, 2, 1, false, current_timestamp, current_timestamp),
(1, 2, 2, false, current_timestamp, current_timestamp),
(1, 4, 2, false, current_timestamp, current_timestamp),
(1, 4, 2, false, current_timestamp, current_timestamp),
(1, 3, 1, false, current_timestamp, current_timestamp),
(1, 3, 1, false, current_timestamp, current_timestamp),
(1, 3, 2, false, current_timestamp, current_timestamp),
(1, 3, 1, false, current_timestamp, current_timestamp),
(1, 3, 2, false, current_timestamp, current_timestamp),
(1, 3, 2, false, current_timestamp, current_timestamp),
(1, 3, 3, false, current_timestamp, current_timestamp),
(1, 3, 2, false, current_timestamp, current_timestamp),
(1, 3, 1, false, current_timestamp, current_timestamp),
(1, 3, 5, false, current_timestamp, current_timestamp),
(1, 5, 2, false, current_timestamp, current_timestamp),
(1, 5, 2, false, current_timestamp, current_timestamp),
(1, 5, 1, false, current_timestamp, current_timestamp),
(1, 5, 9, false, current_timestamp, current_timestamp),
(1, 5, 1, false, current_timestamp, current_timestamp),
(1, 5, 5, false, current_timestamp, current_timestamp),
(1, 5, 2, false, current_timestamp, current_timestamp),
(1, 6, 2, false, current_timestamp, current_timestamp),
(1, 7, 1, false, current_timestamp, current_timestamp),
(1, 8, 1, false, current_timestamp, current_timestamp),
(1, 9, 1, false, current_timestamp, current_timestamp),
(1, 10, 2, false, current_timestamp, current_timestamp),
(1, 11, 2, false, current_timestamp, current_timestamp),
(1, 12, 2, false, current_timestamp, current_timestamp),
(1, 12, 1, false, current_timestamp, current_timestamp),
(1, 12, 1, false, current_timestamp, current_timestamp),
(1, 12, 2, false, current_timestamp, current_timestamp),
(1, 12, 1, false, current_timestamp, current_timestamp),
(1, 11, 2, false, current_timestamp, current_timestamp),
(1, 12, 2, false, current_timestamp, current_timestamp),
(1, 21, 3, false, current_timestamp, current_timestamp),
(1, 13, 2, false, current_timestamp, current_timestamp),
(1, 13, 1, false, current_timestamp, current_timestamp),
(1, 13, 5, false, current_timestamp, current_timestamp),
(1, 13, 2, false, current_timestamp, current_timestamp),
(1, 14, 2, false, current_timestamp, current_timestamp),
(1, 14, 1, false, current_timestamp, current_timestamp),
(1, 15, 9, false, current_timestamp, current_timestamp),
(1, 26, 1, false, current_timestamp, current_timestamp),
(1, 24, 5, false, current_timestamp, current_timestamp),
(1, 25, 2, false, current_timestamp, current_timestamp),
(1, 26, 2, false, current_timestamp, current_timestamp),
(1, 27, 1, false, current_timestamp, current_timestamp),
(1, 28, 1, false, current_timestamp, current_timestamp),
(1, 24, 1, false, current_timestamp, current_timestamp),
(1, 25, 2, false, current_timestamp, current_timestamp),
(1, 31, 2, false, current_timestamp, current_timestamp),
(1, 11, 2, false, current_timestamp, current_timestamp),
(1, 11, 1, false, current_timestamp, current_timestamp),
(1, 11, 1, false, current_timestamp, current_timestamp),
(1, 12, 2, false, current_timestamp, current_timestamp),
(1, 26, 1, false, current_timestamp, current_timestamp),
(1, 21, 2, false, current_timestamp, current_timestamp),
(1, 28, 2, false, current_timestamp, current_timestamp),
(1, 29, 3, false, current_timestamp, current_timestamp),
(1, 29, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 21, 5, false, current_timestamp, current_timestamp),
(1, 21, 2, false, current_timestamp, current_timestamp),
(1, 21, 2, false, current_timestamp, current_timestamp),
(1, 1, 1, false, current_timestamp, current_timestamp),
(1, 21, 9, false, current_timestamp, current_timestamp),
(1, 22, 1, false, current_timestamp, current_timestamp),
(1, 22, 5, false, current_timestamp, current_timestamp),
(1, 27, 2, false, current_timestamp, current_timestamp),
(1, 25, 2, false, current_timestamp, current_timestamp),
(1, 24, 1, false, current_timestamp, current_timestamp),
(1, 23, 1, false, current_timestamp, current_timestamp),
(1, 22, 1, false, current_timestamp, current_timestamp),
(1, 17, 2, false, current_timestamp, current_timestamp)


-- instargram_img
create table public.instargram_img
(
	instargram_img_id serial primary key
	, instargram_url text not null
	, del_flg boolean not null
	, created_date_time timestamp not null
	, updated_date_time timestamp not null
)
insert into public.instargram_img
(
    instargram_url
    , del_flg
    , created_date_time
    , updated_date_time
)
values
('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)
, ('https://via.placeholder.com/700',	false, current_timestamp, current_timestamp)


-- product
-- 상품 입력
create table product 
(
	product_id serial primary key
	, product_name text not null
	, product_price int4 not null
	, product_explain text not null
	, product_code text not null 
	, product_kind_kbn int2 not null
	, del_flg bool not null
	, updated_datetime timestamp not null
	, created_datetime timestamp not null
)

insert into product
(
    product_name
    , product_price
    , product_explain
    , product_code
    , product_kind_kbn
    , del_flg
    , updated_datetime
    , created_datetime
)
values
(
'Cleansing Lotion'
, 25000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe.'
, '5b4fb9585eae6'
, 1
, false
, current_timestamp
, current_timestamp
)
,(
'Brow Scissors'
, 19000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb88f78c80'
, 1
, false
, current_timestamp
, current_timestamp
),(
'West Coast Face Bronzing Serum 100ml '
, 17000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc09ab8b45'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Super Sleep 2x20ml'
, 59000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc87ccece6'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Tinted Gradual Tan Lotion 200ml'
, 93000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fbb22afcc2'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Craft Clay 50g'
, 53000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fbb2214346'
, 1
, false
, current_timestamp
, current_timestamp
),(
'High Content Lotion 120ml'
, 56000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc87d58418'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Total  Cover Cream Foundation'
, 13000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc87dca02c'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Age Delay Eye And Lip Teatment Cream 20ml'
, 73000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb8922786d'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Curl Perfected Curl Correction Milk 150ml'
, 65000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb959657bf'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Natural Finish Oil Free Foundation'
, 23000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb8918e232'
, 1
, false
, current_timestamp
, current_timestamp
),(
'SolarOil Cuticle Oil'
, 38000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb959edf5c'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Balancing Cleanser With Aloe Vera 200ml'
, 29000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc09b299f7'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Flat Brush Mixed  Bristle'
, 41000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb88ef2f74'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Premium 3D Faux Mink Lashes'
, 10000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb88e4e051'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Bed Time Beautl Boost 50ml'
, 85000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc09a4d8f0'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Miracle Morpher Correct It'
, 15000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8f3264c'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Nails inc Gel Effect in Chiltern Street'
, 30000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fbb23543e1'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Perfect Legs Skin Protector'
, 53000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8d752e3'
, 1
, false
, current_timestamp
, current_timestamp
),(
'All In One Hair Treatment 150ml'
, 32000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8cbdf0f'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Smooth Anti Frizz Shampoo'
, 45000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce9004ffc'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Lipstick'
, 35000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb95903922'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Liquid Metal Liner'
, 12000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8ddd131'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Nourishing Nail & Cuticle Serum'
, 32000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8e54246'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Plush Lip Matte'
, 45000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8eba121'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Hand Conditioner 114g'
, 96000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce8fb0bf2'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Heroine Nail Lacquer'
, 45000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fce907f376'
, 1
, false
, current_timestamp
, current_timestamp
),(
'High content steam cream'
, 27000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc87e6432b'
, 1
, false
, current_timestamp
, current_timestamp
),(
'Sparkle Like A Unicorn'
, 35000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fc87ecd242'
, 1
, false
, current_timestamp
, current_timestamp
),(
'The Body'
, 65000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb890e328b'
, 1
, false
, current_timestamp
, current_timestamp
),(
'The Large Powder Brush'
, 25000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb89061063'
, 1
, false
, current_timestamp
, current_timestamp
),(
'The Foundation Brush'
, 43000
, 'Vitrine products are guaranteed to benefit from the highest quality products and the most trusted brands around the globe. '
, '5b4fb88fdb8ee'
, 1
, false
, current_timestamp
, current_timestamp
)



-- 코멘트 내용
create table user_comment
(
	user_comment_id serial primary key
	, product_id int8 not null
	, auth_user_id int8 not null
	, content text not null
	, photo_id text
	, create_datetime timestamp
	, update_datetime timestamp
);
create index user_comment_index_01
on user_comment (product_id);
create index user_comment_index_02
on user_comment (auth_user_id);



create table user_inquiry
(
	user_inquiry_id serial primary key
	, auth_user_id int8 not null
	, product_id int8 not null
	, user_inquiry_complited_flg bool not null
	, user_inquiry_content text not null
	, photo_id text
	, del_flg bool not null
	, created_date_time timestamp not null
	, updated_date_time timestamp not null
);
create index user_inquiry_index_01
on user_inquiry (auth_user_id);
create index user_inquiry_index_02
on user_inquiry (product_id);



drop table user_inquiry_response;
create table user_inquiry_response
(
	user_inquiry_response_id serial primary key
	, user_inquiry_id int8 not null
	, admin_id int not null
	, content text not null
	, del_flg bool not null
	, created_date_time timestamp not null
	, updated_date_time timestamp not null
);
create index user_inquiry_response_01
on user_inquiry_response(user_inquiry_id);
create index user_inquiry_response_02
on user_inquiry_response(admin_id);

CREATE TABLE public.page_image
(
    page_image_id serial primary key
    , page_image_division int2 not null 
    , page_image_title text
    , page_image_discript text 
    , page_image_code text not null
    , del_flg boolean NOT NULL DEFAULT false
    , affiliation_num integer NOT NULL
    , updated_time timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
    , created_time timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
)



create table user_password
(
	user_password_id serial not null
	, user_indevidual_id text not null primary key
	, user_password text not null
	, del_flg bool not null
	, created_date_time timestamp not null
	, updated_date_time timestamp not null
)




create table product_heart 
(
	product_heart_id serial primary key
	, user_id int8 not null
	, product_id int8
	, del_flg bool not null
	, created_date_time timestamp not null
	, updated_date_time timestamp not null
)

